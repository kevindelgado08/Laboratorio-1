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
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__mulint
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
r0x1021	res	1
r0x1020	res	1
r0x1022	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
r0x1027	res	1
r0x1029	res	1
r0x1028	res	1
r0x102A	res	1
r0x102B	res	1
_main_numeros_65537_7	res	32
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
;   __mulint
;   __modsint
;   __modsint
;   _decena
;   _unidad
;   __gptrget1
;   __gptrget1
;   __mulint
;   __modsint
;   __modsint
;   _decena
;   _unidad
;   __gptrget1
;   __gptrget1
;13 compiler assigned registers:
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   STK02
;   STK01
;   STK00
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	45; "bingo.c"	TRISIO = 0b00000000; //Poner todos los pines como salidas
	BANKSEL	_TRISIO
	CLRF	_TRISIO
;	.line	51; "bingo.c"	int x0 = 317;
	MOVLW	0x3d
	BANKSEL	r0x1022
	MOVWF	r0x1022
	MOVLW	0x01
	MOVWF	r0x1023
;	.line	53; "bingo.c"	for (int i = 0; i < 16; i++) {
	CLRF	r0x1024
	CLRF	r0x1025
	CLRF	r0x1026
	CLRF	r0x1027
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
_00118_DS_:
	BANKSEL	r0x1025
	MOVF	r0x1025,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00135_DS_
	MOVLW	0x10
	SUBWF	r0x1024,W
_00135_DS_:
	BTFSC	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
;	.line	54; "bingo.c"	x0 = (x0 * x0) % m;
	BANKSEL	r0x1022
	MOVF	r0x1022,W
	MOVWF	STK02
	MOVF	r0x1023,W
	MOVWF	STK01
	MOVF	r0x1022,W
	MOVWF	STK00
	MOVF	r0x1023,W
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x1028
	MOVWF	r0x1028
	MOVF	STK00,W
	MOVWF	r0x1029
	MOVLW	0x12
	MOVWF	STK02
	MOVLW	0x70
	MOVWF	STK01
	MOVF	r0x1029,W
	MOVWF	STK00
	MOVF	r0x1028,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVF	STK00,W
	MOVWF	r0x1022
;	.line	55; "bingo.c"	int numero_pseudoaleatorio = (x0 % 100);
	MOVLW	0x64
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1022,W
	MOVWF	STK00
	MOVF	r0x1023,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1028
	MOVWF	r0x1028
	MOVF	STK00,W
	MOVWF	r0x1029
;	.line	56; "bingo.c"	numeros[i] = numero_pseudoaleatorio;
	MOVF	r0x1026,W
	ADDLW	(_main_numeros_65537_7 + 0)
	MOVWF	r0x102A
	MOVLW	high (_main_numeros_65537_7 + 0)
	MOVWF	r0x102B
	MOVF	r0x1027,W
	BTFSC	STATUS,0
	INCFSZ	r0x1027,W
	ADDWF	r0x102B,F
	MOVF	r0x102A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102B
	BTFSC	r0x102B,0
	BSF	STATUS,7
	MOVF	r0x1029,W
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	BANKSEL	r0x1028
	MOVF	r0x1028,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	53; "bingo.c"	for (int i = 0; i < 16; i++) {
	MOVLW	0x02
	BANKSEL	r0x1026
	ADDWF	r0x1026,F
	BTFSC	STATUS,0
	INCF	r0x1027,F
	INCF	r0x1024,F
	BTFSC	STATUS,2
	INCF	r0x1025,F
	GOTO	_00118_DS_
_00113_DS_:
;	.line	59; "bingo.c"	int dec = decena(numeros[0]);
	BANKSEL	_main_numeros_65537_7
	MOVF	(_main_numeros_65537_7 + 0),W
	BANKSEL	r0x1022
	MOVWF	r0x1022
	BANKSEL	_main_numeros_65537_7
	MOVF	(_main_numeros_65537_7 + 1),W
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVF	r0x1022,W
	MOVWF	STK00
	MOVF	r0x1023,W
	PAGESEL	_decena
	CALL	_decena
	PAGESEL	$
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVF	STK00,W
	MOVWF	r0x1022
;	.line	60; "bingo.c"	int unid = unidad(numeros[0]);
	BANKSEL	_main_numeros_65537_7
	MOVF	(_main_numeros_65537_7 + 0),W
	BANKSEL	r0x1024
	MOVWF	r0x1024
	BANKSEL	_main_numeros_65537_7
	MOVF	(_main_numeros_65537_7 + 1),W
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVF	r0x1024,W
	MOVWF	STK00
	MOVF	r0x1025,W
	PAGESEL	_unidad
	CALL	_unidad
	PAGESEL	$
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVF	STK00,W
	MOVWF	r0x1024
_00115_DS_:
;	.line	64; "bingo.c"	GPIO = num_decena[dec];
	BANKSEL	r0x1022
	MOVF	r0x1022,W
	ADDLW	(_num_decena + 0)
	MOVWF	r0x1026
	MOVLW	high (_num_decena + 0)
	MOVWF	r0x1027
	MOVF	r0x1023,W
	BTFSC	STATUS,0
	INCFSZ	r0x1023,W
	ADDWF	r0x1027,F
	MOVF	r0x1026,W
	MOVWF	STK01
	MOVF	r0x1027,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	65; "bingo.c"	GPIO = num_unidad[unid];
	BANKSEL	r0x1024
	MOVF	r0x1024,W
	ADDLW	(_num_unidad + 0)
	MOVWF	r0x1026
	MOVLW	high (_num_unidad + 0)
	MOVWF	r0x1027
	MOVF	r0x1025,W
	BTFSC	STATUS,0
	INCFSZ	r0x1025,W
	ADDWF	r0x1027,F
	MOVF	r0x1026,W
	MOVWF	STK01
	MOVF	r0x1027,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00115_DS_
;	.line	70; "bingo.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divsint
;   __divsint
;5 compiler assigned registers:
;   r0x1020
;   STK00
;   r0x1021
;   STK02
;   STK01
;; Starting pCode block
S_bingo__decena	code
_decena:
; 2 exit points
;	.line	37; "bingo.c"	int decena(int numero){
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVF	STK00,W
	MOVWF	r0x1021
;	.line	38; "bingo.c"	int decenas= numero/10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1021,W
	MOVWF	STK00
	MOVF	r0x1020,W
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVF	STK00,W
;	.line	39; "bingo.c"	return decenas;
	MOVWF	r0x1021
	MOVWF	STK00
	MOVF	r0x1020,W
;	.line	40; "bingo.c"	}
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
;   r0x1020
;   STK00
;   r0x1021
;   STK02
;   STK01
;; Starting pCode block
S_bingo__unidad	code
_unidad:
; 2 exit points
;	.line	32; "bingo.c"	int unidad(int numero){
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVF	STK00,W
	MOVWF	r0x1021
;	.line	33; "bingo.c"	int unidades = numero%10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1021,W
	MOVWF	STK00
	MOVF	r0x1020,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVF	STK00,W
;	.line	34; "bingo.c"	return unidades;
	MOVWF	r0x1021
	MOVWF	STK00
	MOVF	r0x1020,W
;	.line	35; "bingo.c"	}
	RETURN	
; exit point of _unidad


;	code size estimation:
;	  168+   49 =   217 instructions (  532 byte)

	end
