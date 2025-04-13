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
