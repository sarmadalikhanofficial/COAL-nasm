mount c c:\assembly

c:

dir

nasm filename.asm -o filename.com

org 100h
//ORG 100h IS LIBRARY


mov ah, 09h
//varible declaration

mov dx, msg
//varible for printing msg

int 21h


mov ax, 4C00h
int 21h

msg db 'Hello from NASM$', 0



afd filename.com
press f1 to load and execute
<!-- practice for exams

integer print -->