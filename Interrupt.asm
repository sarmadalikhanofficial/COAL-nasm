
			Org 0000h
			Ljmp Main
	
			Org 0003h		
         Ljmp 0060h     ;Location of ISR
         
;------------ Define ISR ----------------------	         
         Org 0060h
INTZero:	Mov R0,#80h	   ;Set 4 MSB high
			Mov P1,R0		
			Acall LongDelay
			Reti
         
;----------- Start of Main ---------------------
Main:		Mov IE,#81h		;Enable INT0
Back: 	Mov R1,#01h
			Mov P1,R1
			Jmp Back

;-------------- Long Delay ---------------------
LongDelay:	Mov R3,#0D0H
Start:	   Acall FiftyMSec
            Djnz R3,Start
            Ret

FiftyMSec:	Mov TMOD,#01   ;Timer 0, mode 1
            Clr ET0        ;ETO - Enable Timer0 interrupt
Here:		   Mov TH0,#03CH  ;TH0 = 3CH, high byte
            Mov TL0,#0B0H  ;TL0 = B0H, low byte
            Clr TF0        ;Clear Timer 0 flag
            Setb TR0       ;start Timer 0
Again:		Jnb TF0,Again  ;monitor Timer 0 flag until it rolls over
            Clr TR0        ;stop Timer 0
            Ret
			
            End
