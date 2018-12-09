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
	FNROOT	_main
	global	_RA0
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
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
	file	"C:\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_STR\Repaso Prácticas\Práctica 2\Ej1.as"
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
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_main
??_main:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      2       2

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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0       0
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
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
;;STACK                0      0       0       2        0.0%
;;BANK0               42      2       2       3        3.0%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 5 in file "..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_STR\Repaso Prácticas\Práctica 2\Ej1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  168[BANK0 ] int 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       2
;;      Totals:         0       2
;;Total ram usage:        2 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_STR\Repaso Prácticas\Práctica 2\Ej1.c"
	line	5
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2]
	line	7
	
l1323:	
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	8
	
l1325:	
	clrf	(134)^080h	;volatile
	line	10
	
l1327:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	line	11
	
l1329:	
	bsf	(53/8),(53)&7
	line	13
	goto	l169
	
l170:	
	line	15
	
l169:	
	line	13
	btfss	(40/8),(40)&7
	goto	u2161
	goto	u2160
u2161:
	goto	l1333
u2160:
	
l1331:	
	btfsc	(41/8),(41)&7
	goto	u2171
	goto	u2170
u2171:
	goto	l169
u2170:
	goto	l1333
	
l172:	
	goto	l1333
	
l173:	
	goto	l1333
	line	17
	
l174:	
	line	18
	
l1333:	
	movlw	1<<((52)&7)
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((52)/8),f
	line	19
	movlw	1<<((53)&7)
	xorwf	((53)/8),f
	line	20
	opt asmopt_off
movlw	82
movwf	((??_main+0)+0+1),f
	movlw	41
movwf	((??_main+0)+0),f
u2187:
	decfsz	((??_main+0)+0),f
	goto	u2187
	decfsz	((??_main+0)+0+1),f
	goto	u2187
	nop2
opt asmopt_on

	line	21
	goto	l1333
	
l175:	
	line	24
;	Return value of _main is never used
	
l176:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
psect	maintext
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
