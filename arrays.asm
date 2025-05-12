.data
array:     .space 40       # Reserve space for 10 integers (4 bytes each)
newline:   .asciiz "\n"    # Newline character

.text
.globl main

main:
    li $t0, 0              # Counter = 0
    la $t1, array          # Load address of array into $t1
    li $t2, 10             # Number of elements = 10

# Initialize loop: fill array with 2s
init_loop:
    li $t3, 2              # Value to store = 2
    sw $t3, 0($t1)         # Store value at current address
    addi $t1, $t1, 4       # Move to next word
    addi $t0, $t0, 1       # Increment counter
    blt $t0, $t2, init_loop

# Reset for printing
    li $t0, 0
    la $t1, array

# Print loop
print_loop:
    lw $a0, 0($t1)         # Load value to print
    li $v0, 1              # Print integer syscall
    syscall

    li $v0, 4              # Print newline syscall
    la $a0, newline
    syscall

    addi $t1, $t1, 4       # Move to next element
    addi $t0, $t0, 1       # Increment counter
    blt $t0, $t2, print_loop

# Exit program
    li $v0, 10
    syscall