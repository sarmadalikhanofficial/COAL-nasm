.data
    prompt1: .asciiz "Enter first number: "
    prompt2: .asciiz "Enter second number: "
    prompt3: .asciiz "Enter third number: "
    result_msg: .asciiz "Result of multiplication is: "
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
    
    # Print third prompt
    li $v0, 4
    la $a0, prompt3
    syscall
    
    # Read third number
    li $v0, 5
    syscall
    move $t2, $v0    # Store third number in $t2
    
    # Perform multiplication
    mul $t3, $t0, $t1    # Multiply first two numbers
    mul $t3, $t3, $t2    # Multiply result by third number
    
    # Print result message
    li $v0, 4
    la $a0, result_msg
    syscall
    
    # Print result
    li $v0, 1
    move $a0, $t3
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
#    - Prompts user for three numbers
#    - Stores first number in $t0
#    - Stores second number in $t1
#    - Stores third number in $t2
#
# 2. Multiplication:
#    - First multiplies $t0 and $t1
#    - Then multiplies result by $t2
#    - Stores final result in $t3
#
# 3. Output:
#    - Displays the final multiplication result
#
# 4. Example:
#    Input: 2, 3, 4
#    Output: "Result of multiplication is: 24"
#
# Note: The program uses mul instruction
# for multiplication operations 