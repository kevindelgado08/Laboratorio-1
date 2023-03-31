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
	extern	__modsint
	extern	__divsint
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__gptrget1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_num_display
	global	_num_unidad
	global	_num_decena
	global	_retener
	global	_numero
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
UD_bingo_0	udata
_numero	res	2

UD_bingo_1	udata
_retener	res	2

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_bingo_0	udata
r0x100B	res	1
r0x100A	res	1
r0x100D	res	1
r0x100C	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1013	res	1
r0x1012	res	1
r0x1003	res	1
r0x1002	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
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
;   _num_display
;   __mulint
;   __modsint
;   __modsint
;   _num_display
;9 compiler assigned registers:
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   STK02
;   STK01
;   STK00
;   r0x1012
;   r0x1013
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	67; "bingo.c"	TRISIO = 0b00001000; //Poner todos los pines como salidas
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	74; "bingo.c"	int x0 = 2;
	MOVLW	0x02
	BANKSEL	r0x100E
	MOVWF	r0x100E
	CLRF	r0x100F
;	.line	76; "bingo.c"	for (int i = 0; i < 16; i++) {
	CLRF	r0x1010
	CLRF	r0x1011
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
_00119_DS_:
	BANKSEL	r0x1011
	MOVF	r0x1011,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00144_DS_
	MOVLW	0x10
	SUBWF	r0x1010,W
_00144_DS_:
	BTFSC	STATUS,0
	GOTO	_00121_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
;	.line	77; "bingo.c"	x0 = (x0 * x0) % m; // Formula BBS -> Xi^2 mod m
	BANKSEL	r0x100E
	MOVF	r0x100E,W
	MOVWF	STK02
	MOVF	r0x100F,W
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100F,W
	PAGESEL	__mulint
	CALL	__mulint
	PAGESEL	$
	BANKSEL	r0x1012
	MOVWF	r0x1012
	MOVF	STK00,W
	MOVWF	r0x1013
	MOVLW	0xf3
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1013,W
	MOVWF	STK00
	MOVF	r0x1012,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x100F
	MOVWF	r0x100F
	MOVF	STK00,W
	MOVWF	r0x100E
;	.line	78; "bingo.c"	int numero_pseudoaleatorio = (x0 % 100);
	MOVLW	0x64
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100F,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	_numero
	MOVWF	(_numero + 1)
	MOVF	STK00,W
	MOVWF	_numero
;;signed compare: left < lit(0x64=100), size=2, mask=ffff
;	.line	82; "bingo.c"	if(numero<100) //si el numero pseudoaleatorio es menor que 100 (Por seguridad)
	MOVF	(_numero + 1),W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00145_DS_
	MOVLW	0x64
	SUBWF	_numero,W
_00145_DS_:
	BTFSC	STATUS,0
	GOTO	_00120_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
_00109_DS_:
;	.line	84; "bingo.c"	while (GP3 == 0){
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	GOTO	_00112_DS_
;	.line	85; "bingo.c"	num_display(); 
	PAGESEL	_num_display
	CALL	_num_display
	PAGESEL	$
	GOTO	_00109_DS_
_00112_DS_:
;	.line	88; "bingo.c"	while (GP3 == 1){
	BANKSEL	r0x1013
	CLRF	r0x1013
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00001_DS_
	BANKSEL	r0x1013
	INCF	r0x1013,F
_00001_DS_:
	BANKSEL	r0x1013
	MOVF	r0x1013,W
;	.line	76; "bingo.c"	for (int i = 0; i < 16; i++) {
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00112_DS_
_00120_DS_:
	BANKSEL	r0x1010
	INCF	r0x1010,F
	BTFSC	STATUS,2
	INCF	r0x1011,F
	GOTO	_00119_DS_
_00121_DS_:
;	.line	95; "bingo.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;; Starting pCode block
S_bingo__delay	code
_delay:
; 2 exit points
;	.line	97; "bingo.c"	void delay(unsigned int tiempo) //Se crea un tiempo de espera
	BANKSEL	r0x1002
	MOVWF	r0x1002
	MOVF	STK00,W
	MOVWF	r0x1003
;	.line	102; "bingo.c"	for( i=0; i <tiempo; i ++)
	CLRF	r0x1004
	CLRF	r0x1005
_00157_DS_:
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	SUBWF	r0x1005,W
	BTFSS	STATUS,2
	GOTO	_00178_DS_
	MOVF	r0x1003,W
	SUBWF	r0x1004,W
_00178_DS_:
	BTFSC	STATUS,0
	GOTO	_00159_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
;	.line	103; "bingo.c"	for( j =0; j <1000; j ++);
	MOVLW	0xe8
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVLW	0x03
	MOVWF	r0x1007
_00155_DS_:
	MOVLW	0xff
	BANKSEL	r0x1006
	ADDWF	r0x1006,W
	MOVWF	r0x1008
	MOVLW	0xff
	MOVWF	r0x1009
	MOVF	r0x1007,W
	BTFSC	STATUS,0
	INCFSZ	r0x1007,W
	ADDWF	r0x1009,F
	MOVF	r0x1008,W
	MOVWF	r0x1006
	MOVF	r0x1009,W
	MOVWF	r0x1007
	MOVF	r0x1009,W
	IORWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00155_DS_
;	.line	102; "bingo.c"	for( i=0; i <tiempo; i ++)
	INCF	r0x1004,F
	BTFSC	STATUS,2
	INCF	r0x1005,F
	GOTO	_00157_DS_
_00159_DS_:
;	.line	104; "bingo.c"	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divsint
;   __modsint
;   __gptrget1
;   _delay
;   __gptrget1
;   _delay
;   __divsint
;   __modsint
;   __gptrget1
;   _delay
;   __gptrget1
;   _delay
;7 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;; Starting pCode block
S_bingo__num_display	code
_num_display:
; 2 exit points
;	.line	53; "bingo.c"	dec=numero/10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	_numero
	MOVF	_numero,W
	MOVWF	STK00
	MOVF	(_numero + 1),W
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVF	STK00,W
	MOVWF	r0x100B
;	.line	54; "bingo.c"	unid=numero%10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	_numero
	MOVF	_numero,W
	MOVWF	STK00
	MOVF	(_numero + 1),W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	STK00,W
;	.line	57; "bingo.c"	GPIO=(num_unidad[unid]); 
	MOVWF	r0x100D
	ADDLW	(_num_unidad + 0)
	MOVWF	r0x100D
	MOVF	r0x100C,W
	BTFSC	STATUS,0
	INCFSZ	r0x100C,W
	ADDLW	high (_num_unidad + 0)
	MOVWF	r0x100C
	MOVF	r0x100D,W
	MOVWF	STK01
	MOVF	r0x100C,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	58; "bingo.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	59; "bingo.c"	GPIO=(num_decena[dec]);
	BANKSEL	r0x100B
	MOVF	r0x100B,W
	ADDLW	(_num_decena + 0)
	MOVWF	r0x100B
	MOVF	r0x100A,W
	BTFSC	STATUS,0
	INCFSZ	r0x100A,W
	ADDLW	high (_num_decena + 0)
	MOVWF	r0x100A
	MOVF	r0x100B,W
	MOVWF	STK01
	MOVF	r0x100A,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	60; "bingo.c"	delay(1);                     
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	62; "bingo.c"	}
	RETURN	
; exit point of _num_display


;	code size estimation:
;	  174+   44 =   218 instructions (  524 byte)

	end
