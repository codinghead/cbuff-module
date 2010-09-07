/*******************************************************************************
*
* CIRCULAR BUFFER PERFORMANCE TEST PROGRAM
*
*******************************************************************************/

/*******************************************************************************
*
* Used to extract the performance of the circular buffer module. Specifically
* used for measuring:
* - Code size
* - Static memory usage
* - Stack usage
*
* Filename : circPerfTest.c
* Version : V0.01
* Programmer(s) : Suart Cording aka CODINGHEAD
*
********************************************************************************
* Note(s) :
* V0.01 - 18th June 2010 -
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
*                    CIRCULAR BUFFER PERFORMANCE TEST PROGRAM
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
    #include <stdio.h>
    #include <assert.h>
#else
    #error Unknown processor or compiler.
#endif

#include "..\cbuff_module\cbuff.h"

/*******************************************************************************
*                                 LOCAL DEFINES
*******************************************************************************/
#define PERFBUFF1SIZE       5
#define PERFBUFF2SIZE       5
#define PERFBUFF3SIZE       5
#define PERFBUFF4SIZE       5
#define PERFBUFF5SIZE       5
#define PERFBUFF6SIZE       5

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
static CBUFF                perfBuffer2[PERFBUFF2SIZE];
static CBUFF                perfBuffer3[PERFBUFF3SIZE];
static CBUFF                perfBuffer4[PERFBUFF4SIZE];
static CBUFF                perfBuffer5[PERFBUFF5SIZE];
static CBUFF                perfBuffer6[PERFBUFF6SIZE];
static CBUFFOBJ             perfBuffer1Obj;
static CBUFFOBJ             perfBuffer2Obj;
static CBUFFOBJ             perfBuffer3Obj;
static CBUFFOBJ             perfBuffer4Obj;
static CBUFFOBJ             perfBuffer5Obj;
static CBUFFOBJ             perfBuffer6Obj;


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
    CBUFF                       writeData = 0;
    CBUFF                       readData = 0;
    volatile unsigned int       spaceRemainingInBuffer = 0;
    volatile unsigned int       dataInBuffer = 0;
    CBUFFNUM                    perfBuffer1Num;
    CBUFFNUM                    perfBuffer2Num;
    CBUFFNUM                    perfBuffer3Num;
    CBUFFNUM                    perfBuffer4Num;
    CBUFFNUM                    perfBuffer5Num;
    CBUFFNUM                    perfBuffer6Num;
    HCBUFF                      hPerfBuffer1;
    HCBUFF                      hPerfBuffer2;
    HCBUFF                      hPerfBuffer3;
    HCBUFF                      hPerfBuffer4;
    HCBUFF                      hPerfBuffer5;
    HCBUFF                      hPerfBuffer6;
    volatile unsigned int       cbuffMemSize;
    
#ifdef __i386__
    printf("Running performance test suite for CIRCULAR BUFFER MODULE\n");
#endif
                                        /* Initialise buffer module           */
    cbuffInit();
    
    cbuffMemSize = sizeof(CBUFFOBJ) + sizeof(HCBUFF);
    
    cbuffMemSize = sizeof(CBUFFNUM);
                                        /* Create six buffers; allows         */
                                        /* checking of execution time for     */
                                        /* each time a bufferObj is added -   */
                                        /* unfortunately cbuffCreate exec.    */
                                        /* time depends on how many buffers   */
                                        /* already exist                      */
    perfBuffer1Num = cbuffCreate(perfBuffer1, PERFBUFF1SIZE, &perfBuffer1Obj);
    perfBuffer2Num = cbuffCreate(perfBuffer2, PERFBUFF2SIZE, &perfBuffer2Obj);
    perfBuffer3Num = cbuffCreate(perfBuffer3, PERFBUFF3SIZE, &perfBuffer3Obj);
    perfBuffer4Num = cbuffCreate(perfBuffer4, PERFBUFF4SIZE, &perfBuffer4Obj);
    perfBuffer5Num = cbuffCreate(perfBuffer5, PERFBUFF5SIZE, &perfBuffer5Obj);
    perfBuffer6Num = cbuffCreate(perfBuffer6, PERFBUFF6SIZE, &perfBuffer6Obj);
    
                                        /* Open the six buffers; again the    */
                                        /* execution will vary depending      */
                                        /* where the buffer lies in the       */
                                        /* internal linked list of the        */
                                        /* cbuff module                       */
    hPerfBuffer1 = cbuffOpen(perfBuffer1Num);
    hPerfBuffer2 = cbuffOpen(perfBuffer2Num);
    hPerfBuffer3 = cbuffOpen(perfBuffer3Num);
    hPerfBuffer4 = cbuffOpen(perfBuffer4Num);
    hPerfBuffer5 = cbuffOpen(perfBuffer5Num);
    hPerfBuffer6 = cbuffOpen(perfBuffer6Num);
    
                                        /* Close all the buffers              */
    perfBuffer1Num = cbuffClose(hPerfBuffer1);
    perfBuffer2Num = cbuffClose(hPerfBuffer2);
    perfBuffer3Num = cbuffClose(hPerfBuffer3);
    perfBuffer4Num = cbuffClose(hPerfBuffer4);
    perfBuffer5Num = cbuffClose(hPerfBuffer5);
    perfBuffer6Num = cbuffClose(hPerfBuffer6);

                                        /* Destroy the buffers                */
    cbuffDestroy(perfBuffer1Num);
    cbuffDestroy(perfBuffer2Num);
    cbuffDestroy(perfBuffer3Num);
    cbuffDestroy(perfBuffer4Num);
    cbuffDestroy(perfBuffer5Num);
    cbuffDestroy(perfBuffer6Num);
                
                                        /* Measure time to destroy buffers in */
                                        /* reverse creation order             */
    perfBuffer1Num = cbuffCreate(perfBuffer1, PERFBUFF1SIZE, &perfBuffer1Obj);
    perfBuffer2Num = cbuffCreate(perfBuffer2, PERFBUFF2SIZE, &perfBuffer2Obj);
    perfBuffer3Num = cbuffCreate(perfBuffer3, PERFBUFF3SIZE, &perfBuffer3Obj);
    perfBuffer4Num = cbuffCreate(perfBuffer4, PERFBUFF4SIZE, &perfBuffer4Obj);
    perfBuffer5Num = cbuffCreate(perfBuffer5, PERFBUFF5SIZE, &perfBuffer5Obj);
    perfBuffer6Num = cbuffCreate(perfBuffer6, PERFBUFF6SIZE, &perfBuffer6Obj);
    cbuffDestroy(perfBuffer6Num);
    cbuffDestroy(perfBuffer5Num);
    cbuffDestroy(perfBuffer4Num);
    cbuffDestroy(perfBuffer3Num);
    cbuffDestroy(perfBuffer2Num);
    cbuffDestroy(perfBuffer1Num);
    
                                        /* Deinitialise module                */
    cbuffDeinit();
    
                                        /* Bring everything back to life      */
                                        /* so we can measure the execution    */
                                        /* time of the other functions        */
    cbuffInit();
    perfBuffer1Num = cbuffCreate(perfBuffer1, PERFBUFF1SIZE, &perfBuffer1Obj);
    hPerfBuffer1 = cbuffOpen(perfBuffer1Num);    
            
                                        /* Put one byte in the buffer and     */
                                        /* remove it so that we can also test */
                                        /* case of pure buffer wrap around in */
                                        /* following tests                    */
    writeData = 'A';
    cbuffPutByte(hPerfBuffer1, writeData);
    cbuffGetByte(hPerfBuffer1, &readData);
                                        /* Put some data in a buffer; here we */
                                        /* try to fill the buffer up and then */
                                        /* try to put data into a full buffer */
    writeData = 'A';
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
                                        /* On this call buffer wraps          */
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
                                        /* On this call buffer becomes full   */
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
                                        /* On this call buffer can't accept   */
                                        /* any more data                      */
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
    cbuffPutByte(hPerfBuffer1, writeData);
    
                                        /* Clear buffer for next test         */
                                        /* Can also measure call time here    */
    cbuffClearBuffer(hPerfBuffer1);
                                        /* Fill empty buffer                  */
    writeData = 'A';
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
    cbuffPutByte(hPerfBuffer1, writeData);
    writeData++;
                                        /* On this call buffer becomes full   */
                                        /* and wraps!                         */
    cbuffPutByte(hPerfBuffer1, writeData);
      
                                        /* Get some data from a buffer; here  */
                                        /* we read all data out of the buffer */
                                        /* and then attempt some reads of an  */
                                        /* empty buffer                       */
    readData = 0;
                                        /* Here we measure a normal read      */
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
                                        /* Here buffer becomes empty and      */
                                        /* wraps                              */
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
                                        /* Here there is nothing to read      */
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
    cbuffGetByte(hPerfBuffer1, &readData);

                                        /* Put one byte in the buffer and     */
                                        /* remove it so that we can also test */
                                        /* case of pure buffer wrap around in */
                                        /* following tests                    */
    cbuffClearBuffer(hPerfBuffer1);
    writeData = 'A';
    cbuffPutByte(hPerfBuffer1, writeData);
    cbuffGetByte(hPerfBuffer1, &readData);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
    
    readData = 0;
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
                                        /* Here buffer wraps                  */
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
                                        /* Here buffer becomes empty          */
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
    cbuffGetByte(hPerfBuffer1, &readData);
    writeData++;
    cbuffGetByte(hPerfBuffer1, &readData);
    

                                        /* Perform some array based transfers */
    cbuffClearBuffer(hPerfBuffer1);
    perfBuffer5[0] = 'a';
    perfBuffer5[1] = 'b';
    perfBuffer5[2] = 'c';
    perfBuffer5[3] = 'd';
    perfBuffer5[4] = 'e';
                                        /* Measure 1 byte put array           */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 1);
    cbuffClearBuffer(hPerfBuffer1);
                                        /* Measure 2 byte put array           */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 2);
    cbuffClearBuffer(hPerfBuffer1);
                                        /* Measure 3 byte put array           */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 3);
    cbuffClearBuffer(hPerfBuffer1);
                                        /* Measure 4 byte put array           */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 4);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 4);
                                        /* Here buffer fills and wraps        */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 1);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 4);
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 4);
                                        /* Here buffer only wraps             */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 3);
                                        /* Here buffer only fills             */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 1);
                                        /* Here buffer is already full        */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 1);
    
    
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
                                        /* Measure 1 byte get array           */
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 1);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
                                        /* Measure 2 byte get array           */
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 2);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
                                        /* Measure 3 byte get array           */
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 3);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
                                        /* Measure 4 byte get array           */
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 4);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 3);
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 2);
                                        /* Measure buffer empty               */
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 1);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 4);
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 4);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 4);
                                        /* Measure buffer wrap                */
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 1);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 4);
                                        /* Measure buffer wrap and empty      */
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 1);
    cbuffClearBuffer(hPerfBuffer1);
                                        /* Measure nothing to get case        */
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 1);
    cbuffClearBuffer(hPerfBuffer1);
    
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 4);
                                        /* Measure peek head time normal case */
    cbuffPeekHead(hPerfBuffer1, &readData);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
                                        /* Measure peek head time rare case   */
                                        /* where inPointer == startOfBuffer   */
    cbuffPeekHead(hPerfBuffer1, &readData);
                                        /* Measure peek tail time             */
    cbuffPeekTail(hPerfBuffer1, &readData);
    
    cbuffClearBuffer(hPerfBuffer1);
                                        /* Measure peek head time when buffer */
                                        /* is empty                           */
    cbuffPeekHead(hPerfBuffer1, &readData);
                                        /* Measure peek tail time when buffer */
                                        /* is empty                           */
    cbuffPeekTail(hPerfBuffer1, &readData);
    cbuffClearBuffer(hPerfBuffer1);
                                        /* Measure unput byte when buffer is  */
                                        /* empty                              */
    cbuffUnputByte(hPerfBuffer1);
                                        /* Measure unget byte when buffer is  */
                                        /* empty                              */
    cbuffUngetByte(hPerfBuffer1);
    
    cbuffPutByte(hPerfBuffer1, 0x55);
    cbuffPutByte(hPerfBuffer1, 0xAA);
                                        /* Measure unput when in middle of    */
                                        /* buffer                             */
    cbuffUnputByte(hPerfBuffer1);
                                        /* Measure unput at start of buffer   */
                                        /* and buffer becomes empty           */
    cbuffUnputByte(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
    cbuffGetByte(hPerfBuffer1, &readData);
    cbuffPutByte(hPerfBuffer1, 0xAA);
                                        /* Measure unput at start of buffer   */
                                        /* but buffer does not empty          */
    cbuffUnputByte(hPerfBuffer1);
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 3);
    cbuffGetByte(hPerfBuffer1, &readData);
    cbuffGetByte(hPerfBuffer1, &readData);
                                        /* Measure unput in middle of buffer  */
                                        /* and buffer becomes empty           */
    cbuffUnputByte(hPerfBuffer1);
                                        
    cbuffClearBuffer(hPerfBuffer1);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
    cbuffGetByte(hPerfBuffer1, &readData);
    cbuffPutByte(hPerfBuffer1, 0xEE);
                                        /* Measure unget when buffer is full  */
    cbuffUngetByte(hPerfBuffer1);
    
    cbuffGetByte(hPerfBuffer1, &readData);
                                        /* Measure unget when in middle of    */
                                        /* buffer                             */
    cbuffUngetByte(hPerfBuffer1);
    
    
    
    cbuffClearBuffer(hPerfBuffer1);
                                        /* Measure get space for empty buffer */
    cbuffGetSpace(hPerfBuffer1);
                                        /* Measure get fill for empty buffer  */
                                        /* (calls GetSpace and subtracts)     */
    cbuffGetFill(hPerfBuffer1);
    
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 5);
                                         /* Measure get space for full buffer */
    cbuffGetSpace(hPerfBuffer1);
    cbuffGetArray(hPerfBuffer1, perfBuffer4, 3);
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 2);
                                         /* Measure get space for outPointer  */
                                         /* bigger than inPointer             */
    cbuffGetSpace(hPerfBuffer1);
    cbuffClearBuffer(hPerfBuffer1);
                                         /* Measure get space for inPointer   */
                                         /* bigger than outPointer            */
    cbuffPutArray(hPerfBuffer1, perfBuffer5, 2);
    spaceRemainingInBuffer = cbuffGetSpace(hPerfBuffer1);
    dataInBuffer = cbuffGetFill(hPerfBuffer1);
    cbuffClearBuffer(hPerfBuffer1);
    
    while(1);

}

/*******************************************************************************
*
*                           CIRCULAR BUFFER MODULE END
*
*******************************************************************************/
