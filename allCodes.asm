;ADD
ORG 0X100
MOV AX, 5
MOV BX, 7
ADD AX, BX
MOV AX, 0X4C00
INT 0X21

; SUB
ORG 0X100
MOV AX, 5
MOV BX, 7
ADD AX, BX
MOV BX, 2
SUB AX, BX
MOV AX, 0X4C00
INT 0X21

;SUB TWO VALUES
ORG 0x100           
MOV AX, 10            
MOV BX, 5             
SUB AX, BX           
MOV AX, 0x4C00      
INT 0x21   

; MUL
ORG 0X100
MOV AL, 3
MOV BL, 4
MUL BL
MOV AH, 4CH
INT 21H

; DIV
ORG 0X100
MOV DX, 0
MOV AX, 25
MOV BX, 5
DIV BX
MOV AX, 0X4C00
INT 0X21

;HELLO NASM
ORG 100h
MOV AH, 09h
MOV DX, msg
INT 21h
MOV AX, 4C00H
INT 21h
msg db 'Hello from NASM$', 0

;LOOP
ORG 0X100
MOV CX, 10
MOV AX, 0
L1:
    ADD AX,1
    LOOP L1
MOV AX, 0X4C00
INT 0X21

;FIBONACCI
[ORG 0X100] 
MOV CX,6;  	 	 	 	 
MOV AX,0;  	 	 	 	 
MOV BX,1;  	 	 	 	 
MOV DX,AX; 	 	 	 	 
L1: 	 	 	 	 	 	 
ADD BX,DX;  	 	 	 	 
MOV AX,BX; 
MOV BX,DX; 
MOV DX,AX; 
SUB AX,1; 
LOOP L1 
MOV AX,0X4C00 
INT 0X21 



