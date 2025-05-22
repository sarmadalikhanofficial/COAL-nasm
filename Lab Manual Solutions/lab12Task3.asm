.data
    prompt: .asciiz "Enter a number to calculate factorial: "
    result_msg: .asciiz "Factorial: "
    steps_msg: .asciiz ", Steps: "
    error_msg: .asciiz "Error: Cannot calculate factorial of negative number"
    newline: .asciiz "\n"

.text
main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Read number
    li $v0, 5
    syscall
    move $t0, $v0    # Store input in $t0
    
    # Check for negative number
    bltz $t0, error  # If number < 0, show error
    
    # Check for zero
    beqz $t0, zero_case
    
    # Initialize factorial calculation
    li $t1, 1        # Initialize result to 1
    li $t2, 1        # Initialize counter to 1
    li $t3, 0        # Initialize step counter to 0
    
factorial_loop:
    # Check if we've reached the input number
    bgt $t2, $t0, print_result
    
    # Multiply result by counter
    mul $t1, $t1, $t2
    
    # Increment step counter
    addi $t3, $t3, 1
    
    # Increment counter
    addi $t2, $t2, 1
    
    # Continue loop
    j factorial_loop
    
zero_case:
    # Set result to 1 for input 0
    li $t1, 1
    li $t3, 0        # No steps for zero
    j print_result
    
print_result:
    # Print result message
    li $v0, 4
    la $a0, result_msg
    syscall
    
    # Print factorial
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Print steps message
    li $v0, 4
    la $a0, steps_msg
    syscall
    
    # Print step count
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
    
error:
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
#    - Takes a number from user
#    - Checks if number is negative
#    - Special handling for zero
#
# 2. Factorial Calculation:
#    - Returns 1 for input 0
#    - Uses loop for other numbers
#    - Counts multiplication steps
#
# 3. Output:
#    - Shows factorial result
#    - Shows number of steps
#    - Shows error for negative numbers
#
# 4. Example Usage:
#    Enter a number to calculate factorial: 4
#    Factorial: 24, Steps: 4
#
#    Enter a number to calculate factorial: 0
#    Factorial: 1, Steps: 0
#
# Note: The program counts and displays
# the number of multiplication steps 