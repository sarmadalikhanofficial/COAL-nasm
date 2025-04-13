; Performs: 5 + 4 = 9, then 9 - 2 = 7

ORG 0x100              ; // PROGRAM STARTS AT MEMORY ADDRESS 0100H

MOV AX, 5              ; // AX = 5
MOV BX, 4              ; // BX = 4
ADD AX, BX             ; // AX = AX + BX → AX = 5 + 4 = 9

MOV BX, 2              ; // BX = 2 (overwrites previous 4)
SUB AX, BX             ; // AX = AX - BX → AX = 9 - 2 = 7

MOV AX, 0x4C00         ; // LOAD FUNCTION CODE TO EXIT PROGRAM
INT 0x21               ; // CALL DOS INTERRUPT TO EXIT
