
	; HI-TECH C PRO for the PIC32 MCU Family V9.60PL1
	; Copyright (C) 1984-2009 HI-TECH Software
	;Serial no. HCPIC32-159077819

	; Auto-generated runtime startup code for final link stage.

	;
	; Compiler options:
	;
	; -ocircBufferTest.elf -mcircBufferTest.map --summary=default \
	; --interrupts= --output=default circBufferTest.p1 cbuff.p1 \
	; --chip=32MX360F512L -P --runtime=default --opt=default -D__DEBUG=1 -g \
	; --asmlist --errformat=Error   [%n] %f; %l.%c %s \
	; --msgformat=Advisory[%n] %s --warnformat=Warning [%n] %f; %l.%c %s
	;


	processor	32MX360F512L
	psect	init,class=KSEG0_BOOT,isa=mips32r2,reloc=4
	psect	powerup,class=KSEG1_BOOT,isa=mips32r2,reloc=4
	psect	text32,class=KSEG0_PFM,isa=mips32r2,reloc=4
	psect	text16,class=KSEG0_PFM,isa=mips16e,reloc=4
	psect	bss,class=KSEG0_DRM,reloc=4,isa=none
	psect	data,class=KSEG0_DRM,reloc=4,isa=none
	psect	idata,class=KSEG0_PFM,reloc=4,isa=none
	psect	strings,class=KSEG0_PFM,reloc=4,isa=none
	psect	const,class=KSEG0_PFM,reloc=4,isa=none
	psect	constfar,class=KSEG0_PFM,reloc=4,isa=none
	psect	config,class=KSEG1_CONFIG,reloc=4,isa=none
	psect	nvram,class=KSEG0_DRM,reloc=4,isa=none
	psect	nvbit,class=KSEG0_DRM,bit,reloc=4,isa=none
	psect	rbit,class=KSEG0_DRM,bit,reloc=4,isa=none
	psect	bootex,class=KSEG1_BOOT,isa=mips32r2,reloc=4
	psect	reset,class=KSEG1_BOOT,isa=mips32r2,reloc=4

; Default config settings for word 2
;
; PLL output divided by 1
; 20x initial PLL multiplier
; PLL input divided by 2
	psect config
	org 4
	dw 0xFFF8FFD9

; Default config settings for word 1
;
; WDT disabled
; WDT postscale 1:1
; Clock switching enabled, fail-safe clock monitor enabled
; PBCLK is SYSCLK divided by 1
; CLKO output disabled
; Primary oscillator HS mode
; Internal external switch over mode enabled
; Secondary oscillator enabled
; Fast RC oscillator with divide-by-N with PLL module
	psect config
	org 8
	dw 0xFF600EF9

; Default config settings for word 0
;
; Code protection disabled
; Boot flash write-protect disabled
; Program write protection disabled
; ICE/ICD comm communication channel uses PGC2/PGD2 pins
; Background ICE debugger enabled
	psect config
	org 12
	dw 0xFFFFFFFE

	psect	vectors,class=KSEG0_BOOT,reloc=0x1000,isa=mips32r2
	global	startup,_main,_main_isa,___nmi_handler
	global	__Lconst,__Hconst,__Lvectors

	psect reset
; reset vector
	li at, startup
	jr at
	nop

	psect	init
startup:
opt asmopt_off
	di
	mfc0	t0, $12	;status register
	ext	at, t0, 19, 1	;status<NMI>
; jump to NMI handler if at != $0
	beq at, zero, ___skip_nmi
	nop
	li at, ___nmi_handler
	jalr at
	nop
	___skip_nmi:
; init heap and stack
	psect	heapstack,class=KSEG0_DRM,reloc=4,isa=none
	global __Lheapstack, __Hheapstack
	global __Lstack, __Hstack
	global __Lheap, __Hheap
	__Lstack equ __Lheapstack
	__Hstack equ __Hheapstack
	__Lheap equ __Lheapstack
	__Hheap equ __Hheapstack
	align 4
	ds	32548
	psect init
	global	__Hstack
	li	sp,	__Hstack
; clear bss psect
global __Lbss
	li	at, __Lbss
	li	t0, __Lbss/1 + 220
_bss_clear_loop:
	sw	$0, 0(at)
	addiu	at, 4
	bne	at, t0, _bss_clear_loop
	nop
; no rbit to clear
; no data to initialise
; init gp with base of sfr 
	lui gp, 0xBF88
	psect init
;
; initialise CP0 registers
;
; clear Count register
	mtc0	zero, $9
	;set Compare register
	addiu	at, zero, -1
	mtc0	at, $11
; clear all Status bits but SR, NMI
	li	at, 0x180000
	mfc0	t0, $12
	and	at, at, t0
	mtc0	at, $12
; initialise Cause register DC=0, IV=1, IP1=0, IP0=0
	li	at, (1<<23)
	mtc0	at, $13
;
; Configure the device for optimal performance
;
; Setup Cache Control Register
; 	 Enable predictive prefetch cache on all regions
; 	 2 PFM wait states
	li a0, 0x30
	li a1, 0x5
	sw a0, 0x4008(gp)
	sw a1, 0x4004(gp)
; Disable DRM Wait States
	li a0, 1<<6
	sw a0, 0x2004(gp)
; enable instruction cacheing
	mfc0 at, $16, 0 ; // Config
	ori at, at, 0x3
	mtc0 at, $16, 0
	ehb
; init global pointer to middle of KSEG0_DRM
	global __gptr
	__gptr equ 0x80004000
	li	gp, __gptr
	wrpgpr gp, gp
;
; Invoke main
;
	li at, _main+_main_isa
	jalr	at
	nop
__done:
	b	__done
	nop
opt asmopt_on
	end	startup
