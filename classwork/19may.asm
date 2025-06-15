.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
add_msg: .asciiz "Addition: "
mul_msg: .asciiz "Multiplication: "
nl: .asciiz "\n"

.text
.globl main
main:
    # Prompt 1
    li $v0, 4        # print string
    la $a0, msg1
    syscall

    li $v0, 6        # Read float into $f0
    syscall
    mov.s $f2, $f0   # Save first input in $f2

    # Prompt 2
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 6        # Read second float into $f0
    syscall
    mov.s $f4, $f0   # Save second input in $f4

    # Addition
    add.s $f6, $f2, $f4
    li $v0, 4
    la $a0, add_msg
    syscall
    mov.s $f12, $f6
    li $v0, 2
    syscall
    li $v0, 4
    la $a0, nl
    syscall

    # Multiplication
    mul.s $f8, $f2, $f4
    li $v0, 4
    la $a0, mul_msg
    syscall
    mov.s $f12, $f8
    li $v0, 2
    syscall
    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall
