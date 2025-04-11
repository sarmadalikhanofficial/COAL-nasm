ORG 0x100        ; Start of the program

MOV AL, 9        ; Load 5 into AL (8-bit register)
MOV BL, 9        ; Load 4 into BL
MUL BL           ; AL * BL => result in AX (since we're using AL, result is in AX)

MOV AH, 4Ch      ; Terminate program
INT 21h
