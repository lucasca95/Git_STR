opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F84A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_configPORTs
	FNCALL	_main,_toggleLeds
	FNROOT	_main
	global	_RA0
psect	text137,local,class=CODE,delta=2
global __ptext137
__ptext137:
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	file	"C:\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej1\P2Ej1.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_configPORTs
??_configPORTs:	; 0 bytes @ 0x0
	global	??_toggleLeds
??_toggleLeds:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_configPORTs
?_configPORTs:	; 0 bytes @ 0x0
	global	?_toggleLeds
?_toggleLeds:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      3       3

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0       0
;;                                              0 BANK0      3     3      0
;;                        _configPORTs
;;                         _toggleLeds
;; ---------------------------------------------------------------------------------
;; (1) _toggleLeds                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _configPORTs                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _configPORTs
;;   _toggleLeds
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            0      0       0       0        0.0%
;;EEDATA              40      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               42      3       3       3        4.5%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 12 in file "..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej1\P2Ej1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       3
;;      Totals:         0       3
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_configPORTs
;;		_toggleLeds
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej1\P2Ej1.c"
	line	12
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l1346:	
	fcall	_configPORTs
	line	15
	
l1348:	
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u2187:
	decfsz	((??_main+0)+0),f
	goto	u2187
	decfsz	((??_main+0)+0+1),f
	goto	u2187
	clrwdt
opt asmopt_on

	line	16
	
l1350:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	line	17
	
l1352:	
	bsf	(53/8),(53)&7
	line	20
	
l1354:	
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	136
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2197:
	decfsz	((??_main+0)+0),f
	goto	u2197
	decfsz	((??_main+0)+0+1),f
	goto	u2197
	decfsz	((??_main+0)+0+2),f
	goto	u2197
opt asmopt_on

	line	22
	goto	l173
	
l174:	
	line	25
	
l173:	
	line	22
	bcf	status, 5	;RP0=0, select bank0
	btfss	(40/8),(40)&7
	goto	u2161
	goto	u2160
u2161:
	goto	l1358
u2160:
	
l1356:	
	btfsc	(41/8),(41)&7
	goto	u2171
	goto	u2170
u2171:
	goto	l173
u2170:
	goto	l1358
	
l176:	
	goto	l1358
	
l177:	
	goto	l1358
	line	28
	
l178:	
	line	30
	
l1358:	
	fcall	_toggleLeds
	line	31
	
l1360:	
	opt asmopt_off
movlw	82
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	41
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
	nop2
opt asmopt_on

	goto	l1358
	line	32
	
l179:	
	line	28
	goto	l1358
	
l180:	
	line	33
	
l181:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_toggleLeds
psect	text138,local,class=CODE,delta=2
global __ptext138
__ptext138:

;; *************** function _toggleLeds *****************
;; Defined at:
;;		line 35 in file "..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej1\P2Ej1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text138
	file	"..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej1\P2Ej1.c"
	line	35
	global	__size_of_toggleLeds
	__size_of_toggleLeds	equ	__end_of_toggleLeds-_toggleLeds
	
_toggleLeds:	
	opt	stack 7
; Regs used in _toggleLeds: [wreg]
	line	36
	
l1344:	
	movlw	1<<((52)&7)
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((52)/8),f
	line	37
	movlw	1<<((53)&7)
	xorwf	((53)/8),f
	line	38
	
l184:	
	return
	opt stack 0
GLOBAL	__end_of_toggleLeds
	__end_of_toggleLeds:
;; =============== function _toggleLeds ends ============

	signat	_toggleLeds,88
	global	_configPORTs
psect	text139,local,class=CODE,delta=2
global __ptext139
__ptext139:

;; *************** function _configPORTs *****************
;; Defined at:
;;		line 40 in file "..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej1\P2Ej1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text139
	file	"..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej1\P2Ej1.c"
	line	40
	global	__size_of_configPORTs
	__size_of_configPORTs	equ	__end_of_configPORTs-_configPORTs
	
_configPORTs:	
	opt	stack 7
; Regs used in _configPORTs: [wreg]
	line	42
	
l1342:	
	movlw	(0CFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	43
	movlw	(01Fh)
	movwf	(133)^080h	;volatile
	line	44
	
l187:	
	return
	opt stack 0
GLOBAL	__end_of_configPORTs
	__end_of_configPORTs:
;; =============== function _configPORTs ends ============

	signat	_configPORTs,88
psect	text140,local,class=CODE,delta=2
global __ptext140
__ptext140:
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
