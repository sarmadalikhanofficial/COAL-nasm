ORG 0X100
MOV AL, 3 ; First number in AL (lower 8 bits of AX)
MOV BL, 4 ; Second number in BL (lower 8 bits of BX)
MUL BL    ; Multiply AL by BL, result in AX
MOV AH, 4CH    ; Exit function in AH
INT 21H   ; DOS interrupt