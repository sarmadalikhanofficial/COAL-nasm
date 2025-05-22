.data
    prompt1: .asciiz "Enter first number: "
    prompt2: .asciiz "Enter second number: "
    prompt3: .asciiz "Enter third number: "
    result_msg: .asciiz "Result of multiplication is: "
    overflow_msg: .asciiz "Error: Multiplication overflow!"
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
    
    # Perform multiplication with overflow checking
    # First multiplication
    mult $t0, $t1    # Multiply first two numbers
    mfhi $t4         # Get high part of result
    mflo $t3         # Get low part of result
    
    # Check for overflow in first multiplication
    bnez $t4, overflow_error
    
    # Second multiplication
    mult $t3, $t2    # Multiply result by third number
    mfhi $t4         # Get high part of result
    mflo $t3         # Get low part of result
    
    # Check for overflow in second multiplication
    bnez $t4, overflow_error
    
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
    
overflow_error:
    # Print overflow error message
    li $v0, 4
    la $a0, overflow_msg
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
# 2. Multiplication with Overflow Checking:
#    - Uses mult instead of mul for overflow detection
#    - Checks high part of result after each multiplication
#    - Handles overflow error if result is too large
#
# 3. Output:
#    - Displays the final multiplication result
#    - Shows error message if overflow occurs
#
# 4. Example:
#    Input: 2, 3, 4
#    Output: "Result of multiplication is: 24"
#
#    Input: 1000000, 1000000, 1000000
#    Output: "Error: Multiplication overflow!"
#
# Note: The program uses mult instruction
# for multiplication with overflow checking 