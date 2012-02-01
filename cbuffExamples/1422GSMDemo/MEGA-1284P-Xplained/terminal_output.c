/*******************************************************************************
*
* CIRCULAR BUFFER DEMO PROGRAM for 1422GSM MASTERS CLASS - TERMINAL OUTPUT
* MODULE
*
*******************************************************************************/

/*******************************************************************************
*
* Handles the terminal output for the circular buffer demo
*
* Filename : terminal_output.c
* Version : See 1422GSM-Demo.c
* Programmer(s) : Suart Cording aka CODINGHEAD 
* 
********************************************************************************
* Note(s) : 
* 
*******************************************************************************/

/*******************************************************************************
* Commenting notes
* ???? Question(s) regarding implementation or design specification.
* $$$$ Future function that needs to be implemented.
* @@@@ Old code to leave as-is because ....
* #### Technical issue not (satisfactorily) resolved.
*******************************************************************************/

/*******************************************************************************
*
*                           CIRCULAR BUFFER TEST PROGRAM
*
*******************************************************************************/


/*******************************************************************************
*                                 INCLUDE FILES
*******************************************************************************/
#include "..\..\..\cbuff_module\cbuff.h"
#include "vt100.h"

/*******************************************************************************
*                                  CONFIG BITS
*******************************************************************************/

/*******************************************************************************
*                                 LOCAL DEFINES
*******************************************************************************/

/*******************************************************************************
*                                LOCAL CONSTANTS
*******************************************************************************/
enum TERMSTATES {
    RESET_TERMINALA,
    RESET_TERMINALB,
    RESET_TERMINALC,
    RESET_TERMINALD,
    RESET_TERMINALE,
    HOME_CURSOR,
    OUTPUT_LINE_1,
    OUTPUT_LINE_2,
    OUTPUT_LINE_3A,
    OUTPUT_LINE_3B,
    OUTPUT_LINE_3C,
    OUTPUT_LINE_4A,
    OUTPUT_LINE_4B,
    OUTPUT_LINE_4C,
    OUTPUT_LINE_4D,
    OUTPUT_LINE_4E,
    OUTPUT_LINE_4F,
    OUTPUT_LINE_6A,
    OUTPUT_LINE_6B,
    OUTPUT_LINE_6C,
    OUTPUT_LINE_8A,
    OUTPUT_LINE_8B,
    OUTPUT_LINE_8C,
    OUTPUT_LINE_8D,
    OUTPUT_LINE_9A,
    OUTPUT_LINE_9B,
    OUTPUT_LINE_9C,
    OUTPUT_LINE_9D,
    OUTPUT_LINE_11,
    OUTPUT_LINE_12A,
    OUTPUT_LINE_12B,
    OUTPUT_LINE_12C,
    OUTPUT_LINE_13A,
    OUTPUT_LINE_13B,
    OUTPUT_LINE_13C,
    OUTPUT_LINE_13D,
    OUTPUT_LINE_13E,
    OUTPUT_LINE_13F
}; 

enum TERMMODE {
    MANUAL,
    AUTOMATIC
}; 

enum PRODUCERSPEED {
    TOO_HIGH,
    SPEED_OK
};      

enum BUFFERINTEGRITY {
    INTEGRITY_ERROR,
    INTEGRITY_OK
};

enum TERMFULLSCREEN {
    FULLSCREEN_YES,
    FULLSCREEN_NO
};    

const CBUFF     resetTerma[] = VT100_CLEAR_SCREEN;
const CBUFF     resetTermb[] = VT100_CURSOR_0_0;
const CBUFF     resetTermc[] = VT100_BACKGROUND_BLACK;
const CBUFF     resetTermd[] = VT100_TEXT_GREEN_BOLD;
const CBUFF     resetTerme[] = VT100_HIDE_CURSOR;

const CBUFF     termLine1[]  = 
           "CBUFF Demo for MEGA-1284P Xplained 2011\n\r\n\r";
const CBUFF     termLine3a[] = "testBuffer contains ";
const CBUFF     termLine3c[] = " from 50 bytes.    \n\r";

const CBUFF     termLine4a[] = "{";
const CBUFF     termLine4c[] = "} - ";
const CBUFF     termLine4e[] = "%  \n\r";
const CBUFF     termLine4f[] = "%\r\033[1A";

const CBUFF     termLine6a[] = "Producer testBuffer fill rate : ";
const CBUFF     termLine6c[] = " bytes/second     \n\r\n\r";

const CBUFF     termLine8a[] = "Consume testBuffer: ";
const CBUFF     termLine8b[] = "Manually";
const CBUFF     termLine8c[] = " / ";
const CBUFF     termLine8d[] = "Automatically";

const CBUFF     termLine9a[] = "Consumer auto testBuffer read triggers on ";
const CBUFF     termLine9c[] = " bytes free\n\r\n\r";
const CBUFF     termLine9d[] = "                                                         \n\r\n\r";

const CBUFF     termLine11[] = "Last read buffer content:\n\r";

const CBUFF     termLine12a[]   = "{";
const CBUFF     termLine12c[]   = "}\n\r";

const CBUFF     termLine13a[]   = "Buffer Integrity: ";
const CBUFF     termLine13b[]   = "OK       ";
const CBUFF     termLine13c[]   = "*FAIL*   ";
const CBUFF     termLine13d[]   = "Producer Speed: ";
const CBUFF     termLine13e[]   = "OK        ";
const CBUFF     termLine13f[]   = "*TOO HIGH*";

const CBUFF     termReturn[] = "\n\r";


/*******************************************************************************
*                                LOCAL DATA TYPES
*******************************************************************************/
typedef struct TERMDATAOBJ {
    unsigned int            bytesInBuffer;
    unsigned int            fillRate;
    unsigned char           fillBarLength;
    unsigned char           percentFilled;
    unsigned char           emptyOnBytesFree;
    enum TERMMODE           termMode;
    unsigned int            bytesInBufferCheck;
    enum PRODUCERSPEED      producerSpeedTooHigh;
    CBUFF                   oldLastChar;
    enum BUFFERINTEGRITY    bufferIntegrity;
    enum TERMFULLSCREEN     termFullScreenUpdate;
} TERMDATA;

/*******************************************************************************
*                                  LOCAL TABLES
*******************************************************************************/


/*******************************************************************************
*                             LOCAL GLOBAL VARIABLES
*******************************************************************************/
enum TERMSTATES         termState = RESET_TERMINALA;
static TERMDATA         termData;
CBUFF                   checkBuffer[50];
static unsigned char    restartTerm = 0;

/*******************************************************************************
*                             LOCAL FUNCTION PROTOTYPES
*******************************************************************************/


/*******************************************************************************
*                            LOCAL CONFIGURATION ERRORS
*******************************************************************************/

void termInit(void)
{
    unsigned char loopCount;
    
    for (loopCount = 0; loopCount < 50; loopCount++)
    {
        checkBuffer[loopCount] = ' ';
    }
        
    termData.bytesInBuffer = 0;
    termData.fillRate = 1;
    termData.fillBarLength = 0;
    termData.percentFilled = 0;
    termData.emptyOnBytesFree = 9;
    termData.termMode = MANUAL;
    termData.bytesInBufferCheck = 0;
    termData.producerSpeedTooHigh = SPEED_OK;
    termData.bufferIntegrity = INTEGRITY_OK;
    termData.oldLastChar = 0;
    termData.termFullScreenUpdate = FULLSCREEN_YES;
}
    
/*******************************************************************************
* termOutput()
*
* Description: 
*   State machine to handle text output for terminal
*
* See also:
*
* Arguments: 
*   void
*
* Returns: 
*   void
*
* Callers: C start-up code
*
* Notes : 
*
*******************************************************************************/
void termOutput(HCBUFF hCbuff)
{
    unsigned int    uiTemp;
    CBUFF           cbuffTemp;
    CBUFF           cbuffUnits;
    CBUFF           cbuffTens;
    
    if (restartTerm)
    {
        termState = RESET_TERMINALA;
        restartTerm = 0;
    }
        
    switch(termState)
    {
                                        /**************************************/
                                        /* RESET TERMINAL                     */
                                        /**************************************/
        case RESET_TERMINALA:
            cbuffClearBuffer(hCbuff);
            if (cbuffGetSpace(hCbuff) > sizeof(resetTerma))
            {
                cbuffPutArray(hCbuff, resetTerma, sizeof(resetTerma)-1);
                termState = RESET_TERMINALB;
            }    
            break;
            
        case RESET_TERMINALB:
            if (cbuffGetSpace(hCbuff) > sizeof(resetTermb))
            {
                cbuffPutArray(hCbuff, resetTermb, sizeof(resetTermb)-1);
                termState = RESET_TERMINALC;
            }    
            break; 
            
        case RESET_TERMINALC:
            if (cbuffGetSpace(hCbuff) > sizeof(resetTermc))
            {
                cbuffPutArray(hCbuff, resetTermc, sizeof(resetTermc)-1);
                termState = RESET_TERMINALD;
            }    
            break;  
            
        case RESET_TERMINALD:
            if (cbuffGetSpace(hCbuff) > sizeof(resetTermd))
            {
                cbuffPutArray(hCbuff, resetTermd, sizeof(resetTermd)-1);
                termState = RESET_TERMINALE;
            }    
            break;   
        
        case RESET_TERMINALE:
            if (cbuffGetSpace(hCbuff) > sizeof(resetTerme))
            {
                cbuffPutArray(hCbuff, resetTerme, sizeof(resetTerme)-1);
                termState = OUTPUT_LINE_1;
            }    
            break; 
                                        /**************************************/
                                        /* HOME CURSOR                        */
                                        /**************************************/        
        case HOME_CURSOR:
            if (cbuffGetSpace(hCbuff) > sizeof(resetTermb))
            {
                cbuffPutArray(hCbuff, resetTermb, sizeof(resetTermb)-1);
                termState = OUTPUT_LINE_1;
            }    
            break;
                                        /**************************************/
                                        /* OUTPUT LINE 1                      */
                                        /**************************************/
        case OUTPUT_LINE_1:
            if (cbuffGetSpace(hCbuff) > (sizeof(termLine1)))
            {
                cbuffPutArray(hCbuff, termLine1, sizeof(termLine1)-1);
                termState = OUTPUT_LINE_3A;
            }    
            break;  
                                        /**************************************/
                                        /* OUTPUT LINE 2                      */
                                        /**************************************/
        case OUTPUT_LINE_2:
            if (cbuffGetSpace(hCbuff) > sizeof(termReturn))
            {
                cbuffPutArray(hCbuff, termReturn, sizeof(termReturn)-1);
                termState = OUTPUT_LINE_3A;
            }    
            break; 
                                        /**************************************/
                                        /* OUTPUT LINE 3                      */
                                        /**************************************/
        case OUTPUT_LINE_3A:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine3a))
            {
                cbuffPutArray(hCbuff, termLine3a, sizeof(termLine3a)-1);
                termState = OUTPUT_LINE_3B;
            }    
            break; 
            
        case OUTPUT_LINE_3B:
            if (cbuffGetSpace(hCbuff) > 3)
            {
                uiTemp = termData.bytesInBuffer;
                if(uiTemp < 10)
                {
                    cbuffPutByte(hCbuff, ' ');
                    cbuffPutByte(hCbuff, (CBUFF)(uiTemp + '0'));
                }
                else
                {
                                        /* Convert value into two chars       */
                    cbuffTemp = (CBUFF) (uiTemp % 10);
                    uiTemp = uiTemp / 10;
                    cbuffPutByte(hCbuff, (CBUFF)(uiTemp + '0'));
                    cbuffPutByte(hCbuff, cbuffTemp + '0');
                }    
                termState = OUTPUT_LINE_3C;
            }    
            break;
        
        case OUTPUT_LINE_3C:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine3c))
            {
                cbuffPutArray(hCbuff, termLine3c, sizeof(termLine3c)-1);
                termState = OUTPUT_LINE_4A;
            }    
            break;
                                        /**************************************/
                                        /* OUTPUT LINE 4                      */
                                        /**************************************/
        case OUTPUT_LINE_4A:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine4a))
            {
                cbuffPutArray(hCbuff, termLine4a, sizeof(termLine4a)-1);
                termState = OUTPUT_LINE_4B;
            }    
            break;
            
        case OUTPUT_LINE_4B:
            if (cbuffGetSpace(hCbuff) > 70)
            {
                unsigned char count;
                
                for (count = 0; count < 70; count++)
                {
                    if (count < termData.fillBarLength)
                    {
                        //cbuffPutByte(hCbuff, 176);
                        cbuffPutByte(hCbuff, '#');
                    }
                    else
                    {
                        cbuffPutByte(hCbuff, ' ');
                    }        
                }    
                termState = OUTPUT_LINE_4C;
            }    
            break;
            
        case OUTPUT_LINE_4C:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine4c))
            {
                cbuffPutArray(hCbuff, termLine4c, sizeof(termLine4c)-1);
                termState = OUTPUT_LINE_4D;
            }    
            break;
        
        case OUTPUT_LINE_4D:
            if (cbuffGetSpace(hCbuff) > 4)
            {
                cbuffUnits = termData.percentFilled;
                if(cbuffUnits < 10)
                {
                    cbuffPutByte(hCbuff, (CBUFF)(cbuffUnits + '0'));
                }
                else if (cbuffUnits < 100)
                {
                                        /* Convert value into two chars       */
                    cbuffTens = cbuffUnits / 10;
                    cbuffUnits = cbuffUnits % 10;
                    cbuffPutByte(hCbuff, cbuffTens + '0');
                    cbuffPutByte(hCbuff, cbuffUnits + '0');
                }
                else
                {
                    cbuffPutByte(hCbuff, '1');
                    cbuffPutByte(hCbuff, '0');
                    cbuffPutByte(hCbuff, '0');
                }      
                if (termData.termFullScreenUpdate == FULLSCREEN_YES)
                {
                    termData.termFullScreenUpdate = FULLSCREEN_NO;
                    termState = OUTPUT_LINE_4E;
                }
                else
                {
                    termState = OUTPUT_LINE_4F;
                }    
            }    
            break;
        
        case OUTPUT_LINE_4E:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine4e))
            {
                cbuffPutArray(hCbuff, termLine4e, sizeof(termLine4e)-1);
                termState = OUTPUT_LINE_6A;
            }    
            break;
        case OUTPUT_LINE_4F:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine4f))
            {
                cbuffPutArray(hCbuff, termLine4f, sizeof(termLine4f)-1);
                termState = OUTPUT_LINE_3A;
            }    
            break;
                                        /**************************************/
                                        /* OUTPUT LINE 6                      */
                                        /**************************************/
        case OUTPUT_LINE_6A:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine6a))
            {
                cbuffPutArray(hCbuff, termLine6a, sizeof(termLine6a)-1);
                termState = OUTPUT_LINE_6B;
            }    
            break;
            
         case OUTPUT_LINE_6B:
            if (cbuffGetSpace(hCbuff) > 6)
            {
                if(termData.fillRate < 10)
                {
                    cbuffPutByte(hCbuff, ' ');
                    cbuffPutByte(hCbuff, (CBUFF) termData.fillRate + '0');
                }
                else if (termData.fillRate < 100)
                {
                    cbuffTens = (CBUFF) (termData.fillRate / 10) + '0';
                    cbuffPutByte(hCbuff, cbuffTens);
                    cbuffTens = (cbuffTens - '0') * 10;
                    cbuffUnits = (CBUFF) (termData.fillRate - cbuffTens) + '0';
                    
                    cbuffPutByte(hCbuff, cbuffUnits);
                }      
                termState = OUTPUT_LINE_6C;  
            }    
            break;
            
         case OUTPUT_LINE_6C:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine6c))
            {
                cbuffPutArray(hCbuff, termLine6c, sizeof(termLine6c)-1);
                termState = OUTPUT_LINE_8A;
            }    
            break;
                                        /**************************************/
                                        /* OUTPUT LINE 8                      */
                                        /**************************************/
        case OUTPUT_LINE_8A:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine8a))
            {
                cbuffPutArray(hCbuff, termLine8a, sizeof(termLine8a)-1);
                termState = OUTPUT_LINE_8B;
            }    
            break;
        case OUTPUT_LINE_8B:
            if (cbuffGetSpace(hCbuff) > (sizeof(termLine8b) + 2))
            {
                if(termData.termMode == MANUAL)
                {
                    cbuffPutByte(hCbuff, '>');
                    cbuffPutArray(hCbuff, termLine8b, sizeof(termLine8b)-1);
                    cbuffPutByte(hCbuff, '<');
                    termState = OUTPUT_LINE_8C;
                }
                else
                {
                    cbuffPutByte(hCbuff, ' ');
                    cbuffPutArray(hCbuff, termLine8b, sizeof(termLine8b)-1);
                    cbuffPutByte(hCbuff, ' ');
                    termState = OUTPUT_LINE_8C;
                }        
            }    
            break;
        case OUTPUT_LINE_8C:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine8c))
            {
                cbuffPutArray(hCbuff, termLine8c, sizeof(termLine8c)-1);
                termState = OUTPUT_LINE_8D;
            }    
            break;
        case OUTPUT_LINE_8D:
            if (cbuffGetSpace(hCbuff) > (sizeof(termLine8d) + 2 
                                                + sizeof(termReturn)))
            {
                if(termData.termMode == AUTOMATIC)
                {
                    cbuffPutByte(hCbuff, '>');
                    cbuffPutArray(hCbuff, termLine8d, sizeof(termLine8d)-1);
                    cbuffPutByte(hCbuff, '<');
                    cbuffPutArray(hCbuff, termReturn, sizeof(termReturn)-1);
                    termState = OUTPUT_LINE_9A;
                }
                else
                {
                    cbuffPutByte(hCbuff, ' ');
                    cbuffPutArray(hCbuff, termLine8d, sizeof(termLine8d)-1);
                    cbuffPutByte(hCbuff, ' ');
                    cbuffPutArray(hCbuff, termReturn, sizeof(termReturn)-1);
                    termState = OUTPUT_LINE_9D;
                }        
            }    
            break;
                                        /**************************************/
                                        /* OUTPUT LINE 9                      */
                                        /**************************************/
        case OUTPUT_LINE_9A:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine9a))
            {
                cbuffPutArray(hCbuff, termLine9a, sizeof(termLine9a)-1);
                termState = OUTPUT_LINE_9B;
            }    
            break;
        case OUTPUT_LINE_9B:
            if (cbuffGetSpace(hCbuff) > 1)
            {
                cbuffPutByte(hCbuff, (CBUFF)termData.emptyOnBytesFree + '0');
                termState = OUTPUT_LINE_9C;
            }    
            break;
        case OUTPUT_LINE_9C:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine9c))
            {
                cbuffPutArray(hCbuff, termLine9c, sizeof(termLine9c)-1);
                termState = OUTPUT_LINE_11;
            }    
            break;
        case OUTPUT_LINE_9D:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine9d))
            {
                cbuffPutArray(hCbuff, termLine9d, sizeof(termLine9d)-1);
                termState = OUTPUT_LINE_11;
            }    
            break;
                                        /**************************************/
                                        /* OUTPUT LINE 11                     */
                                        /**************************************/
        case OUTPUT_LINE_11:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine11))
            {
                cbuffPutArray(hCbuff, termLine11, sizeof(termLine11)-1);
                termState = OUTPUT_LINE_12A;
            }    
            break;
                                        /**************************************/
                                        /* OUTPUT LINE 12                     */
                                        /**************************************/
        case OUTPUT_LINE_12A:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine12a))
            {
                cbuffPutArray(hCbuff, termLine12a, sizeof(termLine12a)-1);
                termState = OUTPUT_LINE_12B;
            }    
            break;
         case OUTPUT_LINE_12B:
            if (cbuffGetSpace(hCbuff) > 50)
            {
                cbuffPutArray(hCbuff, checkBuffer, 50);
                termState = OUTPUT_LINE_12C;
            }    
            break;
         case OUTPUT_LINE_12C:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine12c))
            {
                cbuffPutArray(hCbuff, termLine12c, sizeof(termLine12c)-1);
                termState = OUTPUT_LINE_13A;
            }    
            break;
                                        /**************************************/
                                        /* OUTPUT LINE 13                     */
                                        /**************************************/
        case OUTPUT_LINE_13A:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine13a))
            {
                cbuffPutArray(hCbuff, termLine13a, sizeof(termLine13a)-1);
                if (termData.bufferIntegrity == INTEGRITY_OK)
                {
                    termState = OUTPUT_LINE_13B;
                }
                else
                {
                    termState = OUTPUT_LINE_13C;
                }    
            }    
            break;
         case OUTPUT_LINE_13B:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine13b))
            {
                cbuffPutArray(hCbuff, termLine13b, sizeof(termLine13b)-1);
                termState = OUTPUT_LINE_13D;
            }    
            break;
         case OUTPUT_LINE_13C:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine13c))
            {
                cbuffPutArray(hCbuff, termLine13c, sizeof(termLine13c)-1);
                termState = OUTPUT_LINE_13D;
            }    
            break;
         case OUTPUT_LINE_13D:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine13d))
            {
                cbuffPutArray(hCbuff, termLine13d, sizeof(termLine13d)-1);
                if (termData.producerSpeedTooHigh == SPEED_OK)
                {
                    termState = OUTPUT_LINE_13E;
                }
                else
                {
                    termState = OUTPUT_LINE_13F;
                }
            }    
            break;
         case OUTPUT_LINE_13E:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine13e))
            {
                cbuffPutArray(hCbuff, termLine13e, sizeof(termLine13e)-1);
                termState = HOME_CURSOR;
            }    
            break;
         case OUTPUT_LINE_13F:
            if (cbuffGetSpace(hCbuff) > sizeof(termLine13f))
            {
                cbuffPutArray(hCbuff, termLine13f, sizeof(termLine13f)-1);
                termState = HOME_CURSOR;
            }    
            break;

    }        
}

void termUpdateBytesInBuffer(unsigned int noOfBytes)
{
    termData.bytesInBuffer = noOfBytes;
    
    termData.fillBarLength = (unsigned char) ((float)noOfBytes * 1.45);
    
    //termData.fillBarLength = (unsigned char) ((noOfBytes * 15)/10);
    
    termData.percentFilled = noOfBytes * 2;
}

void termSetFillRate(unsigned int fillRate)
{
    if (fillRate <=1)
    {
        fillRate = 1;   
    }    
    else if (fillRate >= 99)
    {
        fillRate = 99;
    }
    termData.fillRate = fillRate;
}

unsigned int termGetFillRate(void)
{
    return termData.fillRate;
}

void termSetBufferEmptyMode(char mode)
{
    if (mode == 'M' || mode == 'm')
    {
        termData.termMode = MANUAL;
    }    
    else if (mode == 'A' || mode == 'a')
    {
        termData.termMode = AUTOMATIC;
    }    
}

int termGetEmptyTrigger(void)
{
    return (int) termData.emptyOnBytesFree;    
}

void termSetEmptyTrigger(char triggerNumber)
{
    termData.emptyOnBytesFree = (unsigned char) triggerNumber - '0';
}    
    
void  termCheckBuffer(HCBUFF hCbuff)
{
    unsigned int    bufferCount;
    unsigned int    loopCount;

                                        /* Clear buffer                       */
    for (loopCount = 0; loopCount < 50; loopCount++)
    {
        checkBuffer[loopCount] = ' ';
    }    
                                        /* Get data out of the buffer         */
    bufferCount = cbuffGetArray(hCbuff, checkBuffer, 50);

                                        /* If this is the first time we have  */
                                        /* emptied the buffer, there is no    */
                                        /* data-loss check                    */
    if(termData.oldLastChar == 0)
    {
        termData.oldLastChar = checkBuffer[bufferCount-1];
    }
                                        /* Otherwise make sure that was no    */
                                        /* data lost from the producer during */
                                        /* between buffer emptying. The data  */
                                        /* always increments from A - Z       */
    else
    {
        if (termData.oldLastChar == 'Z')
        {
            termData.oldLastChar = 'A' - 1;   
        }    
        if (checkBuffer[0] != termData.oldLastChar + 1)
        {
            termData.producerSpeedTooHigh = TOO_HIGH; 
        }    
        else
        {
            termData.producerSpeedTooHigh = SPEED_OK;   
        }
        
        termData.oldLastChar = checkBuffer[bufferCount-1];    
    }    
                                        /* Here we check for buffer integrity */
                                        /* to make sure that the data really  */
                                        /* got put into the buffer in order   */
                                        /* from A-Z as we expected            */
    termData.bufferIntegrity = INTEGRITY_OK;
    
    for (loopCount = 0; loopCount < (bufferCount-1); loopCount ++)
    {
                                        /* Make sure each byte in the buffer  */
                                        /* is equal to the next byte - 1      */        
        if (checkBuffer[loopCount] != 'Z')
        {
            if (checkBuffer[loopCount] != (checkBuffer[loopCount+1] - 1) )
            {
                termData.bufferIntegrity = INTEGRITY_ERROR;
            }    
        }
                                        /* Unless the byte is 'Z'; then       */
                                        /* simply check if the next byte is   */
                                        /* 'A'                                */
        else
        {
            if (checkBuffer[loopCount+1] != 'A')
            {
                termData.bufferIntegrity = INTEGRITY_ERROR;
            }
        }    
    }
    
}   

unsigned char termIsAutomatic(void)
{
    return (unsigned char) termData.termMode;
}

void termRestartTerminal (void)
{
    restartTerm = 1;
}    

void termFullScreenUpdate(void)
{
    termData.termFullScreenUpdate = FULLSCREEN_YES;
}    

/*******************************************************************************
*
*                           TERMINAL OUTPUT PROGRAM END
*
*******************************************************************************/
