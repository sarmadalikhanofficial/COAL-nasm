.data
prompt_double1: .asciiz "Enter the first double-precision number: "
prompt_double2: .asciiz "Enter the second double-precision number: "
result_add: .asciiz "The result of addition is: "
result_mul: .asciiz "The result of multiplication is: "
newline: .asciiz "\n"

.text
.globl main
main:
    # Prompt for first number
    li $v0, 4
    la $a0, prompt_double1
    syscall
    li $v0, 7        # Read double into $f0
    syscall
    mov.d $f2, $f0   # Save first number in $f2

    # Prompt for second number
    li $v0, 4
    la $a0, prompt_double2
    syscall
    li $v0, 7        # Read double into $f0
    syscall
    mov.d $f4, $f0   # Save second number in $f4

    # Addition
    add.d $f6, $f2, $f4

    # Display addition result
    li $v0, 4
    la $a0, result_add
    syscall
    mov.d $f12, $f6
    li $v0, 3        # Print double
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # Multiplication
    mul.d $f8, $f2, $f4

    # Display multiplication result
    li $v0, 4
    la $a0, result_mul
    syscall
    mov.d $f12, $f8
    li $v0, 3        # Print double
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall