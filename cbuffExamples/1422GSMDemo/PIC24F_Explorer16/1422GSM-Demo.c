/*******************************************************************************
*
* CIRCULAR BUFFER DEMO PROGRAM for 1422GSM MASTERS CLASS
*
*******************************************************************************/

/*******************************************************************************
*
* Demos the the circular buffer module's functionality on a PIC24FJ128GA010
* with the Explorer 16 board using the 8MHz crystal. Oscillator is XT no PLL.
* Internal clock frequency is 8 x 4 = 32MHz
*
* Filename : 1422GSM-Demo.c
* Version : V0.01
* Programmer(s) : Suart Cording aka CODINGHEAD 
* 
********************************************************************************
* Note(s) : 
* 11 June 2010  - v0.1 - First cut
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
#include <p24Fxxxx.h>
#include "..\..\..\cbuff_module\cbuff.h"
#include "terminal_output.h"

/*******************************************************************************
*                                  CONFIG BITS
*******************************************************************************/
_CONFIG1(JTAGEN_OFF & GCP_OFF & GWRP_OFF & ICS_PGx2 & FWDTEN_OFF)
_CONFIG2(IESO_ON & FNOSC_PRIPLL & FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_XT)

/*******************************************************************************
*                                 LOCAL DEFINES
*******************************************************************************/
#define TESTBUFFERSIZE      50
#define UARTOUTBUFFERSIZE   500

/*******************************************************************************
*                                LOCAL CONSTANTS
*******************************************************************************/
 

/*******************************************************************************
*                                LOCAL DATA TYPES
*******************************************************************************/


/*******************************************************************************
*                                  LOCAL TABLES
*******************************************************************************/


/*******************************************************************************
*                             LOCAL GLOBAL VARIABLES
*******************************************************************************/
static CBUFF            	testBuffer[TESTBUFFERSIZE];
static CBUFF            	uartOutBuffer[UARTOUTBUFFERSIZE];
static CBUFFOBJ		    	testBufferObj;
static CBUFFOBJ		    	uartOutBufferObj;
static HCBUFF               hTestBuffer = (HCBUFF) 0;
static HCBUFF               hUartOutBuffer = (HCBUFF) 0;
static unsigned char        emptyBuffer = 0;

/*******************************************************************************
*                             LOCAL FUNCTION PROTOTYPES
*******************************************************************************/
void initUart2(void);
void triggerUART2(HCBUFF hCbuff);
void initTimer2(void);
void startTimer2(void);
void stopTimer2(void);
void setTimer2IntRate();
void initLEDs(void);
void initInterrupts(void);
void error(void);
void updateStats(HCBUFF hCbuff);

/*******************************************************************************
*                            LOCAL CONFIGURATION ERRORS
*******************************************************************************/


/*******************************************************************************
* main()
*
* Description: 
*   Main application code
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
int main(void)
{
    CBUFFNUM    testBufferNum;
    CBUFFNUM    uartOutBufferNum;
    volatile unsigned int x = 0;
                                        /* Initialise all used hardware and   */
                                        /* related interrupts                 */
    initLEDs();
    initUart2();
    initTimer2();
    initInterrupts();
    termInit();
    
                                        /* Create circular buffers            */
    cbuffInit();
    testBufferNum = cbuffCreate(testBuffer, TESTBUFFERSIZE, 
                                    &testBufferObj);
    uartOutBufferNum = cbuffCreate(uartOutBuffer, UARTOUTBUFFERSIZE, 
                                    &uartOutBufferObj);

                                        /* Check buffers were created         */
    if (testBufferNum == 0 || uartOutBufferNum == 0)
    {
        error();
    }    

                                        /* Get handles to buffers             */    
    hTestBuffer = cbuffOpen(testBufferNum);
    hUartOutBuffer = cbuffOpen(uartOutBufferNum);
                                        /* Check buffers were opened          */
    if (hTestBuffer == (HCBUFF) 0 || hUartOutBuffer == (HCBUFF) 0)
    {
        error();
    }    
                                        /* Start Timer based data generation  */
    startTimer2();                                       
                                        /* Output statistics                  */
    while(1)
    {
        triggerUART2(hUartOutBuffer);
        
        updateStats(hTestBuffer);
        
        //termOutput(hUartOutBuffer);

        if(termIsAutomatic())
        {
            if(cbuffGetSpace(hTestBuffer) <= termGetEmptyTrigger())
            {
                termCheckBuffer(hTestBuffer);
                termFullScreenUpdate();
            }
        }    
        else if(emptyBuffer == 1)
        {
            emptyBuffer = 0; 
            termCheckBuffer(hTestBuffer);
            termFullScreenUpdate();
        }    
            
        if (x >= 0x0FFF)
        {
            termOutput(hUartOutBuffer);
            x = 0;
        }
        else
        {
            x++;
        }    
    }    
}

void initLEDs(void)
{
    TRISA = 0x0000;
    LATA  = 0x0000;
}

void initUart2(void)
{
                                        /* Enable UART2 Peripheral            */
    U2MODEbits.UARTEN = 1;
                                        /* One stop bit                       */
    U2MODEbits.STSEL = 0;
                                        /* 8-bit data, no  parity             */
    U2MODEbits.PDSEL = 0;
                                        /* High-Speed Baud Rate enable mode   */
    U2MODEbits.BRGH = 1;
                                        /* Only U2TX, U2RX, CTS and RTS       */
                                        /* for flow control                   */
    U2MODEbits.UEN = 2;
                                        /* Use flow control mode              */
    U2MODEbits.RTSMD = 0;
                                        /* Rx interrupt on 1 byte of rx'd     */
                                        /* data                               */
    U2STAbits.URXISEL = 0;
                                        /* Enable TX pin                      */
    U2STAbits.UTXEN = 1;
                                        /* Tx interrupt when TSR register     */
                                        /* becomes empty                      */
    U2STAbits.UTXISEL0 = 0;
    U2STAbits.UTXISEL1 = 0;
                                        /* 115200 Baud                        */
    U2BRG = 34;
}

/*******************************************************************************
* triggerUART2()
*
* Description: 
*   Checks if there is data in the selected cbuff and if the UART2TX buffer is
* empty. If both cases are true, one byte of data is then written into the 
* U2TXREG. The resulting interrupt as a result of this single transfer will
* trigger a further transfer of data from the cbuff into the UART2TX in the 
* U2TXInterrupt routine.
*
* See also:
*
* Arguments: 
*   HCBUFF  hCbuff
*
* Returns: 
*   void
*
* Callers: 
*   main()
*
* Notes : 
*
*******************************************************************************/
void triggerUART2(HCBUFF hCbuff)
{
                                        /* Local storage for data read from   */
                                        /* cbuff                              */
    CBUFF data;
                                        /* Check if U2TX is totally empty     */
    if(U2STAbits.TRMT == 1)
    {
                                        /* Check if there is any data to send */
        if(cbuffGetFill(hCbuff) > 0)
        {
                                        /* Remove one byte and transmit       */
            if(cbuffGetByte(hCbuff, &data) == CBUFF_GET_OK)
            {
                U2TXREG = (unsigned int) data;
                LATAbits.LATA1 = !LATAbits.LATA1;
            }    
        }    
    }    
}    

void initTimer2(void)
{
                                        /* Internal clock source              */
    T2CONbits.TCS = 0;
                                        /* 16MHz / 256 prescaler = 62.5kHz    */
    T2CONbits.TCKPS = 3;
                                        /* Set period to ~1Hz (count of       */
                                        /* 62500)                             */
    PR2 = 62500;
}

void startTimer2(void)
{   
    TMR2 = 0;
    T2CONbits.TON = 1;
}
void stopTimer2(void)
{
    T2CONbits.TON = 1;
}  
void setTimer2IntRate(void)
{
    stopTimer2();
                                            /* T2 clock speed is 62500Hz          */        
    PR2 = (62500 / termGetFillRate());
    startTimer2();
}    

void initInterrupts(void)
{
                                        /* T2 Interrupt P=4                   */
    IFS0bits.T2IF = 0;
    IPC1bits.T2IP = 4;
    IEC0bits.T2IE = 1;
                                        /* U2 Rx Interrupt P=6                */
    IFS1bits.U2RXIF = 0;
    IPC7bits.U2RXIP = 6;
    IEC1bits.U2RXIE = 1;
                                        /* U2 Tx Interrupt P=5                */
    IFS1bits.U2TXIF = 0;
    IPC7bits.U2TXIP = 5;
    IEC1bits.U2TXIE = 1;
}

void updateStats(HCBUFF hCbuff)
{
    termUpdateBytesInBuffer(cbuffGetFill(hCbuff));
    
//    termSetFillRate(0xFFFF / PR2);
}    


/*******************************************************************************
* error()
*
* Description: 
*   Blinks LEDs in the event of a catastrophic failure
*
* See also:
*
* Arguments: 
*   void
*
* Returns: 
*   void
*
* Callers: 
*   main()
*
* Notes : 
*
*******************************************************************************/
void error(void)
{
    int count = 0;
    
    LATA = 0x0055;
    while(1)
    {
        count++;
        if (count == 0xFFFF)
        {
            LATA = !LATA | 0x00FF;
        }    
    }    
}
    
void __attribute__((interrupt, no_auto_psv)) _U2RXInterrupt(void)
{
    unsigned int rxData;
    unsigned int fillRate;
    
    LATAbits.LATA2 = !LATAbits.LATA2;
    
    rxData = U2RXREG;
    
    if (rxData == 'M' || rxData == 'm' || rxData == 'A' || rxData == 'a')
    {
        termSetBufferEmptyMode((char) rxData);
    }    
    else if (rxData >= '0' && rxData <= '9')
    {
        termSetEmptyTrigger((char) rxData);
    } 
    else if (rxData == '+' || rxData == ',') /* ',' for keypad + */
    {
        fillRate = termGetFillRate() + 1;
        termSetFillRate(fillRate);
        setTimer2IntRate();
    }
    else if (rxData == '-' || rxData == '.') /* ',' for keypad - */
    {
        fillRate = termGetFillRate() - 1;
        if (fillRate == 0)
        {
            fillRate = 1;
        }
        termSetFillRate(fillRate);
        setTimer2IntRate();
    }
    else if (rxData == 'r' || rxData == 'R')
    {
        termRestartTerminal();
    } 
    else if (rxData == ' ')
    {
        if(!termIsAutomatic())
        {
            /* Empty Buffer */
            emptyBuffer = 1;
        }    
    }
        
    termFullScreenUpdate();
    
    IFS1bits.U2RXIF = 0;
}    

void __attribute__((interrupt, no_auto_psv)) _U2TXInterrupt(void)
{
    CBUFF txData;
    
    while(U2STAbits.UTXBF == 0)
    {
        if (cbuffGetByte(hUartOutBuffer, &txData) == CBUFF_GET_OK)
        {
            U2TXREG = (unsigned int) txData;
        }
        else
        { 
            break;
        }        
    }   

#if 0
    if(U2STAbits.UTXBF == 0)
    {
        if (cbuffGetByte(hUartOutBuffer, &txData) == CBUFF_GET_OK)
        {
            U2TXREG = (unsigned int) txData;
        }       
    }
#endif

    IFS1bits.U2TXIF = 0;
}  

void __attribute__((interrupt, no_auto_psv)) _T2Interrupt(void)
{
    static unsigned char testData = 'A';
    
    LATAbits.LATA0 = !LATAbits.LATA0;
                                        /* Put data in the test buffer -      */
                                        /* don't care if it fails             */
    cbuffPutByte(hTestBuffer, testData);
                                        /* Increment testData so it stays     */
                                        /* within 'A' to 'Z'                  */
    testData++;
    if(testData == ('Z' + 1))
    {
        testData = 'A';        
    }    
                                        /* Clear T2 interrupt flag            */
    IFS0bits.T2IF = 0;
}  


/*******************************************************************************
*
*                       CIRCULAR BUFFER TEST PROGRAM END
*
*******************************************************************************/
