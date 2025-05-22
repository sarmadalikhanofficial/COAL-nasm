.model small
.stack 100h
.data
    num1 db 15          ; First number (binary: 0000 1111)
    num2 db 8           ; Second number (binary: 0000 1000)
    result_msg db 'Result of addition: $'
    af_msg db 0dh,0ah,'Auxiliary Carry Flag (AF) is set$'
    af_not_msg db 0dh,0ah,'Auxiliary Carry Flag (AF) is not set$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Load numbers into registers
    mov al, num1        ; Load first number (15)
    mov bl, num2        ; Load second number (8)
    
    ; Perform addition
    add al, bl          ; AL = AL + BL
    
    ; Display result
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    mov dl, al
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h
    
    ; Check Auxiliary Carry Flag
    lahf               ; Load flags into AH
    test ah, 10h       ; Test bit 4 (AF)
    jnz af_set         ; Jump if AF is set
    
    mov ah, 09h
    lea dx, af_not_msg
    int 21h
    jmp exit_program
    
af_set:
    mov ah, 09h
    lea dx, af_msg
    int 21h
    
exit_program:
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. Addition Operation:
;    - AL contains 15 (0000 1111)
;    - BL contains 8  (0000 1000)
;    - Result: 15 + 8 = 23
;
; 2. Auxiliary Carry Flag (AF):
;    - Set when there's a carry from bit 3 to bit 4
;    - In this case, AF will be set because:
;      0000 1111
;    + 0000 1000
;    = 0001 0111
;      ^ (carry from bit 3 to bit 4)
;
; 3. Expected Output:
;    "Result of addition: 23
;     Auxiliary Carry Flag (AF) is set"
;
; Note: The program demonstrates how to check
; the Auxiliary Carry Flag after addition 