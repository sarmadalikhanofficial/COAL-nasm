.data
    array: .word 0, 2, 4, 6, 8, 10, 12, 14, 16, 18  # Array with 10 even numbers
    array_size: .word 10                            # Size of the array
    index_msg: .asciiz "Value at index 5 is: "
    newline: .asciiz "\n"

.text
main:
    # Calculate address of 5th index (5 * 4 bytes)
    la $t0, array        # Load base address of array
    li $t1, 5           # Load index (5)
    mul $t1, $t1, 4     # Multiply index by 4 (word size)
    add $t0, $t0, $t1   # Add offset to base address
    
    # Load value at 5th index
    lw $t2, 0($t0)      # Load word at calculated address
    
    # Print message
    li $v0, 4
    la $a0, index_msg
    syscall
    
    # Print value
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

# Explanation of the program:
# 1. Data Section:
#    - Pre-initialized array with 10 even numbers
#    - Messages for output formatting
#
# 2. Index Calculation:
#    - Base address + (index * 4)
#    - 4 bytes per word in MIPS
#
# 3. Output:
#    - Displays value at index 5
#
# 4. Example Output:
#    "Value at index 5 is: 10"
#
# Note: Array indices start at 0, so index 5
# is the 6th element in the array 