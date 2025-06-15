.data
askName: .asciiz "Enter your name: "
greet:   .asciiz "Hey, "
newline: .asciiz "\n"
buffer:  .space 100      # Reserve 100 bytes for name input

.text
.globl main
main:
    # Ask for name
    li $v0, 4              # syscall 4 = print string
    la $a0, askName
    syscall

    # Read name into buffer
    li $v0, 8              # syscall 8 = read string
    la $a0, buffer         # where to store input
    li $a1, 100            # max characters
    syscall

    # Print greeting
    li $v0, 4
    la $a0, greet
    syscall

    # Print the name
    li $v0, 4
    la $a0, buffer
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit
    li $v0, 10
    syscall
