.model small
.stack 100h
.data
    num1 db 10          ; First number
    num2 db 5           ; Second number
    result_msg db 'Result of subtraction: $'
    zero_msg db 0dh,0ah,'Zero Flag (ZF) is set$'
    zero_not_msg db 0dh,0ah,'Zero Flag (ZF) is not set$'
    carry_msg db 0dh,0ah,'Carry Flag (CF) is set$'
    carry_not_msg db 0dh,0ah,'Carry Flag (CF) is not set$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Load numbers into registers
    mov al, num1        ; Load first number (10)
    mov bl, num2        ; Load second number (5)
    
    ; Perform subtraction
    sub al, bl          ; AL = AL - BL
    
    ; Display result
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    mov dl, al
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Check Zero Flag
    jz zero_set         ; Jump if Zero Flag is set
    mov ah, 09h
    lea dx, zero_not_msg
    int 21h
    jmp check_carry
    
zero_set:
    mov ah, 09h
    lea dx, zero_msg
    int 21h
    
check_carry:
    ; Check Carry Flag
    jc carry_set        ; Jump if Carry Flag is set
    mov ah, 09h
    lea dx, carry_not_msg
    int 21h
    jmp exit_program
    
carry_set:
    mov ah, 09h
    lea dx, carry_msg
    int 21h
    
exit_program:
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. Subtraction Operation:
;    - AL contains 10
;    - BL contains 5
;    - Result: 10 - 5 = 5
;
; 2. Flag Status:
;    - Zero Flag (ZF): Set if result is 0
;    - Carry Flag (CF): Set if result is negative
;
; 3. Expected Output:
;    "Result of subtraction: 5
;     Zero Flag (ZF) is not set
;     Carry Flag (CF) is not set"
;
; Note: The program demonstrates how to check
; status flags after arithmetic operations 