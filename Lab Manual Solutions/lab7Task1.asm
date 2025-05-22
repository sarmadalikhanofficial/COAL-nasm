.data
    array: .space 40      # Array to store 10 integers (4 bytes each)
    array_size: .word 10  # Size of the array
    space: .asciiz " "    # Space character for output formatting
    newline: .asciiz "\n"
    array_msg: .asciiz "Array elements: "

.text
main:
    # Initialize array with even numbers
    la $t0, array        # Load array address
    li $t1, 0           # Initialize counter
    li $t2, 0           # Initialize even number (0)
    
init_loop:
    # Store even number in array
    sw $t2, 0($t0)      # Store current even number
    
    # Increment counter and array pointer
    addi $t1, $t1, 1    # Increment counter
    addi $t0, $t0, 4    # Move to next array position
    addi $t2, $t2, 2    # Next even number
    
    # Check if we've filled the array
    blt $t1, 10, init_loop
    
    # Print array message
    li $v0, 4
    la $a0, array_msg
    syscall
    
    # Display array elements
    la $t0, array        # Reset array pointer
    li $t1, 0           # Reset counter
    
display_loop:
    # Load and print current element
    lw $a0, 0($t0)      # Load current element
    li $v0, 1           # Print integer
    syscall
    
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    
    # Increment counter and array pointer
    addi $t1, $t1, 1    # Increment counter
    addi $t0, $t0, 4    # Move to next array position
    
    # Check if we've displayed all elements
    blt $t1, 10, display_loop
    
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Exit program
    li $v0, 10
    syscall

# Explanation of the program:
# 1. Data Section:
#    - Array of 10 integers (40 bytes)
#    - Messages for output formatting
#
# 2. Initialization:
#    - Uses a loop to store even numbers (0,2,4,...)
#    - Each number is stored in consecutive array positions
#
# 3. Display:
#    - Prints all array elements with spaces between them
#    - Uses a loop to traverse the array
#
# 4. Example Output:
#    "Array elements: 0 2 4 6 8 10 12 14 16 18"
#
# Note: The program uses word-sized integers
# and proper array traversal techniques 