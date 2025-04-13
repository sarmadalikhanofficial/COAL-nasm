ORG 0x100       ; Set start address for .COM program

MOV AL, 12      ; Dividend (AL holds the value to divide)
MOV BL, 4       ; Divisor (BL contains the number to divide by)
DIV BL          ; AL = AL / BL (result in AL, remainder in AH)

MOV AH, 4CH     ; DOS exit function
INT 21H         ; Interrupt to return control to DOS
