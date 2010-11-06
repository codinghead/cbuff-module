/*******************************************************************************
*
* CIRCULAR BUFFER TEST PROGRAM
*
*******************************************************************************/

/*******************************************************************************
*
* Tests the circular buffer module's functionality
*
* Filename : circBufferTest.c
* Programmer(s) : Suart Cording aka CODINGHEAD
*
********************************************************************************
* Note(s) :
*       - 1st Nov 2010 - removed versioning info from file - versioning is now
*         done in GIT
* V0.04 - 9th June 2010 - added support for i386 architecture in tests
*         - code now runs on all Microchip architectures except PIC16F1 when
*           compiling with Microchip compilers
* V0.03 - 7th May 2010 - modified tests to use new naming convention in cbuff
*         module. Added definitions to select microcontroller header file
*         dependent on the controller/compiler selected. NOTE: Currently only
*         PIC18 and PIC24/dsPIC are supported. PIC32 needs some set up of the
*         memory bus for memory accesses to work. PIC16F1 didn't work first
*         time - didn't determine cause of the failure - and compiles with a
*         warning.
* V0.02 - 16th March 2010 - added new tests to check new functionality in V0.02
*         of the Circular Buffer Module
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
#define INBUFFERSIZE        64
#define OUTBUFFERSIZE       32
#define TESTBUFFER1SIZE     8
#define TESTBUFFER2SIZE     16

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
                                        /* during allocation of inBuffer      */
                                        /* in Test 2                          */
#endif
static CBUFF            	inBuffer[INBUFFERSIZE];
static CBUFF            	outBuffer[OUTBUFFERSIZE];
static CBUFF            	testBuffer1[TESTBUFFER1SIZE];
static CBUFF            	testBuffer2[TESTBUFFER2SIZE];
static CBUFFOBJ		    	inBufferObj;
static CBUFFOBJ		    	outBufferObj;
static CBUFFOBJ		    	testBuffer1Obj;
static CBUFFOBJ		    	testBuffer2Obj;


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
    CBUFF               writeData = 0;
    CBUFF               readData = 0;
    unsigned char       x;              /* used for 'for' loops               */
    unsigned int        spaceRemainingInBuffer = 0;
    unsigned int        dataInBuffer = 0;
    CBUFFNUM			inBufferNum;
    CBUFFNUM			outBufferNum;
    CBUFFNUM			testBuffer1Num;
    CBUFFNUM			testBuffer2Num;
    HCBUFF              hInBuffer;
    HCBUFF              hOutBuffer;
    HCBUFF              hDummyHandle;

#ifdef __i386__
    printf("Running test suite for CIRCULAR BUFFER MODULE\n");
#endif
                                        /* Initialise buffer module           */
    cbuffInit();

    /***************************************************************************
    * TEST 1 - Try to create some buffer objects without passing the correct
    *          parameters. Each attempt should fail
    ***************************************************************************/
    inBufferNum = cbuffCreate((CBUFF *) 0, INBUFFERSIZE, &inBufferObj);

    outBufferNum = cbuffCreate(outBuffer, 0, &outBufferObj);

    testBuffer1Num = cbuffCreate(testBuffer1, TESTBUFFER1SIZE,
    								 (CBUFFOBJ *) 0);

    if (inBufferNum != 0)
    {
        /* Managed to create buffer with invalid parameters */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    if (outBufferNum != 0)
    {
        /* Managed to create buffer with invalid parameters */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    if (testBuffer1Num != 0)
    {
        /* Managed to create buffer with invalid parameters */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 2 - Create some buffer objects
    ***************************************************************************/

    inBufferNum = cbuffCreate(inBuffer, INBUFFERSIZE, &inBufferObj);
    outBufferNum = cbuffCreate(outBuffer, OUTBUFFERSIZE, &outBufferObj);
    testBuffer1Num = cbuffCreate(testBuffer1, TESTBUFFER1SIZE,
    								 &testBuffer1Obj);
    testBuffer2Num = cbuffCreate(testBuffer2, TESTBUFFER2SIZE,
    								 &testBuffer2Obj);

                                        /* Check that we get a buffer number  */
                                        /* back. Also check which buffer      */
                                        /* number we got. The buffer number   */
                                        /* is not so important, but it checks */
                                        /* that the algorithm assigned        */
                                        /* consecutive numbers. If it didn't  */
                                        /* there might be a bug.              */
    if (inBufferNum != 1)
    {
        /* If inBufferNum isn't 1, allocation didn't work */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    if (outBufferNum != 2)
    {
        /* If outBufferNum isn't 2, allocation didn't work */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    if (testBuffer1Num != 3)
    {
        /* If testBuffer1Num isn't 3, allocation didn't work */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    if (testBuffer2Num != 4)
    {
        /* If testBuffer2Num isn't 4, allocation didn't work */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 3 - Try to destroy some buffer objects that don't exist
    ***************************************************************************/

    x = cbuffDestroy(16);

    if (x == CBUFF_DESTROY_OK)
    {
        /* Destroyed a buffer that was not allocated */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    x = cbuffDestroy(5);

    if (x == CBUFF_DESTROY_OK)
    {
        /* Destroyed a buffer that was not allocated */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 4 - Destroy the two testBufferObjs
    ***************************************************************************/

    x = cbuffDestroy(testBuffer1Num);

    if (x != CBUFF_DESTROY_OK)
    {
        /* Failed to destroy a buffer that was allocated */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    x = cbuffDestroy(testBuffer2Num);

    if (x != CBUFF_DESTROY_OK)
    {
        /* Failed to destroy a buffer that was allocated */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 5 - Create the two testBufferObjs again but in reverse order
    *          to test 2 - should assign buffer numbers in reverse order
    ***************************************************************************/
    testBuffer2Num = cbuffCreate(testBuffer2, TESTBUFFER2SIZE,
    								 &testBuffer2Obj);
    testBuffer1Num = cbuffCreate(testBuffer1, TESTBUFFER1SIZE,
    								 &testBuffer1Obj);

    if (testBuffer1Num != 4)
    {
        /* If testBuffer1Num isn't 4, allocation didn't work */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    if (testBuffer2Num != 3)
    {
        /* If testBuffer2Num isn't 3, allocation didn't work */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 6 - Ensure we can't get handle to buffers that doesn't exist
    ***************************************************************************/
    hInBuffer = cbuffOpen(16);

    if (hInBuffer != (CBUFFOBJ *) 0)
    {
        /* Managed to get a pointer to a buffer object that doesn't exist */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    hInBuffer = cbuffOpen(5);

    if (hInBuffer != (CBUFFOBJ *) 0)
    {
        /* Managed to get a pointer to a buffer object that doesn't exist */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 7 - Ensure we can get handle to properly created buffers
    ***************************************************************************/
    hInBuffer = cbuffOpen(inBufferNum);

    hOutBuffer = cbuffOpen(outBufferNum);

    if (hInBuffer == (CBUFFOBJ *) 0)
    {
        /* Failed to get handle to valid, available buffer */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    if (hOutBuffer == (CBUFFOBJ *) 0)
    {
        /* Failed to get handle to valid, available buffer */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 8 - Try to obtain handle to open buffers - should fail
    ***************************************************************************/
    hDummyHandle = cbuffOpen(inBufferNum);

    if (hDummyHandle != (CBUFFOBJ *) 0)
    {
        /* Managed to get handle to a buffer that is already open */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    hDummyHandle = cbuffOpen(outBufferNum);

    if (hDummyHandle != (CBUFFOBJ *) 0)
    {
        /* Managed to get handle to a buffer that is already open */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 9 - Try to release handles to open buffers
    ***************************************************************************/

    inBufferNum = cbuffClose(hInBuffer);

    outBufferNum = cbuffClose(hOutBuffer);

    if (inBufferNum != 1)
    {
        /* Failed to close buffer object */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    if (outBufferNum != 2)
    {
        /* Failed to close buffer object */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 10 - Try to release handles to buffer which is not open
    ***************************************************************************/

    testBuffer1Num = cbuffClose(hOutBuffer);

    if (testBuffer1Num != 0)
    {
        /* Managed to release a buffer object that was already released */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * Open two main buffers for further tests
    ***************************************************************************/

    hInBuffer = cbuffOpen(inBufferNum);

    hOutBuffer = cbuffOpen(outBufferNum);


    /***************************************************************************
    * TEST 11 - Check sizes of both buffers are correctly calculated
    ***************************************************************************/
    spaceRemainingInBuffer = cbuffGetSpace(hInBuffer);
    if (spaceRemainingInBuffer != INBUFFERSIZE)
    {
        /* ERROR - We have an incorrect buffer size return value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != OUTBUFFERSIZE)
    {
        /* ERROR - We have an incorrect buffer size return value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    dataInBuffer = cbuffGetFill(hInBuffer);
    if (dataInBuffer != 0)
    {
        /* ERROR - we have incorrect fill value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    dataInBuffer = cbuffGetFill(hOutBuffer);
    if (dataInBuffer != 0)
    {
        /* ERROR - we have incorrect fill value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 12 - Fill buffers - ensure we can't overrun using cbuffPutByte
    ***************************************************************************/
    writeData = 'A';
    x = 0;
    /* Fill buffer until cbuffPutByte tells us we can't write any more */
    while (x < 0xFF)
    {
        if ((cbuffPutByte(hOutBuffer, writeData)) == CBUFF_PUT_OK)
        {
            writeData++;
            x++;
        }
        else
        {
            break;
        }
    }
    if (x == 0xFF)
    {
        /* ERROR - Buffer overrun not detected */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != 0)
    {
        /* ERROR - Space remaining should be 0 */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    dataInBuffer = cbuffGetFill(hOutBuffer);
    if (dataInBuffer != OUTBUFFERSIZE)
    {
        /* ERROR - Buffer should be full */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 13 - Read buffers - ensure we can't underrun using cbuffGetByte and
    *           check contents was stored correctly
    ***************************************************************************/
    readData = '\0';
    writeData = 'A';
    x = 0;
    /* Read buffer until cbuffGetByte tells us we can't read any more */
    while (x < 0xFF)
    {
        if ((cbuffGetByte(hOutBuffer, &readData)) == CBUFF_GET_OK)
        {
            if (readData != writeData)
            {
                /* ERROR - data read was incorrect */
#ifdef __i386__
                assert(0);
#else
                while(1);
#endif
            }
            else
            {
                writeData++;
                x++;
            }
        }
        else
        {
            break;
        }
    }
    if (x == 0xFF)
    {
        /* ERROR - Buffer underrun not detected */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != OUTBUFFERSIZE)
    {
        /* ERROR - Space remaining should be OUTBUFFERSIZE */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    dataInBuffer = cbuffGetFill(hOutBuffer);
    if (dataInBuffer != 0)
    {
        /* ERROR - Buffer should be empty */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 14 - Check buffer sizes calculate correctly when there is some data
    *           in the buffer, and also when for head-before-tail and tail-
    *           before-head situations
    ***************************************************************************/
    writeData = 'a';
    x = 0;
    /* Fill buffer with some data */
    while (x < (OUTBUFFERSIZE - 10) )
    {
        if ((cbuffPutByte(hOutBuffer, writeData)) == CBUFF_PUT_OK)
        {
            writeData++;
            x++;
        }
        else
        {
            /* ERROR - cbuffPutByte failed unexpectedly */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
        }
    }

    /* Check sizes are correctly calculated */
    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != 10 )
    {
        /* ERROR - Space remaining should be OUTBUFFERSIZE */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    dataInBuffer = cbuffGetFill(hOutBuffer);
    if (dataInBuffer != (OUTBUFFERSIZE - 10))
    {
        /* ERROR - Buffer fill incorrectly calculated */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /* Read out buffer contents*/
    while(cbuffGetByte(hOutBuffer, &readData) == CBUFF_GET_OK);
    /* Add some data to buffer so that inPointer buffer wrap occurs */
    writeData = 'A';
    x = 0;
    /* Fill buffer with some data */
    while (x < (OUTBUFFERSIZE - 10) )
    {
        if ((cbuffPutByte(hOutBuffer, writeData)) == CBUFF_PUT_OK)
        {
            writeData++;
            x++;
        }
        else
        {
            /* ERROR - cbuffPutByte failed unexpectedly */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
        }
    }

    /* Check sizes are correctly calculated */
    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != 10 )
    {
        /* ERROR - Space remaining should be OUTBUFFERSIZE */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    dataInBuffer = cbuffGetFill(hOutBuffer);
    if (dataInBuffer != (OUTBUFFERSIZE - 10))
    {
        /* ERROR - Buffer fill incorrectly calculated */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 15 - Clear this buffer and ensure that function calls return that
    *           buffer is empty
    ***************************************************************************/
    /* Clear this buffer to start new tests */
    cbuffClearBuffer(hOutBuffer);

    /* Check buffer is empty */
    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != OUTBUFFERSIZE)
    {
        /* ERROR - we have an incorrect buffer size return value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    dataInBuffer = cbuffGetFill(hOutBuffer);
    if (dataInBuffer != 0)
    {
        /* ERROR - Buffer fill incorrectly calculated */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 16 - Check cbuffPeekHead and cbuffPeekTail don't read anything from
    *           an empty buffer
    * NOTE: This test relies upon the status of the previous test, i.e. that the
    *       buffers used are empty!
    ***************************************************************************/
    if ((cbuffPeekHead(hOutBuffer, &readData)) == CBUFF_GET_OK)
    {
        /* ERROR - peeked head data that isn't there */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    if ((cbuffPeekTail(hOutBuffer, &readData)) == CBUFF_GET_OK)
    {
        /* ERROR - peeked tail data that isn't there */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 17 - Put some data in the buffer and then peek the head and tail
    *
    ***************************************************************************/
    /* Empty buffers to start with known state */
    cbuffClearBuffer(hOutBuffer);

    writeData = 'a';
    for (x = 0; x < 10; x++)
    {
        cbuffPutByte(hOutBuffer, writeData);
        writeData++;
    }

    if ((cbuffPeekHead(hOutBuffer, &readData)) != CBUFF_GET_OK)
    {
        /* ERROR - couldn't peek head data */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    if (readData != (writeData-1))
    {
        /* ERROR - peeked incorrect head data */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    if ((cbuffPeekTail(hOutBuffer, &readData)) != CBUFF_GET_OK)
    {
        /* ERROR - couldn't peek tail data */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    if (readData != 'a')
    {
        /* ERROR - peeked incorrect tail data */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 18 - Check cbuffPeekHead works when inPointer points to startOfBuffer
    * NOTE: This test relies upon the status of the previous test!
    ***************************************************************************/
    /* Read some bytes out of buffer */
    for (x = 0; x < 6; x++)
    {
        cbuffGetByte(hOutBuffer, &readData);
    }

    /* Write enough bytes to get inPointer on startOfBuffer boundary */
    writeData = 'a';
    for (x = 0; x < 22; x++)
    {
        cbuffPutByte(hOutBuffer, writeData);
        writeData++;
    }

    if ((cbuffPeekHead(hOutBuffer, &readData)) != CBUFF_GET_OK)
    {
        /* ERROR - couldn't peek head data */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    if (readData != (writeData-1))
    {
        /* ERROR - peeked incorrect head data */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 19 - Check cbuffUnputByte function
    ***************************************************************************/
    /* Put some data in empty buffer */
    cbuffClearBuffer(hOutBuffer);
    writeData = '1';
    for (x = 0; x < 8; x++)
    {
        if (cbuffPutByte(hOutBuffer, writeData) == CBUFF_PUT_OK)
        {
            writeData++;
        }
        else
        {
            /* ERROR - couldn't put byte in buffer */
#ifdef __i386__
            assert(0);
#else
            while(1);
#endif
        }
    }

    writeData-=2;
    /* unput the data and check that it matches what we wrote */
    /* Also check we can't unput more data than is there      */
    x = 0;
    do
    {
        if(!cbuffUnputByte(hOutBuffer))
        {
            if (cbuffPeekHead(hOutBuffer, &readData) != CBUFF_GET_FAIL)
            {
                if (readData != writeData)
                {
                    /* ERROR - unput byte didn't move pointer correctly */
#ifdef __i386__
                    assert(0);
#else
                    while(1);
#endif
                }
                writeData--;
                x++;
            }
        }
        else
        {
            /* If we can't unput data, break from loop */
            break;
        }
    } while(x < 0xFF);

    /* Check we weren't able to read too much data */
    if (x >= 8)
    {
        /* ERROR - unput too many bytes */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /* Check buffer is now empty */
    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != OUTBUFFERSIZE)
    {
        /* ERROR - we have an incorrect buffer size return value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 20 - Try to unput over the wrap boundary
    ***************************************************************************/
    /* Start with an empty buffer */
    cbuffClearBuffer(hOutBuffer);
    
    writeData = 'A';
    for (x = 0; x < 10; x++)
    {
        cbuffPutByte(hOutBuffer, writeData);
        writeData++;
    }
    
    /* Read data out again */
    while (cbuffGetByte(hOutBuffer, &readData) == CBUFF_GET_OK);
    
    /* Fill buffer so we wrap the boundary */
    writeData = 'A';
    while (cbuffPutByte(hOutBuffer, writeData) == CBUFF_PUT_OK)
    {
        writeData++;
    }
    writeData-=2;
    
    /* unput the data and check that it matches what we wrote */
    /* Also check we can't unput more data than is there and the wrap-around works */
    x = 0;
    do
    {
        if(!cbuffUnputByte(hOutBuffer))
        {
            if (cbuffPeekHead(hOutBuffer, &readData) != CBUFF_GET_FAIL)
            {
                if (readData != writeData)
                {
                    /* ERROR - unput byte didn't move pointer correctly */
#ifdef __i386__
                    assert(0);
#else
                    while(1);
#endif
                }
                writeData--;
                x++;
            }
        }
        else
        {
            /* If we can't unput data, break from loop */
            break;
        }
    } while(x < 0xFF);
    
    /* Check buffer is now empty */
    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != OUTBUFFERSIZE)
    {
        /* ERROR - we have an incorrect buffer size return value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 20a - Check cbuffUngetByte function - first fill the buffer with
    *            some known data, then remove some, then unget it i.e. put it
    *            back. 
    ***************************************************************************/
    /* Put some data in empty buffer */
    cbuffClearBuffer(hOutBuffer);
    writeData = 'a';
    for (x = 0; x < OUTBUFFERSIZE; x++)
    {
        if (cbuffPutByte(hOutBuffer, writeData) == CBUFF_PUT_OK)
        {
            writeData++;
        }
        else
        {
            /* ERROR - couldn't put byte in buffer */
#ifdef __i386__
            assert(0);
#else
            while(1);
#endif
        }
    }

    /* Take out all the bytes of data */
    for (x = 0; x < OUTBUFFERSIZE; x++)
    {
        if (cbuffGetByte(hOutBuffer, &readData) != CBUFF_GET_OK)
        {
            /* ERROR - couldn't get byte from buffer */
#ifdef __i386__
            assert(0);
#else
            while(1);
#endif
        }
    }
    
    writeData-=1;
    
    /* unget all the data and check that it matches what we wrote */
    /* Also check we can't unput more data than is there          */
    x = 0;
    do
    {
        if(!cbuffUngetByte(hOutBuffer))
        {
            if (cbuffPeekTail(hOutBuffer, &readData) != CBUFF_GET_FAIL)
            {
                if (readData != writeData)
                {
                    /* ERROR - unput byte didn't move pointer correctly */
#ifdef __i386__
                    assert(0);
#else
                    while(1);
#endif
                }
                writeData--;
                x++;
            }
        }
        else
        {
            /* If we can't unput data, break from loop */
            break;
        }
    } while(x < 0xFF);

    /* Check we weren't able to unget more data than available */
    if (x != OUTBUFFERSIZE)
    {
        /* ERROR - unput too many bytes */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /* Check buffer contains has no space */
    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != 0)
    {
        /* ERROR - we have an incorrect buffer size return value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 20b - Check cbuffUngetByte functions over the wrap boundary - 
    *            prefill buffer with some data to move the pointers away from
    *            the start of the buffer boundary. Then fill the buffer with 
    *            some known data, then remove some, then unget it i.e. put it
    *            back. 
    ***************************************************************************/
    /* Put some data in empty buffer to move pointers away from start address */
    cbuffClearBuffer(hOutBuffer);
    writeData = '1';
    for (x = 0; x < 8; x++)
    {
        if (cbuffPutByte(hOutBuffer, writeData) == CBUFF_PUT_OK)
        {
            writeData++;
        }
        else
        {
            /* ERROR - couldn't put byte in buffer */
#ifdef __i386__
            assert(0);
#else
            while(1);
#endif
        }
    }

    /* Take out all that data */
    for (x = 0; x < 8; x++)
    {
        if (cbuffGetByte(hOutBuffer, &readData) != CBUFF_GET_OK)
        {
            /* ERROR - couldn't get byte from buffer */
#ifdef __i386__
            assert(0);
#else
            while(1);
#endif
        }
    }
    
    /* Now fill the buffer with data; wraps across boundary */
    writeData = 'A';
    for (x = 0; x < OUTBUFFERSIZE; x++)
    {
        if (cbuffPutByte(hOutBuffer, writeData) == CBUFF_PUT_OK)
        {
            writeData++;
        }
        else
        {
            /* ERROR - couldn't put byte in buffer */
#ifdef __i386__
            assert(0);
#else
            while(1);
#endif
        }
    }

    /* Take out all that data */
    for (x = 0; x < OUTBUFFERSIZE; x++)
    {
        if (cbuffGetByte(hOutBuffer, &readData) != CBUFF_GET_OK)
        {
            /* ERROR - couldn't get byte from buffer */
#ifdef __i386__
            assert(0);
#else
            while(1);
#endif
        }
    }
        
    writeData-=1;
    
    /* unget all the data and check that it matches what we wrote */
    /* Also check we can't unput more data than is there - this   */
    /* 'ungets' over the wrap boundary                            */
    x = 0;
    do
    {
        if(!cbuffUngetByte(hOutBuffer))
        {
            if (cbuffPeekTail(hOutBuffer, &readData) != CBUFF_GET_FAIL)
            {
                if (readData != writeData)
                {
                    /* ERROR - unput byte didn't move pointer correctly */
#ifdef __i386__
                    assert(0);
#else
                    while(1);
#endif
                }
                writeData--;
                x++;
            }
        }
        else
        {
            /* If we can't unput data, break from loop */
            break;
        }
    } while(x < 0xFF);

    /* Check we weren't able to unget more data than available */
    if (x != OUTBUFFERSIZE)
    {
        /* ERROR - unput too many bytes */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /* Check buffer contains has no space */
    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
    if (spaceRemainingInBuffer != 0)
    {
        /* ERROR - we have an incorrect buffer size return value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    
    /***************************************************************************
    * TEST 21 - Try to put data in circular buffer from an array
    ***************************************************************************/
    cbuffClearBuffer(hInBuffer);
    cbuffClearBuffer(hOutBuffer);

    /* Fill buffer with test data */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = x + 'A';
    }

    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);

    if (dataInBuffer != 16)
    {
        /* ERROR - didn't write expected number of bytes in buffer */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    dataInBuffer = cbuffGetFill(hOutBuffer);
    spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);

    if (dataInBuffer != 16)
    {
        /* ERROR - buffer fill doesn't match expected value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    if (spaceRemainingInBuffer != 16)
    {
        /* ERROR - bytes remaining doesn't match expected value */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    /* Read data out again and compare */
    for(x = 0; x < 16; x++)
    {
        cbuffGetByte(hOutBuffer, &readData);
        if (testBuffer2[x] != readData)
        {
            /* ERROR - data read from buffer doesn't match data written to    */
            /* buffer                                                         */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
        }
    }

    /***************************************************************************
    * TEST 22 - Try to overfill a circular buffer from an array
    ***************************************************************************/
    cbuffClearBuffer(hOutBuffer);

    /* Fill buffer with test data */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = x + 'a';
    }

    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
    if (dataInBuffer != 16)
    {
        /* ERROR - failed to write correct number of bytes to buffer which    */
        /*         had enough space                                           */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
    if (dataInBuffer != 16)
    {
        /* ERROR - failed to write correct number of bytes to buffer which    */
        /*         had enough space                                           */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);

    if (dataInBuffer != 0)
    {
        /* ERROR - managed to put data into a full buffer */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 23 - Try write a circular buffer from an array over the circ buff
    *           boundary
    ***************************************************************************/
    /* Put new data in buffer */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = x + '0';
    }
    /* Remove eight bytes from buffer tail, and read eight bytes out */
    for (x = 0; x < 8; x++)
    {
        cbuffUnputByte(hOutBuffer);
        cbuffGetByte(hOutBuffer, &readData);
    }
    /* Put data in the buffer from an array */
    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
    if (dataInBuffer != 16)
    {
        /* ERROR - couldn't get all expected data into buffer */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    /* Read data out and check all is ok */
    /* First, read sixteen bytes out */
    for (x = 0; x < 16; x++)
    {
        cbuffGetByte(hOutBuffer, &readData);
    }
    /* Read data out again and compare */
    for(x = 0; x < 16; x++)
    {
        cbuffGetByte(hOutBuffer, &readData);
        if (testBuffer2[x] != readData)
        {
            /* ERROR - data read from buffer doesn't match data written to    */
            /* buffer                                                         */
#ifdef __i386__
            assert(0);
#else
            while(1);
#endif
        }
    }

    /***************************************************************************
    * TEST 24 - Try to read data out of circular buffer into an array
    ***************************************************************************/
    /* Empty buffer */
    cbuffClearBuffer(hOutBuffer);

    /* Put new data in array */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = x + 'a';
    }
    /* Put data in the buffer from an array */
    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
    /* Clear local array */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = 0;
    }
    /* Read buffer out into local array */
    dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 16);
    if (dataInBuffer != 16)
    {
        /* ERROR - didn't read required quantity of data */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    /* Check what we read is correct */
    for(x = 0; x < 16; x++)
    {
        if (testBuffer2[x] != x + 'a')
        {
            /* ERROR - data read doesn't match data written */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
        }
    }

    /***************************************************************************
    * TEST 25 - Try to underflow a circular buffer when reading to array
    ***************************************************************************/
    /* Empty buffer */
    cbuffClearBuffer(hOutBuffer);

    /* Put new data in array */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = x + 'A';
    }
    /* Put some data from array in the buffer */
    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 8);
    /* Clear local array */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = 0;
    }
    /* Try to read more that is there */
    dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 16);
    if (dataInBuffer != 8)
    {
        /* ERROR - read more/less data than in buffer - should only have read */
        /*         8 bytes                                                    */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }

    /***************************************************************************
    * TEST 26 - Try to read circular buffer into array over buffer boundary
    ***************************************************************************/
    /* Empty buffer */
    cbuffClearBuffer(hOutBuffer);

    /* Put new data in array */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = x + '0';
    }
    /* Put some data in the buffer with data from array */
    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 8);
    /* Read the some data out */
    dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 16);
    dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 8);
    /* Put some more data in the buffer, writing over buffer boundary */
    dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
    /* Clear local array */
    for(x = 0; x < 16; x++)
    {
        testBuffer2[x] = 0;
    }
    /* Read out over the boundary into the array */
    dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 16);
    if (dataInBuffer != 16)
    {
        /* ERROR - didn't read 16 bytes from buffer */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
    }
    /* Check what we read is correct */
    for(x = 0; x < 16; x++)
    {
        if (testBuffer2[x] != x + '0')
        {
            /* ERROR - data read doesn't match data written */
#ifdef __i386__
        assert(0);
#else
        while(1);
#endif
        }
    }

    /* Congratulations! If we stop here all tests passed */
#ifdef __i386__
    printf("*** All tests for -cbuff- passed ***");
#else
    while(1);
#endif

#ifdef __i386__
    return 0;
#endif
}

/*******************************************************************************
*
*                           CIRCULAR BUFFER MODULE END
*
*******************************************************************************/
