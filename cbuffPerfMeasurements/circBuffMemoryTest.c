/*******************************************************************************
*
* CIRCULAR BUFFER MEMORY USAGE TEST PROGRAM
*
*******************************************************************************/

/*******************************************************************************
*
* Used to extract the memory usage of the circular buffer module. Specifically
* used for measuring:
* - Code size
* - Static memory usage
* - Stack usage
*
* Filename : circBuffMemoryTest.c
* Programmer(s) : Suart Cording aka CODINGHEAD
*
********************************************************************************
* Note(s) :
* Created 8th November 2010
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
*                    CIRCULAR BUFFER MEMORY USAGE TEST PROGRAM
*
*******************************************************************************/


/*******************************************************************************
*                                 INCLUDE FILES
*******************************************************************************/

                            /* HI-TECH PICC / PICC-Lite compiler */
#if defined(__PICC__) || defined(__PICCLITE__)
    // PIC16 processor
    #include <pic.h>
#elif   defined(__PICC18__) /* HI-TECH PICC-18 compiler */
    // PIC18 processor
    #include <pic18.h>
#elif   defined(__DSPICC__) /* HI-TECH dsPICC compiler */
    // dsPIC or PIC24 processor
    #include <dspic.h>
#elif defined(__PICC32__)   /* HI-TECH C for PIC32 */
    #include <pic32.h>
#elif defined(__18CXX)      /* Microchip C18 compiler */
    // PIC18 processor
    #include <p18cxxx.h>
#elif defined(__PIC24F__)   /* Microchip C30 compiler */
    // PIC24F processor
    #include <p24Fxxxx.h>
#elif defined(__PIC24H__)   /* Microchip C30 compiler */
    // PIC24H processor
    #include <p24Hxxxx.h>
#elif defined(__dsPIC33F__) /* Microchip C30 compiler */
    // dsPIC33F processor
    #include <p33Fxxxx.h>
#elif defined(__dsPIC30F__) /* Microchip C30 compiler */
    // dsPIC30F processor
    #include <p30fxxxx.h>
#elif defined(__PIC32MX__)  /* Microchip C32 compiler */
    #include <p32xxxx.h>
    #include <plib.h>
    #pragma config POSCMOD=XT, FNOSC=PRIPLL
    #pragma config FPLLIDIV=DIV_2, FPLLMUL=MUL_20, FPLLODIV=DIV_1
    #pragma config FPBDIV=DIV_2, FWDTEN=OFF, CP=OFF, BWP=OFF
#elif defined(__i386__)
    #include <assert.h>
#else
    #error Unknown processor or compiler.
#endif

#include <stdio.h>
#include "..\cbuff_module\cbuff.h"

/*******************************************************************************
*                                 LOCAL DEFINES
*******************************************************************************/
#define PERFBUFF1SIZE       5

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

#ifdef __EXTENDED18__
static unsigned char        dummyDeclaration;
                                        /* dummyDeclaration ensures that the  */
                                        /* first byte of inBuffer is assigned */
                                        /* to address 0 on PIC18 in ExtMode   */
                                        /* Would otherwise cause failure      */
                                        /* during allocation of buffer during */
                                        /* cbuffCreate call                   */
#endif
static CBUFF                perfBuffer1[PERFBUFF1SIZE];
static CBUFFOBJ             perfBuffer1Obj;
static CBUFFNUM             perfBuffer1Num;
static CBUFF                perfBuffer2[PERFBUFF1SIZE];
static CBUFFOBJ             perfBuffer2Obj;
static CBUFFNUM             perfBuffer2Num;

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
#if defined(__18CXX)
void main (void)
#else
int main(void)
#endif
{
    printf("Running memory usage test suite for CIRCULAR BUFFER MODULE\n\n");

    printf("Size of CBUFF      is %d bytes\n", sizeof(CBUFF));
    printf("Size of HCBUFF     is %d bytes\n", sizeof(HCBUFF));
    printf("Size of CBUFFOBJ   is %d bytes\n", sizeof(CBUFFOBJ));
    printf("Size of CBUFFOBJ * is %d bytes\n", sizeof(CBUFFOBJ *));
    printf("Size of CBUFFNUM   is %d bytes\n\n", sizeof(CBUFFNUM));
    
    printf("Size of a single buffer instance is:\n");
    printf("= sizeof(CBUFFOBJ) + sizeof(HCBUFF) + buffer_size\n");
    printf("= %d + buffer_size bytes\n", (sizeof(CBUFFOBJ) + sizeof(HCBUFF)));

#ifdef __i386__
    return 0;
#else
    while(1);
#endif
}
