.model small
.stack 100h
.data
    dividend db 36       ; Number to be divided
    divisor db 6         ; Number to divide by
    result_msg db 'Result of 36 / 6 = $'
.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    ; Set up registers for division
    mov al, dividend    ; Load dividend (36) into AL
    mov ah, 0           ; Clear AH for 16-bit division
    mov bl, divisor     ; Load divisor (6) into BL
    
    ; Perform division
    div bl              ; Divide AX by BL, quotient in AL, remainder in AH
    
    ; Display result message
    mov ah, 09h
    lea dx, result_msg
    int 21h
    
    ; Convert quotient to ASCII and display
    mov dl, al          ; Move quotient to DL
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h         ; Function to display character
    int 21h             ; Call DOS interrupt
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. Register Setup:
;    - AL contains dividend (36)
;    - AH is cleared for 16-bit division
;    - BL contains divisor (6)
;
; 2. Division Process:
;    - DIV instruction divides AX by BL
;    - Quotient is stored in AL (36 / 6 = 6)
;    - Remainder is stored in AH (0 in this case)
;
; 3. Result Display:
;    - Converts quotient to ASCII
;    - Uses DOS interrupt to display
;
; 4. Expected Output:
;    "Result of 36 / 6 = 6"
;
; Note: The program handles single-digit quotient
; and properly sets up registers for division 