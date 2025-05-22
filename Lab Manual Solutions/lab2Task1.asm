.model small
.stack 100h
.data
    num1 db 10          ; First number
    num2 db 5           ; Second number
    result_add db ?     ; Variable to store addition result
    result_sub db ?     ; Variable to store subtraction result
    add_msg db 'Addition Result: $'
    sub_msg db 0dh,0ah,'Subtraction Result: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Addition operation
    mov al, num1        ; Load num1 (10) into al
    add al, num2        ; Add num2 (5) to al
    mov result_add, al  ; Store result in result_add
    
    ; Subtraction operation
    mov al, num1        ; Load num1 (10) into al
    sub al, num2        ; Subtract num2 (5) from al
    mov result_sub, al  ; Store result in result_sub
    
    ; Display addition result
    mov ah, 09h
    lea dx, add_msg
    int 21h
    
    mov dl, result_add
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Display subtraction result
    mov ah, 09h
    lea dx, sub_msg
    int 21h
    
    mov dl, result_sub
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of Results:
; 1. Addition (result_add):
;    - num1 = 10
;    - num2 = 5
;    - result_add = num1 + num2 = 10 + 5 = 15
;
; 2. Subtraction (result_sub):
;    - num1 = 10
;    - num2 = 5
;    - result_sub = num1 - num2 = 10 - 5 = 5
;
; The program performs these operations using:
; - ADD instruction for addition
; - SUB instruction for subtraction
; Results are stored in 8-bit registers (al) 
 