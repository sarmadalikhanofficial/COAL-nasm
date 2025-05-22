.data
prompt_float1: .asciiz "Enter the first floating-point number: "
prompt_float2: .asciiz "Enter the second floating-point number: "
prompt_float3: .asciiz "Enter the third floating-point number: "
result_add: .asciiz "The result of addition is: "
newline: .asciiz "\n"

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

    # Prompt for third number
    li $v0, 4
    la $a0, prompt_float3
    syscall
    li $v0, 6
    syscall
    mov.s $f6, $f0    # Save third number in $f6

    # Add all three numbers
    add.s $f8, $f2, $f4    # Add first and second
    add.s $f8, $f8, $f6    # Add third number

    # Display result
    li $v0, 4
    la $a0, result_add
    syscall
    mov.s $f12, $f8
    li $v0, 2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
