.model small
.stack 100h
.data
    message db 'Hello World!$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Display message
    mov ah, 09h
    lea dx, message
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main 