.model small
.stack 100h
.data
    num1 db 10          ; First number
    num2 db 20          ; Second number
    num3 db 30          ; Third number
    num4 db 15          ; Fourth number to subtract
    add_msg db 'Sum of first three numbers: $'
    sub_msg db 0dh,0ah,'Final result after subtraction: $'
    error_msg db 0dh,0ah,'Error: Result is negative!$'
    result_msg db 0dh,0ah,'Result stored in BX: $'
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
    
    ; Subtract fourth number and check for negative result
    sub al, num4        ; Subtract fourth number
    js negative_result  ; Jump if result is negative (SF=1)
    
    ; If not negative, store in BX
    mov bl, al          ; Store result in BL
    mov bh, 0           ; Clear BH
    
    ; Display final result
    mov ah, 09h
    lea dx, sub_msg
    int 21h
    
    mov dl, bl
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Display result in BX
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    mov dl, bl
    add dl, '0'
    mov ah, 02h
    int 21h
    
    jmp exit_program    ; Skip error message
    
negative_result:
    ; Display error message
    mov ah, 09h
    lea dx, error_msg
    int 21h
    
    ; Set BX to 0 to indicate error
    mov bx, 0
    
exit_program:
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of Error Handling:
; 1. The program uses the 'js' (Jump if Sign) instruction to check for negative results
; 2. If the result is negative:
;    - Displays an error message
;    - Sets BX to 0 to indicate error
; 3. If the result is positive:
;    - Stores the result in BX
;    - Displays the result
;
; Example scenarios:
; 1. With current values (10+20+30-15=45):
;    - Result is positive
;    - BX will contain 45
;
; 2. If num4 were 70 (10+20+30-70=-10):
;    - Result would be negative
;    - Error message would display
;    - BX would be set to 0
;
; Note: This program demonstrates basic error handling
; for negative numbers in assembly language 