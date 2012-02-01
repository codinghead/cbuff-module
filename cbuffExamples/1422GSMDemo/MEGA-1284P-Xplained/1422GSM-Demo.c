/*******************************************************************************
*
* CIRCULAR BUFFER DEMO PROGRAM for MEGA-1284P XPLAINED Board from Atmel
*
*******************************************************************************/

/*******************************************************************************
*
* Demos the the circular buffer module's functionality on an ATmega1284P
* with the MEGA-1284P Xplained board using the 11.0952MHz crystal. Oscillator
* is "Low Power Crystal Oscillator" in the "8.0 - 16.0 MHz" frequency range 
* setting. Internal clock frequency is therefore also 11.0952MHz.
*
* Filename : 1422GSM-Demo.c
* Version : V0.01
* Programmer(s) : Stuart Cording aka CODINGHEAD 
* 
********************************************************************************
* Note(s) : 
* 01 Feb 2012  - v0.1 - First cut
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
#include <avr/io.h>
#include <avr/interrupt.h>
#include "..\..\..\cbuff_module\cbuff.h"
#include "terminal_output.h"

/*******************************************************************************
*                                   FUSE BITS
*******************************************************************************/
#include "fuseSetUp.h"

/*******************************************************************************
*                                 LOCAL DEFINES
*******************************************************************************/
#define TESTBUFFERSIZE      50
#define UARTOUTBUFFERSIZE   250

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
void initUart1(void);
void triggerUART1(HCBUFF hCbuff);
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
//    volatile unsigned int x = 0;
                                        /* Initialise all used hardware and   */
                                        /* related interrupts                 */
    initLEDs();
    initUart1();
    initTimer1();
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
    startTimer1();                                       
                                        /* Output statistics                  */
    while(1)
    {
        triggerUART1(hUartOutBuffer);
        
        updateStats(hTestBuffer);

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
        
		termOutput(hUartOutBuffer);
#if 0
        if (x >= 0x0FFF)
        {
            //termOutput(hUartOutBuffer);
            x = 0;
        }
        else
        {
            x++;
        }    
#endif
    }    
}

/*******************************************************************************
* initLEDs()
*
* Description: 
*   Initialises PORTB bits 0, 1 and 2 as outputs to allow control of the 
* on board LEDs
*
* See also:
*
* Arguments: 
*   None
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
void initLEDs(void)
{
    DDRB = 0x07;
    PORTB = 0x00;
}

/*******************************************************************************
* initUart1()
*
* Description: 
*   Initialises USART1 for 57.6k baud for use with the on-board USB-CDC 
* converter implemented in the UC3 "Board Controller"
*
* See also:
*
* Arguments: 
*   None
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
void initUart1(void)
{
                                    /* Make sure I/O clock to USART1 is enabled */
	PRR0 &= ~(1 << PRUSART1);
	
	/* Set baud rate to 57.6k for 11.0592MHz crystal */
	UBRR1H = 0;
	UBRR1L = 11;
	
	/* Set up functionality */	
	UCSR1A = 0x00;          /* Standard values */
	UCSR1B = 0x00;          /* Keep all interrupts and TX/RX off */
	                        /* Async mode, parity off, 1 stop-bit, 8-bit */
	UCSR1C = (1 << UCSZ11) | (1 << UCSZ10) | (0 << UCPOL1);
}

/*******************************************************************************
* triggerUART1()
*
* Description: 
*   Checks if there is data in the selected cbuff and if the UART1TX buffer is
* empty. If both cases are true, one byte of data is then written into the 
* UDR1 register. The resulting interrupt as a result of this single transfer
* will trigger a further transfer of data from the cbuff into the UDR1 in the 
* ISR(USART1_RX_vect) interrupt routine.
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
void triggerUART1(HCBUFF hCbuff)
{
                                        /* Local storage for data read from   */
                                        /* cbuff                              */
    CBUFF data;
                                        /* Check if U1 TX is totally empty     */
    if((UCSR1A & (1 << UDRE1)))
    {
                                        /* Check if there is any data to send */
        if(cbuffGetFill(hCbuff) > 0)
        {
                                        /* Remove one byte and transmit       */
            if(cbuffGetByte(hCbuff, &data) == CBUFF_GET_OK)
            {
                UDR1 = (unsigned char) data;
                PORTB ^= 0x01;
            }    
        }    
    }    
}    

/*******************************************************************************
* initTimer1()
*
* Description: 
*   Initialises Timer 1 which will function as the producer, stuffing data into
* the buffer at the rate set via the terminal window.
*
* See also:
*
* Arguments: 
*   None
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
void initTimer1(void)
{
	                                    /* Normal Port operation, normal operation */
    TCCR1A = 0x00;
	                                    /* CTC Mode */
    TCCR1B = 0x08;
	                                    /* Not used */
	TCCR1C = 0x00;
                                        /* Set period to ~1Hz (count of       */
                                        /* 10800/0x2A30)                      */
    OCR1A = 10800;
}

/*******************************************************************************
* startTimer1()
*
* Description: 
*   Starts the Timer 1 module.
*
* See also:
*
* Arguments: 
*   None
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
void startTimer1(void)
{   
	TCNT1 = 0;
	                                    /* 11.0592MHz / 124 Prescaler = 10.8kHz */
    TCCR1B |= 0x05;
}

/*******************************************************************************
* stopTimer1()
*
* Description: 
*   Stops the Timer 1 clock. Timer stops counting.
*
* See also:
*
* Arguments: 
*   None
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
void stopTimer1(void)
{
    TCCR1B &= ~0x05;
}  

/*******************************************************************************
* setTimer1IntRate()
*
* Description: 
*   Modifies the frequency of interrupts generated by Timer 1 based upon the 
* users's input via the terminal interface.
*
* See also:
*
* Arguments: 
*   None
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
void setTimer1IntRate(void)
{
    stopTimer1();
                                            /* T2 clock speed is 10800Hz          */        
    OCR1A = (10800 / termGetFillRate());
    startTimer1();
}    

/*******************************************************************************
* initInterrupts()
*
* Description: 
*   Initialises the interrupts for USART1 and Timer 1 then enables global
* interrupts.
*
* See also:
*
* Arguments: 
*   None
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
void initInterrupts(void)
{
                                        /* T1 OCA Match Interrupt                 */
    TIMSK1 = (1 << OCIE1A);
                                        /* Enable Rx interrupt, Tx Buff Empty interrupt */
	/* Enable RX'er and TX'er */
	UCSR1B |= (1 << RXCIE1) | (1 << RXEN1) | (1 << TXEN1);
	
	/* Enable global interrupts */
	sei();	
}

/*******************************************************************************
* updateStats()
*
* Description: 
*   Updates the statistics for display in the terminal.
*
* See also:
*
* Arguments: 
*   None
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
void updateStats(HCBUFF hCbuff)
{
    termUpdateBytesInBuffer(cbuffGetFill(hCbuff));
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
    
    PORTB = 0x05;
    while(1)
    {
        count++;
        if (count == 0xFFFF)
        {
            PORTB = !(PORTB | 0x0F);
        }    
    }    
}

/*******************************************************************************
* USART1_RX_vect()
*
* Description: 
*   Parses the incoming data from the terminal and modifies the application
* functionality as requested.
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
*   Hardware
*
* Notes : 
*   This interrupt does not leave the global interrupt enable bit on because 
* the hardware register UDR1 is shared with the USART1 TX vector interrupt
*******************************************************************************/
ISR(USART1_RX_vect)
{
    uint8_t rxData;
    unsigned int fillRate;
    
    PORTB ^= 0x01;
    
    rxData = UDR1;
    
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
        setTimer1IntRate();
    }
    else if (rxData == '-' || rxData == '.') /* ',' for keypad - */
    {
        fillRate = termGetFillRate() - 1;
        if (fillRate == 0)
        {
            fillRate = 1;
        }
        termSetFillRate(fillRate);
        setTimer1IntRate();
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
	
	PORTB ^= 0x01;
}    

/*******************************************************************************
* USART1_TX_vect()
*
* Description: 
*   Outputs the next byte of data for the terminal output.
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
*   Hardware
*
* Notes : 
*   This interrupt leaves the global interrupt enable bit on!
*******************************************************************************/
ISR(USART1_TX_vect, ISR_NOBLOCK)
{
	PORTB ^= 0x04;
	
    CBUFF txData;
    
    if (cbuffGetByte(hUartOutBuffer, &txData) == CBUFF_GET_OK)
    {
        UDR1 = (uint8_t) txData;
    }       
	PORTB ^= 0x04;
}  

/*******************************************************************************
* TIMER1_COMPA_vect()
*
* Description: 
*   Inserts next byte of test data into the test buffer.
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
*   Hardware
*
* Notes : 
*   This interrupt does not leave the global interrupt enable bit on because 
* Timer 1 has the highest priority of all enabled interrupts.
*******************************************************************************/
ISR(TIMER1_COMPA_vect)
{
    static unsigned char testData = 'A';
    
    PORTB ^= 0x02;
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
	
	PORTB ^= 0x02;
}  


/*******************************************************************************
*
*                       CIRCULAR BUFFER TEST PROGRAM END
*
*******************************************************************************/
