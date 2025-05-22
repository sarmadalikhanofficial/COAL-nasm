.data
prompt_int: .asciiz "Enter an integer: "
prompt_float: .asciiz "Enter a floating-point number: "
equal_msg: .asciiz "The numbers are equal"
int_greater_msg: .asciiz "The integer is greater"
float_greater_msg: .asciiz "The floating-point number is greater"
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
    
    # Check which is greater
    c.lt.s $f0, $f1  # Check if float1 > float2
    bc1t float_greater
    
    # If we get here, integer is greater
    li $v0, 4
    la $a0, int_greater_msg
    syscall
    j done
    
equal:
    li $v0, 4
    la $a0, equal_msg
    syscall
    j done
    
float_greater:
    li $v0, 4
    la $a0, float_greater_msg
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
#    - Uses c.eq.s for equality check
#    - Uses c.lt.s for less than check
#    - Shows which number is greater
#
# 4. Example Usage:
#    Enter an integer: 5
#    Enter a floating-point number: 6.5
#    The floating-point number is greater
#
# Note: The program uses floating-point
# coprocessor instructions for comparison 