.model small
.stack 100h
.data
    start_num db 50     ; Starting number
    end_num db 1        ; Ending number
    newline db 0dh,0ah,'$'  ; For new line
.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    mov cl, start_num   ; Initialize counter with 50
    
print_loop:
    ; Convert number to ASCII and display
    mov dl, cl
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h         ; Function to display character
    int 21h             ; Call DOS interrupt
    
    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Decrement counter
    dec cl
    
    ; Check if we've reached 1
    cmp cl, end_num
    jge print_loop      ; If greater than or equal to 1, continue loop
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. Loop Setup:
;    - CL register used as counter
;    - Starts from 50 (start_num)
;    - Continues until 1 (end_num)
;
; 2. Loop Process:
;    - Converts number to ASCII
;    - Displays number
;    - Prints newline
;    - Decrements counter
;    - Checks if reached end
;
; 3. Expected Output:
;    50
;    49
;    48
;    ...
;    1
;
; Note: The program uses a simple loop structure
; with counter decrementing to count down 