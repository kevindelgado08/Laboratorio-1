;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"bingo.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_TRISIO
	extern	_GPIO
	extern	__gptrget1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_num_decimal
	global	_num_entero
	global	_delay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_bingo_0	udata
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDC_bingo_0	code
_num_entero
	retlw 0x00	; 0
	retlw 0x01	; 1
	retlw 0x02	; 2
	retlw 0x03	; 3
	retlw 0x04	; 4
	retlw 0x05	; 5
	retlw 0x06	; 6
	retlw 0x07	; 7
	retlw 0x10	; 16
	retlw 0x11	; 17

IDC_bingo_1	code
_num_decimal
	retlw 0x20	; 32
	retlw 0x21	; 33
	retlw 0x22	; 34
	retlw 0x23	; 35
	retlw 0x24	; 36
	retlw 0x25	; 37
	retlw 0x26	; 38
	retlw 0x27	; 39
	retlw 0x30	; 48	'0'
	retlw 0x31	; 49	'1'
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_bingo	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	56; "bingo.c"	TRISIO = 0b00000000; //Poner todos los pines como salidas
	BANKSEL	_TRISIO
	CLRF	_TRISIO
_00106_DS_:
;	.line	62; "bingo.c"	GPIO = num_entero[9];
	MOVLW	(_num_entero + 9)
	MOVWF	STK01
	MOVLW	high (_num_entero + 9)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	63; "bingo.c"	GPIO = num_decimal[2];
	MOVLW	(_num_decimal + 2)
	MOVWF	STK01
	MOVLW	high (_num_decimal + 2)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00106_DS_
;	.line	68; "bingo.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_bingo__delay	code
_delay:
; 2 exit points
;	.line	70; "bingo.c"	void delay(unsigned int tiempo)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	75; "bingo.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00117_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00138_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00138_DS_:
	BTFSC	STATUS,0
	GOTO	_00119_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
;	.line	76; "bingo.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00115_DS_:
	MOVLW	0xff
	BANKSEL	r0x1004
	ADDWF	r0x1004,W
	MOVWF	r0x1006
	MOVLW	0xff
	MOVWF	r0x1007
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	INCFSZ	r0x1005,W
	ADDWF	r0x1007,F
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1007,W
	MOVWF	r0x1005
	MOVF	r0x1007,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00115_DS_
;	.line	75; "bingo.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00117_DS_
_00119_DS_:
;	.line	77; "bingo.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	   56+   11 =    67 instructions (  156 byte)

	end
