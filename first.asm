; ORG 100h IS LIBRARY
org 100h
; variable declaration
mov ah, 09h
; variable for printing msg
mov dx, msg
; for printing variable
int 21h
; one more variable 
mov ax, 4C00h
int 21h
; save to database
msg db 'Hello from NASM$', 0
; 'Hello from NASM$'terminator
 