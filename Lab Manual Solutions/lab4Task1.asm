.model small
.stack 100h
.data
    start_num db 1      ; Starting number
    end_num db 20       ; Ending number
    newline db 0dh,0ah,'$'  ; For new line
.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    mov cl, start_num   ; Initialize counter with 1
    
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
    
    ; Increment counter
    inc cl
    
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
;    - Starts from 1 (start_num)
;    - Continues until 20 (end_num)
;
; 2. Loop Process:
;    - Converts number to ASCII
;    - Displays number
;    - Prints newline
;    - Increments counter
;    - Checks if reached end
;
; 3. Expected Output:
;    1
;    2
;    3
;    ...
;    20
;
; Note: The program uses a simple loop structure
; with counter in CL register and conditional jump 