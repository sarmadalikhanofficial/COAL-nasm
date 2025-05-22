.model small
.stack 100h
.data
    name_msg db 'Name: Iqra Uni$'           
    roll_msg db 0dh,0ah,'Roll Number: 12345$' 
    dept_msg db 0dh,0ah,'Department: Computer Science$'  ; Replace with actual department
.code
main proc
    mov ax, @data                    ; Initialize data segment
    mov ds, ax
    
    ; Print name
    mov ah, 09h                      ; Function to print string
    lea dx, name_msg                 ; Load address of name message
    int 21h                         ; Call DOS interrupt
    
    ; Print roll number
    mov ah, 09h
    lea dx, roll_msg
    int 21h
    
    ; Print department
    mov ah, 09h
    lea dx, dept_msg
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main 