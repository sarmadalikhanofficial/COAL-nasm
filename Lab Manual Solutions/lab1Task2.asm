.model small
.stack 100h
.data
    message db 'Hello from NASM$'    ; Define the message with $ as string terminator
.code
main proc
    mov ax, @data                    ; Initialize data segment
    mov ds, ax
    
    mov ah, 09h                      ; Function to print string
    lea dx, message                  ; Load address of message into dx
    int 21h                         ; Call DOS interrupt
    
    mov ah, 4ch                      ; Function to exit program
    int 21h                         ; Call DOS interrupt
main endp
end main 