/*******************************************************************************
*
* CIRCULAR BUFFER TEST PROGRAM FOR PIC16F1 with PICC Compiler
*
*******************************************************************************/

/*******************************************************************************
*
* Tests the circular buffer module's functionality
*
* Filename : circBufferPIC16F1Test.c
* Version : V0.01
* Programmer(s) : Suart Cording aka CODINGHEAD 
* 
********************************************************************************
* Note(s) : 
* V0.01 - 4th June 2010 - Simplified test to highlight "pointer to char" issue
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

                            /* HI-TECH PICC / PICC-Lite compiler */
#if	defined(__PICC__) || defined(__PICCLITE__)
    // PIC16 processor
    #include <pic.h>
#elif	defined(__PICC18__) /* HI-TECH PICC-18 compiler */
    // PIC18 processor
    #include <pic18.h>
#elif	defined(__DSPICC__) /* HI-TECH dsPICC compiler */
    // dsPIC or PIC24 processor
    #include <dspic.h>
#elif defined(__PICC32__)   /* HI-TECH C for PIC32 */
    #include <pic32.h>
#elif defined(__18CXX)      /* Microchip C18 compiler */
    // PIC18 processor
    #include <p18cxxx.h>
#elif defined(__PIC24F__)	/* Microchip C30 compiler */
	// PIC24F processor
	#include <p24Fxxxx.h>
#elif defined(__PIC24H__)	/* Microchip C30 compiler */
	// PIC24H processor
	#include <p24Hxxxx.h>
#elif defined(__dsPIC33F__)	/* Microchip C30 compiler */
	// dsPIC33F processor
	#include <p33Fxxxx.h>
#elif defined(__dsPIC30F__)	/* Microchip C30 compiler */
	// dsPIC30F processor
	#include <p30fxxxx.h>
#elif defined(__PIC32MX__)	/* Microchip C32 compiler */
	#include <p32xxxx.h>
	#include <plib.h>
	#pragma config POSCMOD=XT, FNOSC=PRIPLL
	#pragma config FPLLIDIV=DIV_2, FPLLMUL=MUL_20, FPLLODIV=DIV_1
	#pragma config FPBDIV=DIV_2, FWDTEN=OFF, CP=OFF, BWP=OFF
#else
	#error Unknown processor or compiler.
#endif

//#include <stdio.h>
#include "..\..\cbuff_module\cbuff.h"

/*******************************************************************************
*                                 LOCAL DEFINES
*******************************************************************************/
#define INBUFFERSIZE        32

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

static CBUFF            	inBuffer[INBUFFERSIZE];
static CBUFFOBJ		    	inBufferObj;


/*******************************************************************************
*                             LOCAL FUNCTION PROTOTYPES
*******************************************************************************/


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
#if	defined(__18CXX)
void main (void)
#else
int main(void)
#endif
{
    CBUFF           writeData = 0;
    CBUFF           readData = 0;
    unsigned char   x;              /* used for 'for' loops               */
    unsigned int    spaceRemainingInBuffer = 0;
    unsigned int    dataInBuffer = 0;
    CBUFFNUM        inBufferNum;
    HCBUFF          hInBuffer;

                                        /* Initialise buffer module           */
    cbuffInit();
        
    /***************************************************************************
    * TEST 1 - Create a buffer object
    ***************************************************************************/
    
    inBufferNum = cbuffCreate(inBuffer, INBUFFERSIZE, &inBufferObj);

    if (inBufferNum != 1)
    {
        /* If inBufferNum isn't 1, allocation didn't work */
        while(1);
    }
    
    if (inBufferObj.startOfBuffer != inBuffer)
    {
        /* ERROR! -inBufferObj.StartOfBuffer doesn't hold address of inBuffer */
        while(1);        
    }    
    
    hInBuffer = cbuffOpen(inBufferNum);
    
    //cbuffPutByte(hInBuffer, 'A');
    
    spaceRemainingInBuffer = cbuffGetSpace(hInBuffer);
    dataInBuffer = cbuffGetFill(hInBuffer);
    
    if (spaceRemainingInBuffer != (INBUFFERSIZE))
    {
        while(1)
        {
            PORTA = 0xFF;
            PORTA = 0x00;
        }    
    }
    
    if (dataInBuffer != (0))
    {
        while(1)
        {
            PORTA = 0xFF;
            PORTA = 0x00;
        }    
    }
    
    /* Congratulations! If we stop here all tests passed */
    while (1)
    {
        PORTA = 0x55;
        PORTA = 0xAA;
    }    
}

/*******************************************************************************
*
*                           CIRCULAR BUFFER MODULE END
*
*******************************************************************************/
