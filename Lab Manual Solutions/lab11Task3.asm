.data
    num: .word 10          # Initial value
    newline: .asciiz "\n"
    space: .asciiz " "

.text
main:
    # Load initial value
    lw $t0, num           # Load num into $t0
    
while_loop:
    # Check if num > 0
    blez $t0, end_loop    # If num <= 0, exit loop
    
    # Check if number is even
    li $t1, 2            # Load 2 for division
    div $t0, $t1         # Divide num by 2
    mfhi $t2             # Get remainder
    
    # If remainder is 0, number is even
    beqz $t2, print_num  # If even, print number
    
    # If odd, decrement and continue
    subi $t0, $t0, 1     # num = num - 1
    j while_loop
    
print_num:
    # Print current value
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    
    # Decrement by 1
    subi $t0, $t0, 1     # num = num - 1
    
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
#    - Checks if number is even using division
#    - Only prints even numbers
#
# 3. Output:
#    - Prints only even numbers with spaces between
#    - Ends with newline
#
# 4. Example Output:
#    10 8 6 4 2
#
# Note: The program uses division to check
# if a number is even before printing 