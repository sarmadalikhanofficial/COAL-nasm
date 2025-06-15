# code from .ppt

.data
array:  .space 20            	 # Reserve 20 bytes (5 integers, 4 bytes each)
newline: .asciiz "\n"     	 # Newline string for printing

.text
main:
    # Store numbers in the array
    li   $t0, 5                       	# Number of elements to store (5 numbers)
    la   $t1, array               	# Load address of array into $t1 (array base address)
    
    # Store 5 numbers in the array
    li   $t2, 10                  	 # Load first number (10) into $t2
    sw   $t2, 0($t1)          	 # Store 10 at the first location in array
    li   $t2, 20                  	 # Load second number (20) into $t2
    sw   $t2, 4($t1)          	 # Store 20 at the second location in array
    li   $t2, 30                  	 # Load third number (30) into $t2
    sw   $t2, 8($t1)         	 # Store 30 at the third location in array
    li   $t2, 40                	 # Load fourth number (40) into $t2
    sw   $t2, 12($t1)      	 # Store 40 at the fourth location in array
    li   $t2, 50                	 # Load fifth number (50) into $t2
    sw   $t2, 16($t1)      	 # Store 50 at the fifth 

        # Print the numbers from the array
    li   $t0, 0        # Reset loop counter $t0 to 0
    la   $t1,  array    # Reload base address of array into $t1

print_loop:
    # Load the current number from the array
    lw   $a0, 0($t1)   # Load the value from the current array location into $a0

    # Print the number (system call for print_int)
    li   $v0, 1        # System call code for print_int
    syscall

    # Print a newline after each number
    li   $v0, 4        # System call code for print_string
    la   $a0, newline  # Load address of newline string into $a0
    syscall

    # Move to the next element in the array
    addi $t1, $t1, 4   # Move the array pointer to the next word (4 bytes)

    # Increment the loop counter
    addi $t0, $t0, 1   # Increment loop counter

    # Check if we've printed all 5 numbers
    li   $t2, 5        # Load number of elements (5) into $t2
    blt  $t0, $t2, print_loop  # If counter < 5, repeat the loop

    li   $v0, 10       # System call code for exit
    syscall

