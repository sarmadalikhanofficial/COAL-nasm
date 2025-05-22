.data
    num: .word 10          # Initial value set to 10
    newline: .asciiz "\n"
    space: .asciiz " "

.text
main:
    # Load initial value
    lw $t0, num           # Load num into $t0
    
while_loop:
    # Check if num > 0
    blez $t0, end_loop    # If num <= 0, exit loop
    
    # Print current value
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    
    # Decrement by 1
    subi $t0, $t0, 1      # num = num - 1
    
    # Jump back to start of loop
    j while_loop
    
end_loop:
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Exit program
    li $v0, 10
    syscall

# Explanation of the program:
# 1. Initialization:
#    - Sets num to 10
#    - Loads value into $t0
#
# 2. While Loop:
#    - Checks if num > 0
#    - Prints current value
#    - Decrements by 1
#
# 3. Output:
#    - Prints numbers with spaces between
#    - Ends with newline
#
# 4. Example Output:
#    10 9 8 7 6 5 4 3 2 1
#
# Note: The program starts from 10
# and decrements by 1 in each iteration 