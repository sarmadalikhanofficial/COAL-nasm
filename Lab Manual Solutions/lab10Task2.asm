.data
prompt_int: .asciiz "Enter an integer: "
prompt_float: .asciiz "Enter a floating-point number: "
equal_msg: .asciiz "The numbers are equal"
not_equal_msg: .asciiz "The numbers are not equal"
newline: .asciiz "\n"

.text
.globl main
main:
    # Print integer prompt
    li $v0, 4
    la $a0, prompt_int
    syscall
    
    # Read integer
    li $v0, 5
    syscall
    move $t0, $v0    # Store integer in $t0
    
    # Convert integer to float
    mtc1 $t0, $f0    # Move integer to coprocessor 1
    cvt.s.w $f0, $f0 # Convert word to single precision float
    
    # Print float prompt
    li $v0, 4
    la $a0, prompt_float
    syscall
    
    # Read float
    li $v0, 6
    syscall
    mov.s $f1, $f0   # Store float in $f1
    
    # Compare float values
    c.eq.s $f0, $f1  # Compare floats for equality
    bc1t equal       # Branch if equal
    
    # If not equal
    li $v0, 4
    la $a0, not_equal_msg
    syscall
    j done
    
equal:
    li $v0, 4
    la $a0, equal_msg
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
#    - Takes an integer and a float from user
#    - Converts integer to float for comparison
#
# 2. Conversion:
#    - Uses mtc1 to move integer to coprocessor 1
#    - Uses cvt.s.w to convert to float
#
# 3. Comparison:
#    - Uses c.eq.s for float comparison
#    - Uses bc1t for conditional branch
#
# 4. Example Usage:
#    Enter an integer: 5
#    Enter a floating-point number: 5.0
#    The numbers are equal
#
# Note: The program uses floating-point
# coprocessor instructions for comparison 