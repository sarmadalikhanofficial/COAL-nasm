.model small
.stack 100h
.data
    start_num db 2      ; Starting number (first even number)
    end_num db 20       ; Ending number
    newline db 0dh,0ah,'$'  ; For new line
.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    mov cl, start_num   ; Initialize counter with 2
    
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
    
    ; Increment counter by 2 (to get next even number)
    add cl, 2
    
    ; Check if we've reached 20
    cmp cl, end_num
    jle print_loop      ; If less than or equal to 20, continue loop
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main

; Explanation of the program:
; 1. Loop Setup:
;    - CL register used as counter
;    - Starts from 2 (first even number)
;    - Continues until 20
;
; 2. Loop Process:
;    - Converts number to ASCII
;    - Displays number
;    - Prints newline
;    - Increments counter by 2
;    - Checks if reached end
;
; 3. Expected Output:
;    2
;    4
;    6
;    ...
;    20
;
; Note: The program uses a simple loop structure
; with counter incrementing by 2 to get even numbers 