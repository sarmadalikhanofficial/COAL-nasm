org 100h

mov ah, 09h
mov dx, msg
int 21h

mov ax,4C00h
int21h

msg db'Hello from NASM$',0