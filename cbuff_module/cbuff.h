/*******************************************************************************
*
* CIRCULAR BUFFER MODULE
*
*******************************************************************************/

/*******************************************************************************
*
* Provides a universal 'unsigned char' circular buffer. All contents within this
* file are 'public' and to be used by end user
*
* Filename : cbuff.h
* Version : V0.03
* Programmer(s) : Suart Cording aka CODINGHEAD 
* 
********************************************************************************
* Note(s) : 
* See the cbuff.c file for the version changes and notes for this module
*
*******************************************************************************/

/*******************************************************************************
*
*                            CIRCULAR BUFFER MODULE
*
*******************************************************************************/

#ifndef CBUFF_MODULE_PRESENT__
#define CBUFF_MODULE_PRESENT__

/*******************************************************************************
*                                 INCLUDE FILES
*******************************************************************************/


/*******************************************************************************
*                                    EXTERNS
*******************************************************************************/


/*******************************************************************************
*                             DEFAULT CONFIGURATION
*******************************************************************************/


/*******************************************************************************
*                                    DEFINES
*******************************************************************************/

/*******************************************************************************
* Summary:
*   Signals that cbuffGetByte(), cbuffPeekTail(), and cbuffPeekHead() functions
*   read a byte
*******************************************************************************/
#define CBUFF_GET_OK               0x01

/*******************************************************************************
* Summary:
*   Signals that cbuffGetByte(), cbuffPeekTail(), and cbuffPeekHead() functions
*   failed to read a byte
*******************************************************************************/
#define CBUFF_GET_FAIL             0x00

/*******************************************************************************
* Summary:
*   Signals that cbuffPutByte() function wrote a byte
*******************************************************************************/
#define CBUFF_PUT_OK               0x01

/*******************************************************************************
* Summary:
*   Signals that cbuffPutByte() function failed to write a byte - signals that
*   chosen buffer is full
*******************************************************************************/
#define CBUFF_PUT_FAIL             0x00

/*******************************************************************************
* Summary:
*   Signals that cbuffDestroy() failed to deallocate requested buffer object
*******************************************************************************/
#define CBUFF_DESTROY_FAIL         0x00

/*******************************************************************************
* Summary:
*   Signals that cbuffDestroy() successfully deallocated requested object
*******************************************************************************/
#define CBUFF_DESTROY_OK           0x01


/*******************************************************************************
*                                   DATA TYPES
*******************************************************************************/

/*******************************************************************************
* New data type CBUFF                                                     
* Description:
*   Data type for arrays created to be used as circular buffers with this
*   module
*******************************************************************************/
typedef unsigned char CBUFF;

/*******************************************************************************
* New data type CBUFFNUM                                                     
* Description:
*   Used to hold the buffer number that the buffer was assigned by allocation
*   (cbuffCreate) and to define which buffer should be used when acquiring a 
*   handle (cbuffOpen)
*******************************************************************************/
typedef unsigned char CBUFFNUM;

/*******************************************************************************
* New data type CBUFFOBJ
* Description:
*   Used as an object to hold the context of each defined buffer 
* Structure elements:                                                    
*   startOfBuffer               - pointer to buffer start address (user
*                               assigned)         
*   endOfBuffer                 - pointer to buffer end address + 1 (user
*                               assigned)               
*   inPointer                   - pointer to write-in point into buffer 
*                               (user assigned)           
*   outPointer                  - pointer to read-out point from buffer 
*                               (user assigned)         
*   bufferNumber                - number assigned to this buffer (module
*                               assigned)
*   localFlag                   - context for this buffer to note if buffer
*                               is full or empty (module assigned)
*   nextCircBufferObj           - Pointer to next buffer in the linked-list 
*                               (module assigned)   
*******************************************************************************/
typedef struct CBUFFTYPE {
    CBUFF            	* startOfBuffer;
    CBUFF            	* endOfBuffer;
    CBUFF            	* inPointer;
    CBUFF            	* outPointer;
    CBUFFNUM         	  bufferNumber;
    unsigned char         localFlag;
    struct CBUFFTYPE    * nextCircBufferObj;
} CBUFFOBJ;

/*******************************************************************************
* New data type HCBUFF                                                     
* Description:
*   Handle to a circular buffer object which has been opened with cbuffOpen
*******************************************************************************/
typedef CBUFFOBJ * HCBUFF;


/*******************************************************************************
*                                GLOBAL VARIABLES
*******************************************************************************/


/*******************************************************************************
*                                    MACROS
*******************************************************************************/


/*******************************************************************************
*#X#                      FUNCTION PROTOTYPES
*******************************************************************************/

void          cbuffInit(void);

void          cbuffDeinit(void);

CBUFFNUM      cbuffCreate(CBUFF           * buffer,
                          unsigned int      sizeOfBuffer,
                          CBUFFOBJ        * newCircBufferObj);
                              
unsigned char cbuffDestroy(CBUFFNUM         bufferNumber);      

HCBUFF        cbuffOpen(CBUFFNUM            bufferNumber);

CBUFFNUM      cbuffClose(HCBUFF             hCircBuffer);                                       
                                                 
unsigned char cbuffPutByte(HCBUFF           hCircBuffer,
                           CBUFF            data);
             
unsigned int  cbuffPutArray(HCBUFF          hCircBuffer,
                            const CBUFF   * data,
                            unsigned int    noOfBytes);

unsigned char cbuffGetByte(HCBUFF           hCircBuffer,
                           CBUFF          * data);
                          
unsigned int  cbuffGetArray(HCBUFF          hCircBuffer,
                            CBUFF         * data,
                            unsigned int    noOfBytes);
                      
unsigned char cbuffPeekHead(HCBUFF          hCircBuffer,
                            CBUFF         * data);

unsigned char cbuffPeekTail(HCBUFF          hCircBuffer,
                            CBUFF         * data);

unsigned char cbuffUngetByte(HCBUFF         hCircBuffer);

unsigned char cbuffUnputByte(HCBUFF         hCircBuffer);

void          cbuffClearBuffer(HCBUFF       hCircBuffer);

unsigned int  cbuffGetSpace(HCBUFF          hCircBuffer);

unsigned int  cbuffGetFill(HCBUFF           hCircBuffer);


/*******************************************************************************
*                              CONFIGURATION ERRORS
*******************************************************************************/


/*******************************************************************************
*
*                           CIRCULAR BUFFER MODULE END
*
*******************************************************************************/
#endif
