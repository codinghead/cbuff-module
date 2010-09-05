/*******************************************************************************
*
* CIRCULAR BUFFER MODULE
*
*******************************************************************************/

/*******************************************************************************
*
* Provides a universal 'unsigned char' circular buffer.
*
* Filename : cbuff.c
* Version : V0.03
* Programmer(s) : Suart Cording aka CODINGHEAD 
* 
********************************************************************************
* Note(s) : 
* V0.03 - 7th May 2010 - renamed all API calls and typedefs so that circular
* buffer related function names, data types etc. begin with "cbuff".
*                      - removed Summary of CBUFF_OVERRUN in cbuff.h as it
* was not being used (possibilty of overrun was removed in V0.01)
*                      - moved usage of CBUFF_OPEN into the 
* CBUFFOBJ->localFlag instead of using CBUFFOBJ->bufferNumber high bit.
*                      - Clarified and improved comments for heading of each
* function
*                      - Fixed bug in cbuffDestroy which caused "Bus Exception. 
* Unimplemented RAM memory access" on the PIC32 due to pointer to NULL being
* used for the evaluation of the "bufferNumber" element. Problem should have 
* been apparent on other architectures too.
*
* V0.02 - 16th March 2010 - re-wrote the API to allow the creation of buffers 
* to which a handle can then be obtained with the "open" function"
*
*******************************************************************************/

/*******************************************************************************
*
*                            CIRCULAR BUFFER MODULE
*
*******************************************************************************/
#define CIRCULAR_BUFFER_MODULE

/*******************************************************************************
*                                 INCLUDE FILES
*******************************************************************************/
#include "cbuff.h"

/*******************************************************************************
*                                 LOCAL DEFINES
*******************************************************************************/

/*******************************************************************************
* Summary:
*   Bit flag used to signal buffer full in cbuffPutByte(), cbuffGetSpace(),
* cbuffGetByte(), cbuffUnputByte(), cbuffPutArray()
*******************************************************************************/
#define CBUFF_FULL         (0x01 << 7)

/*******************************************************************************
* Summary:
*   Bit flag used to signal buffer empty in cbuffCreate(), cbuffPutByte(),
* cbuffClearBuffer(), cbuffGetByte(), cbuffPeekHead(), cbuffUnputByte(),
* cbuffPutArray(), cbuffGetArray()
*******************************************************************************/
#define CBUFF_EMPTY        (0x01 << 6)

/*******************************************************************************
* Summary:
*   Max number of buffers we can support as used in cbuffCreate() (in reality 
* the limit lies at (MAXCBUFFS - 2) because 0 is reserved for case where 
* buffer is not open, and 0xFF cannot be used)
*******************************************************************************/
#define MAX_CBUFFS       	0xFF

/*******************************************************************************
* Summary:
*   Bit flag used to signal buffer is open and in use as used in cbuffOpen()
*   and cbuffClose()
*******************************************************************************/
#define CBUFF_OPEN         (0x01 << 5)

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

/*******************************************************************************
* Global variable startOfCbuffObjs                                                     
* Summary:
*   Pointer to linked list of Circular Buffer Objects. Local scope only within
*   this module
*******************************************************************************/
static CBUFFOBJ * startOfCbuffObjs;


/*******************************************************************************
*                             LOCAL FUNCTION PROTOTYPES
*******************************************************************************/


/*******************************************************************************
*                            LOCAL CONFIGURATION ERRORS
*******************************************************************************/

/*******************************************************************************
* cbuffInit()
*
* Summary: 
*   Initializes the circular buffer module
*
* See also:
*   cbuffDeinit()
*
* Arguments: 
*   void        - none
*
* Returns: 
*   void
*
* Callers: 
*   User application
*
* Notes : 
* 1. Must be called before using any functions in this module
*
*******************************************************************************/
void cbuffInit(void)
{
                                        /* Initialise the linked list pointer */
    startOfCbuffObjs = (CBUFFOBJ *) 0;
}

/*******************************************************************************
* cbuffDeinit()
*
* Summary: 
*   Deinitializes the circular buffer module
*
* See also:
*   cbuffInit()
*
* Arguments: 
*   void        - none
*
* Returns: 
*   void
*
* Callers: 
*   User application
*
* Notes : 
* 1. Caller is reposible for returning all current handles and deallocating
*    all buffers before calling cbuffDeinit()
* 2. The content of any buffers will remain in memory after this function is
*    called
*******************************************************************************/
void cbuffDeinit(void)
{
                                        /* Clear the linked list pointer      */
    startOfCbuffObjs = (CBUFFOBJ *) 0;
}


/*******************************************************************************
* cbuffCreate()
*
* Summary: 
*   Allocates a new circular buffer object in the linked list
*
* See also:
*   cbuffDestroy()
*
* Arguments: 
*   buffer	    		- a buffer defined by the caller
*   sizeOfBuffer		- size of aformentioned buffer in bytes
*	newCircBufferObj	- buffer object to insert into linked list of buffer
*						objects
*
* Returns: 
*   - 1 to MAX_CBUFFS  	- number the buffer has been assigned if it was possible
*                       to allocate it
*   - 0		            - if the buffer allocation failed
*
* Callers: 
*   User application
*
* Notes : 
* 1. Module can only handle a maximum of (MAX_CBUFF-2) buffers
* 2. It is recommended that the 'sizeOfBuffer' should always be at least 3 or
*    greater to be useful. This will, however, not be checked by this function
*******************************************************************************/
CBUFFNUM   cbuffCreate(CBUFF        * buffer,
                       unsigned int   sizeOfBuffer,
                       CBUFFOBJ     * newCircBufferObj)
{
    CBUFFOBJ * localCircBufferObj;
    CBUFFNUM   circBuffNum = 1;      /* Assign starting buffer number, 1,  */
                                        /* for use when searching for the     */
                                        /* next free buffer number            */
                                        /* 0 reserved for alloc failed!       */
    
                                        /* Ensure there is a buffer and it    */
                                        /* has size                           */
    if ((buffer != (unsigned char *) 0) && (sizeOfBuffer != 0))
    {
                                        /* Ensure we got somewhere to create  */
                                        /* our buffer object                  */
        if (newCircBufferObj != (CBUFFOBJ *) 0)
        {
                                        /* Setup buffer object                */
            newCircBufferObj->startOfBuffer = buffer;
            newCircBufferObj->endOfBuffer   = buffer + (sizeof(CBUFF) * 
                                              (sizeOfBuffer - 1));
            newCircBufferObj->inPointer  = buffer;
            newCircBufferObj->outPointer = buffer;
                                        /* Clear all flags                    */
            newCircBufferObj->localFlag = 0x00;
                                        /* Set buffer empty flag              */
            newCircBufferObj->localFlag |= CBUFF_EMPTY;
                                        /* Ensure we point to NULL            */
            newCircBufferObj->nextCircBufferObj = (CBUFFOBJ *) 0;
            
                                        /* Find place for buffer object in    */
                                        /* the linked list and assign number  */
                                        /* If there is nothing in the list,   */
                                        /* just put this object in the first  */
                                        /* position                           */
            if (startOfCbuffObjs == (CBUFFOBJ *) 0)
            {
                startOfCbuffObjs = newCircBufferObj;
                newCircBufferObj->bufferNumber = 1;
            }    
                                        /* Otherwise find last item in list   */
                                        /* and add this at end                */
            else
            {   
                                        /* First find a free buffer number    */
                                        /* for this buffer                    */
                localCircBufferObj = startOfCbuffObjs;
                while (localCircBufferObj != (CBUFFOBJ *) 0)
                {
                    if (localCircBufferObj->bufferNumber == circBuffNum)
                    {
                                        /* Found a buffer with this number    */
                                        /* Increment buff num and try again   */
                        circBuffNum ++;
                                        /* Check we are not trying to assign  */
                                        /* more buffers than we can handle    */
                        if (circBuffNum >= MAX_CBUFFS)
                        {
                                        /* If we get here we allocated all    */
                                        /* the buffer objects we can handle.  */
                                        /* Inform caller allocation failed    */
                            goto AllocFailed;
                        }
                                        /* Restart search from first object   */
                        localCircBufferObj = startOfCbuffObjs;
                    }
                    else
                    {
                                        /* Otherwise search next object in    */
                                        /* list                               */
                        localCircBufferObj = 
                                          localCircBufferObj->nextCircBufferObj;
                    }
                }
                                        /* We have a free buffer number       */
                newCircBufferObj->bufferNumber = circBuffNum;

                                        /* Add this object to start of the    */
                                        /* buffer object list                 */
                newCircBufferObj->nextCircBufferObj = startOfCbuffObjs;
                startOfCbuffObjs = newCircBufferObj;
            }
            
            return newCircBufferObj->bufferNumber;
        }    
	}
                                        /* If buffer allocation failed,       */
                                        /* return 0 to callee                 */
AllocFailed:
    return 0;
}


/*******************************************************************************
* cbuffDestroy()
*
* Summary: 
*   Destroys an existing circular buffer object removing it from the linked list
*
* See also:
*   cbuffCreate()
*
* Arguments: 
*   CBUFFNUM	    	- number of buffer to destroy (as returned by 
*                       cbuffClose() )
*
* Returns: 
*  - CBUFF_DESTROY_FAIL - failed to destroy requested object
*  - CBUFF_DESTROY_OK   - destroyed request object successfully
*
* Callers: 
*   User application
*
* Notes : 
* 1. Caller must have 'created' (cbuffCreate) at least one circular buffer 
*    object before calling this function
* 2. Destroying a buffer object does not delete the buffes content, nor free
*    the associated CBUFFOBJ memory used
*******************************************************************************/
unsigned char cbuffDestroy(CBUFFNUM bufferNumber)
{
    /* #### ToDo: need to check if buffer is currently open before destroying */
    CBUFFOBJ * localCircBufferObj;
    CBUFFOBJ * tempCircBufferObj;
    
                                        /* Search through the list of objects */
                                        /* and remove selected object         */
                                        /* Find first object in list          */
    localCircBufferObj = startOfCbuffObjs;
    
                                        /* If the object is the first in the  */
                                        /* list, simply remove first object   */
    if (localCircBufferObj->bufferNumber == bufferNumber)
    {
        startOfCbuffObjs = localCircBufferObj->nextCircBufferObj;
        return CBUFF_DESTROY_OK;
    }    

                                        /* Parse through list of objects      */
                                        /* until we find the object or find   */
                                        /* no object with that number         */
    do
    {
                                        /* Save pointer to currect object in  */
                                        /* case next object will be removed   */
        tempCircBufferObj = localCircBufferObj;
                                        /* Ensure that this object actaully   */
                                        /* points to another object and not   */
                                        /* to NULL                            */
        if(localCircBufferObj->nextCircBufferObj != (CBUFFOBJ *) 0)
        {
                                        /* Point to that next object in       */
                                        /* list...                            */                          
            localCircBufferObj = localCircBufferObj->nextCircBufferObj;
                                        /* ...and see if it is the            */
                                        /* buffer we are searching for        */
            if (localCircBufferObj->bufferNumber == bufferNumber)
            {
                                        /* If so, remove this item from list  */
                                        /* by pointing previous object to     */
                                        /* where this object points           */
                tempCircBufferObj->nextCircBufferObj =
                    localCircBufferObj->nextCircBufferObj;
                return CBUFF_DESTROY_OK;
            }
        }    
        
    } while(localCircBufferObj->nextCircBufferObj != (CBUFFOBJ *) 0);

                                       /* Couldn't find the desired object    */
    return CBUFF_DESTROY_FAIL;                    
}

    
/*******************************************************************************
* cbuffOpen()
*
* Summary: 
*   Opens a circular buffer for use by caller and initialises an HCBUFFOBJ
*   handle to it
*
* See also:
*   cbuffClose()
*
* Arguments: 
*   bufferNumber    - number of an existing circular buffer object to use
*
* Returns: 
*   - NULL	        - if buffer couldn't be created
*   - handle        - if buffer was created properly
*
* Callers: 
*   User application
*
* Notes : 
* 1. Caller must have created (cbuffCreate) at least one circular buffer object 
*    before calling this function
*******************************************************************************/
HCBUFF cbuffOpen(CBUFFNUM bufferNumber)
{
	CBUFFOBJ * localCircBufferObj;
	
                                        /* Check that a CBUFFNUM object    */
                                        /* exists with bufferNumber           */
    localCircBufferObj = startOfCbuffObjs;
    
    do
    {
	    if (localCircBufferObj->bufferNumber == bufferNumber)
	    {
    	                                /* Check buffer is not already open   */
            if (!(localCircBufferObj->localFlag & CBUFF_OPEN))
            {
                                        /* Note that it is now in use         */
                localCircBufferObj->localFlag |= CBUFF_OPEN;
    	                                /* Return handle to it                */
    	        return localCircBufferObj;
    	    }
    	                                /* If buffer is already open, return  */
    	                                /* NULL handle pointer                */
    	    else
    	    {
        	    return (CBUFFOBJ *) 0;
        	}    
    	}    
    	else
    	{
        	localCircBufferObj = localCircBufferObj->nextCircBufferObj;
        }   	
	} while (localCircBufferObj != (CBUFFOBJ *) 0);

    	                                /* Return handle to NULL otherwise    */
    return (CBUFFOBJ *) 0;
}

/*******************************************************************************
* cbuffClose()
*
* Summary: 
*   Closes a circular buffer and releases the handle to it
*
* See also:
*   cbuffOpen()
*
* Arguments: 
*   hCircBuffer     - handle to the open buffer
*
* Returns: 
*   - >0  	        - number of buffer object if buffer was open
*   - 0             - if the buffer object was not open
*
* Callers: 
*   User application
*
* Notes : 
* 1. Caller must have 'allocated' at least one circular buffer object before
*    calling this function
*
*******************************************************************************/
CBUFFNUM cbuffClose(HCBUFF hCircBuffer)
{
    	                                /* Check buffer is actually open      */
    if (hCircBuffer->localFlag & CBUFF_OPEN)
    {
    	                                /* Note that this buffer object is    */
    	                                /* closed                             */
        hCircBuffer->localFlag &= ~CBUFF_OPEN;
                                        /* Return buffer object's buffer      */
                                        /* number                             */
        return hCircBuffer->bufferNumber;
    }
                                        /* Otherwise return 0 to say that     */
                                        /* buffer object wasn't open          */
    else
    {
        return (CBUFFNUM) 0;
    }    
}
    
/*******************************************************************************
* cbuffPutByte()
*
* Summary: 
*   Puts a single CBUFF into the buffer
*
* See also:
*   cbuffPutArray(), cbuffGetByte(), cbuffGetArray()
*
* Arguments: 
*   hCircBuffer         - handle to HCBUFF variable for this buffer instance
*   data                - the CBUFF data to be put into the buffer
*
* Returns: 
*   - CBUFF_PUT_OK      - operation was successful
*   - CBUFF_PUT_FAIL    - operation failed due to buffer being full
*
* Callers: 
*   User application.
*
* Notes : 
* 1. cbuffOpen() must have been successfully called before using this
*    function
*******************************************************************************/
unsigned char cbuffPutByte(HCBUFF hCircBuffer,
                           CBUFF  data)
{
                                        /* Check that there is somewhere to   */
                                        /* put data. If the CBUFF_FULL   */
                                        /* flag is set, there is no space     */
    if (hCircBuffer->localFlag & CBUFF_FULL)
    {
        return CBUFF_PUT_FAIL;
    }
    
    *hCircBuffer->inPointer = data;     /* Put data in buffer                 */

    hCircBuffer->inPointer++;           /* Increment pointer                  */

                                        /* Note that the buffer is no longer  */
                                        /* empty                              */
    hCircBuffer->localFlag &= ~CBUFF_EMPTY;
    
                                        /* Implement circular buffer          */
                                        /* wrap-around                        */
    if (hCircBuffer->inPointer > hCircBuffer->endOfBuffer)
    {
        hCircBuffer->inPointer = hCircBuffer->startOfBuffer;
    }
                                        /* Check that the buffer is not now   */
                                        /* full                               */
                                        
    if (hCircBuffer->inPointer == hCircBuffer->outPointer)
    {
                                        /* Set CBUFF_FULL flag so that   */
                                        /* we don't attempt to write more     */
                                        /* data into the buffer until some-   */
                                        /* thing is read out                  */
        hCircBuffer->localFlag |= CBUFF_FULL;
    }

    return CBUFF_PUT_OK;
}

/*******************************************************************************
* cbuffGetSpace()
*
* Summary: 
*   Returns how much space remains in buffer in CBUFFs
*
* See also:
*   cbuffGetFill()
*
* Arguments: 
*   hCircBuffer     - handle to HCBUFF variable for this buffer instance
*
* Returns: 
*   - unsigned int  - number of bytes space remaining in buffer
*
* Callers: 
*   User application, cbuffGetFill()
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
*******************************************************************************/
unsigned int cbuffGetSpace(HCBUFF     hCircBuffer)
{
#if 0
    unsigned int localEndOfBuffer;
    unsigned int localStartOfBuffer;
    unsigned int localOutPointer;
    unsigned int localInPointer;

    localEndOfBuffer =   (unsigned int) &hCircBuffer->endOfBuffer 
                                         + sizeof(CBUFF);
    localStartOfBuffer = (unsigned int) &hCircBuffer->startOfBuffer;
    
    localOutPointer = (unsigned int) &hCircBuffer->outPointer;
    localInPointer  = (unsigned int) &hCircBuffer->inPointer;
#endif
   
                                        /* If CBUFF_FULL is              */
                                        /* set, then there is no space in     */
                                        /* buffer; simply return 0            */
    if (hCircBuffer->localFlag & CBUFF_FULL)
    {
        return 0;
    }
                                        /* If CBUFF_EMPTY is set, then   */
                                        /* simply return size of buffer       */
    if (hCircBuffer->localFlag & CBUFF_EMPTY)
    {
#if 1
        return (unsigned int) ((hCircBuffer->endOfBuffer + sizeof(CBUFF)) -
                                hCircBuffer->startOfBuffer);
#endif
#if 0
        return (localEndOfBuffer - localStartOfBuffer);
#endif
    }
                                        /* If inPointer is larger than the    */
                                        /* outPointer in physical value, the  */
                                        /* remaining buffer space is the      */
                                        /* (endOfBuffer - inPointer + 1) +    */
                                        /* (outPointer - startOfBuffer + 1)   */
    if (hCircBuffer->inPointer > hCircBuffer->outPointer)
    {
        return (unsigned int) ( (hCircBuffer->endOfBuffer -
                                 hCircBuffer->startOfBuffer + sizeof(CBUFF))
                              - (hCircBuffer->inPointer - 
                                 hCircBuffer->outPointer));
    }
                                        /* If outPointer is larger than the   */
                                        /* inPointer in physical value, the   */
                                        /* remaining buffer space is the      */
                                        /* outPointer - inPointer        */
    else /*if (hCircBuffer->inPointer < hCircBuffer->outPointer)*/
    {
#if 1
        return (unsigned int) (hCircBuffer->outPointer -
                               hCircBuffer->inPointer);
#endif
#if 0
        return (localOutPointer - localInPointer);
#endif
    }
}

/*******************************************************************************
* cbuffGetFill()
*
* Summary: 
*   Returns how many CBUFFs remain in buffer
*
* See also:
*   cbuffGetSpace()
*
* Arguments: 
*   hCircBuffer     - handle to HCBUFF variable for this buffer instance
*
* Returns: 
*   - unsigned int  - number of bytes data remaining in buffer
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
*
*******************************************************************************/
unsigned int cbuffGetFill(HCBUFF hCircBuffer)
{
    /* Simply calculate buffer size and subtract value returned by cbuffGetSpace
    *
    */
    return ( (hCircBuffer->endOfBuffer - hCircBuffer->startOfBuffer + 
              sizeof(CBUFF)) - cbuffGetSpace(hCircBuffer) );
}

/*******************************************************************************
* cbuffClearBuffer()
*
* Summary: 
*   Resets in and out pointers in the requested buffer and marks the buffer as
*   empty. The data currently in the buffer is *not* deleted.
*
* See also:
* 
* Arguments: 
*   hCircBuffer       - handle to HCBUFF variable for this buffer instance
*
* Returns: 
*   - void
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
* 2. The associated buffer itself is not emptied. Any data in the buffer will
*    still be in memory after this function is called, although it won't be
*    accessible by this module anymore because the module thinks the buffer
*    is empty
*
*******************************************************************************/
void cbuffClearBuffer(HCBUFF                hCircBuffer)
{
                                        /* Reset buffer pointers              */
    hCircBuffer->inPointer  = hCircBuffer->startOfBuffer;
    hCircBuffer->outPointer = hCircBuffer->startOfBuffer;
                                        /* Clear all flags                    */
    hCircBuffer->localFlag  = 0x00;
                                        /* Set buffer empty flag              */
    hCircBuffer->localFlag |= CBUFF_EMPTY;
}

/*******************************************************************************
* cbuffGetByte()
*
* Summary: 
*   Removes and returns one CBUFF from chosen buffer
*
* See also:
*   cbuffGetArray(), cbuffPutByte(), cbuffPutArray()
*
* Arguments: 
*   hCircBuffer         - handle to HCBUFF variable for this buffer instance
*   data                - pointer to variable to store read byte
*
* Returns: 
*   - CBUFF_GET_OK      - operation completed successfully
*   - CBUFF_GET_FAIL    - operation failed due to buffer being empty
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
* 2. This function does not allow a buffer underflow
*******************************************************************************/
unsigned char cbuffGetByte(HCBUFF       hCircBuffer,
                           CBUFF      * data)
{
                                        /* Check we're don't already have an  */
                                        /* empty buffer.                      */
    if (hCircBuffer->localFlag & CBUFF_EMPTY)
    {
        return CBUFF_GET_FAIL;
    }
                                        /* Read requested byte                */
    *data = *hCircBuffer->outPointer;
    
                                        /* Increment outPointer first         */
    hCircBuffer->outPointer++;
    
                                        /* Implement wrap around              */
    if (hCircBuffer->outPointer > hCircBuffer->endOfBuffer)
    {
        hCircBuffer->outPointer = hCircBuffer->startOfBuffer;
    }
    
                                        /* Check we're not now pointing to    */
                                        /* the inPointer (buffer empty)       */
    if (hCircBuffer->outPointer == hCircBuffer->inPointer)
    {
                                        /* Note that the buffer is empty      */
        hCircBuffer->localFlag |= CBUFF_EMPTY;
    }
                                        /* Clear CBUFF_FULL flag as      */
                                        /* there is now at least one byte     */
                                        /* free                               */
    hCircBuffer->localFlag &= ~CBUFF_FULL;
              
    return CBUFF_GET_OK;
}

/*******************************************************************************
* cbuffPeekTail()
*
* Summary: 
*   Returns value of the next CBUFF that would be read from buffer without
*   removing it
*
* See also:
*   cbuffPeekHead()
*
* Arguments: 
*   hCircBuffer         - handle to HCBUFF variable for this buffer instance
*   data                - variable to return next data value that would be read 
*                       from buffer
* Returns: 
*   - CBUFF_GET_OK      - operation completed successfully
*   - CBUFF_GET_FAIL    - operation failed due to buffer being empty
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
*******************************************************************************/
unsigned char cbuffPeekTail(HCBUFF   hCircBuffer,
                           CBUFF  * data)
{
                                        /* Check buffer isn't empty           */
    if (!(hCircBuffer->localFlag & CBUFF_EMPTY))
    {   
                                        /* Return head value in data          */
        *data = *hCircBuffer->outPointer;
        return CBUFF_GET_OK;
    }
    else
    {
        return CBUFF_GET_FAIL;
    }
}

/*******************************************************************************
* cbuffPeekHead()
*
* Summary: 
*   Returns value of last CBUFF written into the circular buffer
*
* See also:
*   cbuffGetTail()
*
* Arguments: 
*   hCircBuffer         - handle to HCBUFF variable for this buffer instance
*   data                - variable to return read value
*
* Returns: 
*   - CBUFF_GET_OK      - operation completed successfully
*   - CBUFF_GET_FAIL    - operation failed due to buffer being empty
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
*******************************************************************************/
unsigned char cbuffPeekHead(HCBUFF   hCircBuffer,
                            CBUFF  * data)
{
                                        /* Check buffer isn't empty           */
    if (!(hCircBuffer->localFlag & CBUFF_EMPTY))
    {
                                        /* If inPointer doesn't point to      */
                                        /* startOfBuffer, return value at     */
                                        /* (inPointer - 1)                    */
        if (hCircBuffer->inPointer != hCircBuffer->startOfBuffer)
        {
            *data = *(hCircBuffer->inPointer - sizeof(CBUFF));
        }
                                        /* Otherwise handle buffer wrap       */
                                        /* situation                          */
        else
        {
            *data = *hCircBuffer->endOfBuffer;
        }   
        return CBUFF_GET_OK;
    }
    else
    {
        return CBUFF_GET_FAIL;
    }
}

/*******************************************************************************
* cbuffUnputByte()
*
* Summary: 
*   Removes the last CBUFF written into the buffer with cbuffPutByte(), 
*   cbuffPutArray()
*
* See also:
*   cbuffUngetByte()
*
* Arguments: 
*   hCircBuffer     - handle to HCBUFF variable for this buffer instance
*
* Returns: 
*   - 0 (zero) if successful
*   - non-zero if there was no data to put back
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
* 2. This function does not allow underflow of the buffer
* 3. If the last data byte has since been removed from the buffer, i.e. the
*    buffer is now empty, this function will fail in its attempt
* 4. The data itself is not removed; only the head pointer to the buffer is
*    moved back one position
*******************************************************************************/
unsigned char cbuffUnputByte(HCBUFF  hCircBuffer)
{   
                                        /* Check to see if we can unput at    */
                                        /* all. If buffer is empty, do        */
                                        /* nothing                            */
    if (hCircBuffer->localFlag & CBUFF_EMPTY)
    {
        return 1;
    }   
                                        /* unput the last byte - check first  */
                                        /* that pointer in not on start       */
                                        /* boundary                           */
    if (hCircBuffer->inPointer != hCircBuffer->startOfBuffer)
    {
        hCircBuffer->inPointer--;
    }    
                                        /* For boundary case implent wrap-    */
                                        /* around                             */
    else
    {
        hCircBuffer->inPointer = hCircBuffer->endOfBuffer;
    }    
                                        /* Check if buffer is now empty       */
    if (hCircBuffer->inPointer == hCircBuffer->outPointer)
    {
        hCircBuffer->localFlag |= CBUFF_EMPTY;
    }  
                                        /* Buffer is now officially not full  */
    hCircBuffer->localFlag &= ~CBUFF_FULL;
    
    return 0;
}

/*******************************************************************************
* cbuffUngetByte()
*
* Summary: 
*   Puts the last CBUFF read from the buffer (with cbuffGetByte() or
*   cbuffGetArray() ) back into the chosen buffer
*
* See also:
*   cbuffUnputByte()
*
* Arguments: 
*   hCircBuffer     - handle to HCBUFF variable for this buffer instance
*
* Returns: 
*   - 0 (zero) if successful 
*   - non-zero if there was no data to put back
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
* 2. this function only shifts the outPointer back; it doesn't write the data
*    that was read back into the circular buffer. It assumes the data that was
*    read out is still in the buffer. If the data has since been overwritten,
*    i.e. buffer is now full, the function will fail in its attempt
* 3. This function does not allow overflow of the buffer
*******************************************************************************/
unsigned char  cbuffUngetByte(HCBUFF  hCircBuffer)
{
                                        /* Check to see if we can unget at    */
                                        /* all. If buffer is full, do         */
                                        /* nothing                            */
    if (hCircBuffer->localFlag & CBUFF_FULL)
    {
        return 1;
    }
                                        /* Check to see if we can unget at    */
                                        /* all. If buffer is empty, do        */
                                        /* nothing                            */
    if (hCircBuffer->localFlag & CBUFF_EMPTY)
    {
        return 1;
    }  
                                        /* unget the last byte - check first  */
                                        /* that pointer in not on start       */
                                        /* boundary                           */
    if (hCircBuffer->outPointer != hCircBuffer->startOfBuffer)
    {
        hCircBuffer->outPointer--;
    }    
                                        /* For boundary case implent wrap-    */
                                        /* around                             */
    else
    {
        hCircBuffer->outPointer = hCircBuffer->endOfBuffer;
    }    
    
    return 0;
}

/*******************************************************************************
* cbuffPutArray()
*
* Summary: 
*   Copies as much content of a CBUFF array from the caller into the chosen 
*   buffer object as possible
*
* See also:
*   cbuffPutByte(), cbuffGetbyte(), cbuffGetArray()
*
* Arguments: 
*   hCircBuffer     - handle to HCBUFF variable for this buffer instance
*   data            - pointer to an array containing the data to be copied into
*                   the buffer
*   noOfBytes       - number of bytes that the caller wants to write into the 
*                   buffer
*
* Returns: 
*   number of bytes actually copied into the buffer (could be 0 if buffer was 
*   full)
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
* 2. This function will not allow the buffer to overflow
*******************************************************************************/
unsigned int  cbuffPutArray(HCBUFF               hCircBuffer,
                            const CBUFF        * data,
                            unsigned int         noOfBytes)
{
    unsigned int bytesWritten = 0;
                                        /* Check that there is somewhere to   */
                                        /* put data. If the CBUFF_FULL   */
                                        /* flag is set, there is no space     */
    if (hCircBuffer->localFlag & CBUFF_FULL)
    {
        return bytesWritten;
    }
    
    
    while (!(hCircBuffer->localFlag & CBUFF_FULL))
    {
                                        /* Put data in buffer                 */
        *hCircBuffer->inPointer = *data; 

        hCircBuffer->inPointer++;       /* Increment pointer to circular      */
                                        /* buffer                             */

        data++;                         /* Increment pointer to array data    */
    
                                        /* Implement circular buffer          */
                                        /* wrap-around                        */
        if (hCircBuffer->inPointer > hCircBuffer->endOfBuffer)
        {
            hCircBuffer->inPointer = hCircBuffer->startOfBuffer;
        }
                                        /* Check that the buffer is not now   */
                                        /* full                               */
                                        
        if (hCircBuffer->inPointer == hCircBuffer->outPointer)
        {
                                        /* Set CBUFF_FULL flag so that   */
                                        /* we don't attempt to write more     */
                                        /* data into the buffer until some-   */
                                        /* thing is read out                  */
            hCircBuffer->localFlag |= CBUFF_FULL;
        }
                                        /* Note how much data we've written   */
        bytesWritten++;
                                        /* Check to see if we've written all  */
                                        /* requested data                     */
        if (bytesWritten == noOfBytes)
        {
            break;
        }    
    }
                                        /* Note that the buffer is no longer  */
                                        /* empty                              */
    hCircBuffer->localFlag &= ~CBUFF_EMPTY;
    
    return bytesWritten;
}
  
/*******************************************************************************
* cbuffGetArray()
*
* Summary: 
*   Removes up to the requested number of CBUFFs from the chosen buffer object 
*   and writes it into the CBUFF array passed by the caller
*
* See also:
*   cbuffGetByte(), cbuffPutByte(), cbuffPutArray()
*
* Arguments: 
*   hCircBuffer     - handle to HCBUFF variable for this buffer instance
*   data            - pointer to an array into which the data is to be written
*   noOfBytes       - number of bytes that the caller wants to write into the 
*                   array
*
* Returns: 
*   - number of bytes actually copied into the buffer (could be 0 if buffer was 
*   full)
*
* Callers: 
*   User application
*
* Notes : 
* 1. openCircBuffer() must have been successfully called before using this
*    function
* 2. This function doesn't allow the buffer to underflow
* 3. User must ensure that *data points to space of free memory large enough 
*    to accomodate noOfBytes of data
*******************************************************************************/  
unsigned int  cbuffGetArray(HCBUFF               hCircBuffer,
                            CBUFF              * data,
                            unsigned int         noOfBytes)
{
    unsigned int bytesRead = 0;
                                        /* Check we're don't already have an  */
                                        /* empty buffer.                      */
    if (hCircBuffer->localFlag & CBUFF_EMPTY)
    {
        return bytesRead;
    }
    
    while(!(hCircBuffer->localFlag & CBUFF_EMPTY))
    {
                                        /* Read requested byte                */
        *data = *hCircBuffer->outPointer;
    
                                        /* Increment outPointer first         */
        hCircBuffer->outPointer++;
                                        /* Increment array data pointer       */
        data++;
    
                                        /* Implement wrap around              */
        if (hCircBuffer->outPointer > hCircBuffer->endOfBuffer)
        {
            hCircBuffer->outPointer = hCircBuffer->startOfBuffer;
        }
    
                                        /* Check we're not now pointing to    */
                                        /* the inPointer (buffer empty)       */
        if (hCircBuffer->outPointer == hCircBuffer->inPointer)
        {
                                        /* Note that the buffer is empty      */
            hCircBuffer->localFlag |= CBUFF_EMPTY;
        }
                                        /* Note how many bytes we've read     */
        bytesRead++;
        
                                        /* Stop function from reading too     */
                                        /* many bytes                         */
        if (bytesRead == noOfBytes)
        {
            break;
        }    
    }
                                        /* Clear CBUFF_FULL flag as      */
                                        /* there is now at least one byte     */
                                        /* free                               */
    hCircBuffer->localFlag &= ~CBUFF_FULL;
              
    return bytesRead;
}

    
/*******************************************************************************
*
*                           CIRCULAR BUFFER MODULE END
*
*******************************************************************************/
