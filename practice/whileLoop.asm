.data 
num: .word 0             # Start with 1 instead of 10

.text
.globl main 
main: 
    la $t0, num          # Load address of num into $t0
    lw $t0, 0($t0)       # Load value of num into $t0

while: 
    bgt $t0, 10, end_while  # If $t0 > 5, jump to end_while

    li $v0, 1            # Load syscall code for print integer (1) into $v0
    move $a0, $t0        # Move value of $t0 (num) into $a0 (argument for syscall)
    syscall              # Make the system call to print the value in $a0

    add $t0, $t0, 1      # Increment $t0 by 1
    j while              # Jump back to the while loop

end_while: 
    li $v0, 10           # Load syscall code for exit (10) into $v0
    syscall              # Make the system call to exit the program
