ORG 100h

; DOS print function
mov ah, 09h       
mov dx, msg       ; Address of the message to print
int 21h           ; Call DOS function

; Exit the program properly
mov ax, 4C00h     
int 21h

; Message definition (string must end with $)
msg db '074074$', 0
