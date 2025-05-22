.data
    prompt1: .asciiz "Enter first number: "
    prompt2: .asciiz "Enter second number: "
    result_msg: .asciiz "Quotient is: "
    error_msg: .asciiz "Error: Division by zero!"
    newline: .asciiz "\n"

.text
main:
    # Print first prompt
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Read first number
    li $v0, 5
    syscall
    move $t0, $v0    # Store first number in $t0
    
    # Print second prompt
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Read second number
    li $v0, 5
    syscall
    move $t1, $v0    # Store second number in $t1
    
    # Check for division by zero
    beq $t1, $zero, division_by_zero
    
    # Perform division
    div $t0, $t1     # Divide $t0 by $t1
    mflo $t2         # Move quotient to $t2
    
    # Print result message
    li $v0, 4
    la $a0, result_msg
    syscall
    
    # Print quotient
    li $v0, 1
    move $a0, $t2
    syscall
    
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Exit program
    li $v0, 10
    syscall
    
division_by_zero:
    # Print error message
    li $v0, 4
    la $a0, error_msg
    syscall
    
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Exit program
    li $v0, 10
    syscall

# Explanation of the program:
# 1. Input:
#    - Prompts user for two numbers
#    - Stores first number in $t0
#    - Stores second number in $t1
#
# 2. Division:
#    - Checks for division by zero
#    - Uses div instruction for division
#    - Stores quotient in $t2 using mflo
#
# 3. Output:
#    - Displays quotient
#    - Handles division by zero error
#
# 4. Example:
#    Input: 10, 2
#    Output: "Quotient is: 5"
#
# Note: The program includes error handling
# for division by zero 