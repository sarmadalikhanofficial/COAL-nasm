; ORG 100h IS LIBRARY
org 100h

; varible declaration
mov ah, 09h
; varible for printing msg
mov dx, msg
; for printing varible
int 21h
; one more variable 
mov ax, 4C00h
int 21h
; save to database
msg db 'Hello from NASM$', 0
; 'Hello from NASM$'terminator
