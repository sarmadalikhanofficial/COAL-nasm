.data
    array: .word 0, 2, 4, 6, 8, 10, 12, 14, 16, 18  # Array with 10 even numbers
    array_size: .word 10                            # Size of the array
    prompt: .asciiz "Enter a number to store at index 3: "
    array_msg: .asciiz "Array after modification: "
    space: .asciiz " "
    newline: .asciiz "\n"

.text
main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Read user input
    li $v0, 5
    syscall
    move $t0, $v0    # Store input value in $t0
    
    # Calculate address of 3rd index (3 * 4 bytes)
    la $t1, array    # Load base address of array
    li $t2, 3        # Load index (3)
    mul $t2, $t2, 4  # Multiply index by 4 (word size)
    add $t1, $t1, $t2 # Add offset to base address
    
    # Store user input at 3rd index
    sw $t0, 0($t1)   # Store word at calculated address
    
    # Print array message
    li $v0, 4
    la $a0, array_msg
    syscall
    
    # Display array elements
    la $t1, array    # Reset array pointer
    li $t2, 0        # Initialize counter
    
display_loop:
    # Load and print current element
    lw $a0, 0($t1)   # Load current element
    li $v0, 1        # Print integer
    syscall
    
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    
    # Increment counter and array pointer
    addi $t2, $t2, 1 # Increment counter
    addi $t1, $t1, 4 # Move to next array position
    
    # Check if we've displayed all elements
    blt $t2, 10, display_loop
    
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Exit program
    li $v0, 10
    syscall

# Explanation of the program:
# 1. Data Section:
#    - Pre-initialized array with 10 even numbers
#    - Messages for input and output formatting
#
# 2. User Input:
#    - Prompts user for a number
#    - Stores input at index 3
#
# 3. Array Display:
#    - Shows all array elements after modification
#    - Uses a loop to traverse the array
#
# 4. Example Usage:
#    Enter a number to store at index 3: 99
#    Array after modification: 0 2 4 99 8 10 12 14 16 18
#
# Note: The program modifies the array at index 3
# and displays the entire array to show the change 