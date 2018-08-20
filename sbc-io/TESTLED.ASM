*       LED TEST for SBC6800 + SBC-I/O
*	SB-Assembler
*
	.CR     6800		To load this cross overlay
	.TF	TESTLED.MOT,S19	Motorola S19 format (64 kb range)
	.SF	TESTLED		Symbol file
	.LF	TESTLED		List file
*
LED     .EQ     $8000
STACK   .EQ     $DFFF
*
        .OR     $A000
*
START   LDS     #STACK
        LDAA    #$00
LOOP    STAA    LED
        INCA
        BSR     WAIT
        BSR     WAIT
        BSR     WAIT
        BSR     WAIT
        BSR     WAIT
        BSR     WAIT
        BSR     WAIT
        BSR     WAIT
        BSR     WAIT
        BSR     WAIT
        BRA     LOOP
*
WAIT    LDAB    #$00
WAIT2   INCB
        TSTB
        BNE     WAIT2
        RTS

        .EN
