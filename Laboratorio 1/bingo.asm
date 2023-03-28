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
	extern	__divsint
	extern	__modsint
	extern	_TRISIO
	extern	_GPIO
	extern	__gptrget1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_decena
	global	_unidad
	global	_num_unidad
	global	_num_decena
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
r0x1009	res	1
r0x1008	res	1
r0x100B	res	1
r0x100A	res	1
r0x100D	res	1
r0x100C	res	1
r0x100E	res	1
r0x100F	res	1
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
_num_decena
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
_num_unidad
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
;   _decena
;   _unidad
;   __gptrget1
;   __gptrget1
;   _decena
;   _unidad
;   __gptrget1
;   __gptrget1
;8 compiler assigned registers:
;   STK00
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   STK01
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	65; "bingo.c"	TRISIO = 0b00000000; //Poner todos los pines como salidas
	BANKSEL	_TRISIO
	CLRF	_TRISIO
;	.line	70; "bingo.c"	int x = decena(55);
	MOVLW	0x37
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_decena
	CALL	_decena
	PAGESEL	$
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVF	STK00,W
	MOVWF	r0x100B
;	.line	71; "bingo.c"	int y = unidad(55);
	MOVLW	0x37
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_unidad
	CALL	_unidad
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	STK00,W
	MOVWF	r0x100D
_00114_DS_:
;	.line	74; "bingo.c"	GPIO = num_decena[x];
	BANKSEL	r0x100B
	MOVF	r0x100B,W
	ADDLW	(_num_decena + 0)
	MOVWF	r0x100E
	MOVLW	high (_num_decena + 0)
	MOVWF	r0x100F
	MOVF	r0x100A,W
	BTFSC	STATUS,0
	INCFSZ	r0x100A,W
	ADDWF	r0x100F,F
	MOVF	r0x100E,W
	MOVWF	STK01
	MOVF	r0x100F,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	75; "bingo.c"	GPIO = num_unidad[y];
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	ADDLW	(_num_unidad + 0)
	MOVWF	r0x100E
	MOVLW	high (_num_unidad + 0)
	MOVWF	r0x100F
	MOVF	r0x100C,W
	BTFSC	STATUS,0
	INCFSZ	r0x100C,W
	ADDWF	r0x100F,F
	MOVF	r0x100E,W
	MOVWF	STK01
	MOVF	r0x100F,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00114_DS_
;	.line	79; "bingo.c"	}
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
;	.line	81; "bingo.c"	void delay(unsigned int tiempo)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	86; "bingo.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00125_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00146_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00146_DS_:
	BTFSC	STATUS,0
	GOTO	_00127_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
;	.line	87; "bingo.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00123_DS_:
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
	GOTO	_00123_DS_
;	.line	86; "bingo.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00125_DS_
_00127_DS_:
;	.line	88; "bingo.c"	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divsint
;   __divsint
;5 compiler assigned registers:
;   r0x1008
;   STK00
;   r0x1009
;   STK02
;   STK01
;; Starting pCode block
S_bingo__decena	code
_decena:
; 2 exit points
;	.line	56; "bingo.c"	int decena(int numero){
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVF	STK00,W
	MOVWF	r0x1009
;	.line	57; "bingo.c"	int decenas= numero/10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVF	r0x1008,W
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVF	STK00,W
;	.line	58; "bingo.c"	return decenas;
	MOVWF	r0x1009
	MOVWF	STK00
	MOVF	r0x1008,W
;	.line	59; "bingo.c"	}
	RETURN	
; exit point of _decena

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __modsint
;   __modsint
;5 compiler assigned registers:
;   r0x1008
;   STK00
;   r0x1009
;   STK02
;   STK01
;; Starting pCode block
S_bingo__unidad	code
_unidad:
; 2 exit points
;	.line	51; "bingo.c"	int unidad(int numero){
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVF	STK00,W
	MOVWF	r0x1009
;	.line	52; "bingo.c"	int unidades = numero%10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVF	r0x1008,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVF	STK00,W
;	.line	53; "bingo.c"	return unidades;
	MOVWF	r0x1009
	MOVWF	STK00
	MOVF	r0x1008,W
;	.line	54; "bingo.c"	}
	RETURN	
; exit point of _unidad


;	code size estimation:
;	  122+   27 =   149 instructions (  352 byte)

	end
