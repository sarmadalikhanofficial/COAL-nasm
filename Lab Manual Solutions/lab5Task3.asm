.model small
.stack 100h
.data
    num1 db 10          ; First number
    num2 db 5           ; Second number
    equal_msg db 'Numbers are equal$'
    greater_msg db 'First number is greater$'
    less_msg db 'First number is less$'
    zf_msg db 0dh,0ah,'Zero Flag (ZF) is set$'
    zf_not_msg db 0dh,0ah,'Zero Flag (ZF) is not set$'
    cf_msg db 0dh,0ah,'Carry Flag (CF) is set$'
    cf_not_msg db 0dh,0ah,'Carry Flag (CF) is not set$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Load numbers into registers
    mov al, num1        ; Load first number (10)
    mov bl, num2        ; Load second number (5)
    
    ; Compare numbers
    cmp al, bl          ; Compare AL with BL
    
    ; Check result and display appropriate message
    je numbers_equal    ; Jump if equal (ZF=1)
    jg first_greater    ; Jump if greater (ZF=0 and CF=0)
    
    ; If we get here, first number is less
    mov ah, 09h
    lea dx, less_msg
    int 21h
    jmp check_flags
    
numbers_equal:
    mov ah, 09h
    lea dx, equal_msg
    int 21h
    jmp check_flags
    
first_greater:
    mov ah, 09h
    lea dx, greater_msg
    int 21h
    
check_flags:
    ; Check Zero Flag
    jz zf_set          ; Jump if Zero Flag is set
    mov ah, 09h
    lea dx, zf_not_msg
    int 21h
    jmp check_carry
    
zf_set:
    mov ah, 09h
    lea dx, zf_msg
    int 21h
    
check_carry:
    ; Check Carry Flag
    jc cf_set          ; Jump if Carry Flag is set
    mov ah, 09h
    lea dx, cf_not_msg
    int 21h
    jmp exit_program
    
cf_set:
    mov ah, 09h
    lea dx, cf_msg
    int 21h
    
exit_program:
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. Comparison Operation:
;    - AL contains 10
;    - BL contains 5
;    - CMP instruction sets flags based on AL - BL
;
; 2. Flag Status:
;    - Zero Flag (ZF): Set if numbers are equal
;    - Carry Flag (CF): Set if first number is less
;
; 3. Expected Output:
;    "First number is greater
;     Zero Flag (ZF) is not set
;     Carry Flag (CF) is not set"
;
; Note: The program demonstrates how to use
; comparison and conditional jumps based on flags 