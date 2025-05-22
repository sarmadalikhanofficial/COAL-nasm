.model small
.stack 100h
.data
    num1 db 8           ; First number
    num2 db 6           ; Second number
    result_msg db 'Result of 8 * 6 = $'
.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    ; Set up registers for multiplication
    mov al, num1        ; Load first number (8) into AL
    mov bl, num2        ; Load second number (6) into BL
    
    ; Perform multiplication
    mul bl              ; Multiply AL by BL, result in AX
    
    ; Display result message
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    ; Convert result to ASCII and display
    mov bx, ax          ; Store result in BX for processing
    
    ; Display tens digit
    mov al, bl          ; Get result
    mov ah, 0           ; Clear AH for division
    mov bl, 10          ; Divisor for getting tens digit
    div bl              ; Divide by 10
    mov cl, ah          ; Save remainder (ones digit)
    mov ah, 0           ; Clear AH again
    div bl              ; Divide by 10 again
    mov ch, ah          ; Save remainder (tens digit)
    
    ; Display tens digit
    mov dl, ch
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Display ones digit
    mov dl, cl
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. Register Setup:
;    - AL contains first number (8)
;    - BL contains second number (6)
;
; 2. Multiplication:
;    - MUL instruction multiplies AL by BL
;    - Result is stored in AX (8 * 6 = 48)
;
; 3. Result Display:
;    - Converts result to ASCII
;    - Displays tens digit (4)
;    - Displays ones digit (8)
;
; 4. Expected Output:
;    "Result of 8 * 6 = 48"
;
; Note: The program handles two-digit results
; by separating and displaying tens and ones digits 