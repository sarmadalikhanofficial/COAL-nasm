.data
prompt_float1: .asciiz "Enter the first floating-point number: "
prompt_float2: .asciiz "Enter the second floating-point number: "
result_div: .asciiz "The result of division is: "
error_msg: .asciiz "Error: Division by zero is not allowed!\n"
newline: .asciiz "\n"
zero: .float 0.0

.text
.globl main
main:
    # Prompt for first number
    li $v0, 4
    la $a0, prompt_float1
    syscall
    li $v0, 6
    syscall
    mov.s $f2, $f0    # Save first number in $f2

    # Prompt for second number
    li $v0, 4
    la $a0, prompt_float2
    syscall
    li $v0, 6
    syscall
    mov.s $f4, $f0    # Save second number in $f4

    # Load zero into $f6 for comparison
    l.s $f6, zero

    # Check if second number is zero
    c.eq.s $f4, $f6
    bc1t division_by_zero

    # Perform division
    div.s $f8, $f2, $f4

    # Display result
    li $v0, 4
    la $a0, result_div
    syscall
    mov.s $f12, $f8
    li $v0, 2
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    j exit

division_by_zero:
    # Display error message
    li $v0, 4
    la $a0, error_msg
    syscall

exit:
    # Exit program
    li $v0, 10
    syscall
