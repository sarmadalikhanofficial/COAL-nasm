.model small
.stack 100h
.data
    num1 db 7           ; First number
    num2 db 3           ; Second number
    num3 db 5           ; Number to multiply by
    num4 db 4           ; Number to divide by
    result_msg db 'Result of (7 + 3) * 5 / 4 = $'
.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    ; Step 1: Add 7 and 3
    mov al, num1        ; Load first number (7)
    add al, num2        ; Add second number (3)
    ; Result in AL = 10
    
    ; Step 2: Multiply by 5
    mov bl, num3        ; Load multiplier (5)
    mul bl              ; Multiply AL by BL
    ; Result in AX = 50
    
    ; Step 3: Divide by 4
    mov bl, num4        ; Load divisor (4)
    div bl              ; Divide AX by BL
    ; Quotient in AL = 12, Remainder in AH = 2
    
    ; Display result message
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    ; Convert result to ASCII and display
    mov bl, al          ; Save quotient
    mov al, ah          ; Get remainder
    mov ah, 0           ; Clear AH for division
    
    ; Display tens digit
    mov cl, 10          ; Divisor for getting tens digit
    div cl              ; Divide by 10
    mov ch, ah          ; Save remainder (ones digit)
    
    ; Display tens digit
    mov dl, al
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Display ones digit
    mov dl, ch
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. Step 1: Addition
;    - Adds 7 + 3 = 10
;    - Result stored in AL
;
; 2. Step 2: Multiplication
;    - Multiplies 10 * 5 = 50
;    - Result stored in AX
;
; 3. Step 3: Division
;    - Divides 50 / 4 = 12 with remainder 2
;    - Quotient in AL, remainder in AH
;
; 4. Result Display:
;    - Converts result to ASCII
;    - Displays tens and ones digits
;
; 5. Expected Output:
;    "Result of (7 + 3) * 5 / 4 = 12"
;
; Note: The program handles two-digit results
; by separating and displaying tens and ones digits 