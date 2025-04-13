org 100h ; ORG 100h IS LIBRARY
mov ah, 09h ; variable declaration
mov dx, msg ; variable for printing msg
int 21h ; for printing variable
mov ax, 4C00h ; one more variable 
int 21h ; save to database
msg db 'Hello from NASM$', 0
; 'Hello from NASM$'terminator