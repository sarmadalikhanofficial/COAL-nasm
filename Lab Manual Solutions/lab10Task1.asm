.data
    prompt1: .asciiz "Enter first integer: "
    prompt2: .asciiz "Enter second integer: "
    greater_msg: .asciiz "First integer is greater than second integer"
    less_msg: .asciiz "First integer is less than second integer"
    equal_msg: .asciiz "Both integers are equal"
    newline: .asciiz "\n"

.text
main:
    # Print first prompt
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Read first integer
    li $v0, 5
    syscall
    move $t0, $v0    # Store first integer in $t0
    
    # Print second prompt
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Read second integer
    li $v0, 5
    syscall
    move $t1, $v0    # Store second integer in $t1
    
    # Compare integers
    beq $t0, $t1, equal    # If equal, jump to equal
    bgt $t0, $t1, greater  # If first > second, jump to greater
    
    # If we get here, first < second
    li $v0, 4
    la $a0, less_msg
    syscall
    j done
    
equal:
    li $v0, 4
    la $a0, equal_msg
    syscall
    j done
    
greater:
    li $v0, 4
    la $a0, greater_msg
    syscall
    
done:
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Exit program
    li $v0, 10
    syscall

# Explanation of the program:
# 1. Input:
#    - Takes two integers from user
#    - Stores them in $t0 and $t1
#
# 2. Comparison:
#    - Uses beq for equality check
#    - Uses bgt for greater than check
#    - If neither, then less than
#
# 3. Output:
#    - Shows appropriate message based on comparison
#
# 4. Example Usage:
#    Enter first integer: 10
#    Enter second integer: 5
#    First integer is greater than second integer
#
# Note: The program uses branch instructions
# for comparison and conditional jumps 