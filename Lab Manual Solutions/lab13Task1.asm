.data
    prompt: .asciiz "Enter a number (0 to end): "
    sum_msg: .asciiz "Total Sum: "
    avg_msg: .asciiz ", Average: "
    newline: .asciiz "\n"

.text
main:
    # Initialize registers
    li $t0, 0        # Sum
    li $t1, 0        # Count
    
input_loop:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Read number
    li $v0, 5
    syscall
    move $t2, $v0    # Store input in $t2
    
    # Check if input is 0
    beqz $t2, calculate_avg
    
    # Add to sum
    add $t0, $t0, $t2
    
    # Increment count
    addi $t1, $t1, 1
    
    # Continue loop
    j input_loop
    
calculate_avg:
    # Check if any numbers were entered
    beqz $t1, no_numbers
    
    # Calculate average
    div $t0, $t1     # Divide sum by count
    mflo $t3         # Get quotient (average)
    
    # Print sum message
    li $v0, 4
    la $a0, sum_msg
    syscall
    
    # Print sum
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Print average message
    li $v0, 4
    la $a0, avg_msg
    syscall
    
    # Print average
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
    
no_numbers:
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Exit program
    li $v0, 10
    syscall

# Explanation of the program:
# 1. Input:
#    - Takes numbers until 0 is entered
#    - Keeps track of sum and count
#
# 2. Calculation:
#    - Calculates sum as numbers are entered
#    - Calculates average at the end
#
# 3. Output:
#    - Shows total sum
#    - Shows average
#
# 4. Example Usage:
#    Enter a number (0 to end): 5
#    Enter a number (0 to end): 10
#    Enter a number (0 to end): 15
#    Enter a number (0 to end): 0
#    Total Sum: 30, Average: 10
#
# Note: The program handles the case
# where no numbers are entered 