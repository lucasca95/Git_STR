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
	FNCALL	_main,_config
	FNCALL	_main,_toggleLeds
	FNROOT	_main
	FNCALL	intlevel1,_handler
	global	intlevel1
	FNROOT	intlevel1
	global	_desborde
	global	_GIE
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:
_GIE	set	95
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_PS0
_PS0	set	1032
	global	_PS1
_PS1	set	1033
	global	_PS2
_PS2	set	1034
	global	_PSA
_PSA	set	1035
	global	_T0CS
_T0CS	set	1037
	global	_T0SE
_T0SE	set	1036
	file	"C:\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_desborde:
       ds      1

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_config
??_config:	; 0 bytes @ 0x0
	global	??_toggleLeds
??_toggleLeds:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_config
?_config:	; 0 bytes @ 0x0
	global	?_toggleLeds
?_toggleLeds:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_handler
?_handler:	; 0 bytes @ 0x0
	global	??_handler
??_handler:	; 0 bytes @ 0x0
	ds	4
;;Data sizes: Strings 0, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      4       5

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _handler in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _handler in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;;                             _config
;;                         _toggleLeds
;; ---------------------------------------------------------------------------------
;; (1) _toggleLeds                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _config                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _handler                                              4     4      0       0
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _config
;;   _toggleLeds
;;
;; _handler (ROOT)
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
;;BANK0               42      4       5       3        7.6%
;;ABS                  0      0       5       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       6       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 15 in file "..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.c"
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
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_config
;;		_toggleLeds
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.c"
	line	15
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	17
	
l1388:	
	fcall	_config
	line	18
	
l1390:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	line	19
	
l1392:	
	bsf	(53/8),(53)&7
	line	22
	goto	l173
	
l174:	
	line	25
	
l173:	
	line	22
	btfss	(40/8),(40)&7
	goto	u2171
	goto	u2170
u2171:
	goto	l177
u2170:
	
l1394:	
	btfsc	(41/8),(41)&7
	goto	u2181
	goto	u2180
u2181:
	goto	l173
u2180:
	goto	l177
	
l176:	
	
l177:	
	line	28
	bsf	(93/8),(93)&7
	goto	l1396
	line	31
	
l178:	
	line	33
	
l1396:	
	movf	(_desborde),w
	skipz
	goto	u2190
	goto	l1396
u2190:
	line	35
	
l1398:	
	fcall	_toggleLeds
	line	36
	
l1400:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_desborde)
	goto	l1396
	line	37
	
l179:	
	goto	l1396
	line	38
	
l180:	
	line	31
	goto	l1396
	
l181:	
	line	39
	
l182:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_toggleLeds
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function _toggleLeds *****************
;; Defined at:
;;		line 41 in file "..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text156
	file	"..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.c"
	line	41
	global	__size_of_toggleLeds
	__size_of_toggleLeds	equ	__end_of_toggleLeds-_toggleLeds
	
_toggleLeds:	
	opt	stack 6
; Regs used in _toggleLeds: [wreg]
	line	42
	
l1380:	
	movlw	1<<((52)&7)
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((52)/8),f
	line	43
	movlw	1<<((53)&7)
	xorwf	((53)/8),f
	line	44
	
l185:	
	return
	opt stack 0
GLOBAL	__end_of_toggleLeds
	__end_of_toggleLeds:
;; =============== function _toggleLeds ends ============

	signat	_toggleLeds,88
	global	_config
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _config *****************
;; Defined at:
;;		line 46 in file "..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text157
	file	"..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.c"
	line	46
	global	__size_of_config
	__size_of_config	equ	__end_of_config-_config
	
_config:	
	opt	stack 6
; Regs used in _config: [wreg]
	line	48
	
l1364:	
	movlw	(0CFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	49
	movlw	(01Fh)
	movwf	(133)^080h	;volatile
	line	52
	
l1366:	
	bcf	(1037/8)^080h,(1037)&7
	line	53
	
l1368:	
	bsf	(1036/8)^080h,(1036)&7
	line	54
	
l1370:	
	bcf	(1035/8)^080h,(1035)&7
	line	55
	
l1372:	
	bsf	(1034/8)^080h,(1034)&7
	line	56
	
l1374:	
	bsf	(1033/8)^080h,(1033)&7
	line	57
	
l1376:	
	bsf	(1032/8)^080h,(1032)&7
	line	58
	
l1378:	
	bsf	(95/8),(95)&7
	line	59
	
l188:	
	return
	opt stack 0
GLOBAL	__end_of_config
	__end_of_config:
;; =============== function _config ends ============

	signat	_config,88
	global	_handler
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _handler *****************
;; Defined at:
;;		line 61 in file "..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       4
;;      Totals:         0       4
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text158
	file	"..\..\..\..\..\..\..\Users\User\Documents\Facultad\Sistemas de Tiempo Real\Git_SistemasTiempoReal\Lucas\Pract2\P2Ej2\P2Ej2.c"
	line	61
	global	__size_of_handler
	__size_of_handler	equ	__end_of_handler-_handler
	
_handler:	
	opt	stack 6
; Regs used in _handler: [status]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_handler+0)
	movf	fsr0,w
	movwf	(??_handler+1)
	movf	pclath,w
	movwf	(??_handler+2)
	movf	btemp+1,w
	movwf	(??_handler+3)
	ljmp	_handler
psect	text158
	line	62
	
i1l1382:	
	bcf	(95/8),(95)&7
	line	63
	
i1l1384:	
	clrf	(_desborde)
	bsf	status,0
	rlf	(_desborde),f
	line	64
	
i1l1386:	
	bcf	(90/8),(90)&7
	line	65
	
i1l191:	
	movf	(??_handler+3),w
	movwf	btemp+1
	movf	(??_handler+2),w
	movwf	pclath
	movf	(??_handler+1),w
	movwf	fsr0
	swapf	(??_handler+0)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_handler
	__end_of_handler:
;; =============== function _handler ends ============

	signat	_handler,88
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
