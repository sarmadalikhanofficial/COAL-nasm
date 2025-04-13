ORG 0x100             ; // PROGRAM START LOCATION (FOR .COM FILES)

MOV AX, 10            ; // LOAD 10 INTO AX
MOV BX, 5             ; // LOAD 5 INTO BX
SUB AX, BX            ; // AX = AX - BX → 10 - 5 = 5

MOV AX, 0x4C00        ; // EXIT PROGRAM (DOS FUNCTION)
INT 0x21              ; // CALL DOS INTERRUPT TO EXIT
