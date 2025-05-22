.model small
.stack 100h
.data
    num1 db 10          ; First number
    num2 db 20          ; Second number
    num3 db 30          ; Third number
    num4 db 15          ; Fourth number to subtract
    add_msg db 'Sum of first three numbers: $'
    sub_msg db 0dh,0ah,'Final result after subtraction: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Add first three numbers
    mov al, num1        ; Load first number
    add al, num2        ; Add second number
    add al, num3        ; Add third number
    
    ; Display sum of first three numbers
    mov ah, 09h
    lea dx, add_msg
    int 21h
    
    mov dl, al
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Subtract fourth number and store in BX
    sub al, num4        ; Subtract fourth number
    mov bl, al          ; Store result in BL (lower part of BX)
    mov bh, 0           ; Clear BH (upper part of BX)
    
    ; Display final result
    mov ah, 09h
    lea dx, sub_msg
    int 21h
    
    mov dl, bl
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. First three numbers are added:
;    - num1 (10) + num2 (20) + num3 (30) = 60
;
; 2. Fourth number is subtracted:
;    - 60 - num4 (15) = 45
;
; 3. Final result (45) is stored in BX register
;    - BL contains 45
;    - BH contains 0
;
; Note: The program uses 8-bit operations for simplicity
; but stores the final result in a 16-bit register (BX) 