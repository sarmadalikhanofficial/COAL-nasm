# Ask user for 3 numbers → Add them → Show sum

.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
msg3: .asciiz "Enter third number: "
add_msg: .asciiz "Addition: "
nl: .asciiz "\n"

.text
.globl main
main:
	# Input 1
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6        # read float
	syscall
	mov.s $f1, $f0   # store in $f1
	
	# Input 2
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0   # store in $f2
	
	# Input 3
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 6
	syscall
	mov.s $f3, $f0   # store in $f3
	
	# Addition: $f4 = $f1 + $f2 + $f3
	add.s $f4, $f1, $f2
	add.s $f4, $f4, $f3
	
	# Show "Addition:"
	li $v0, 4
	la $a0, add_msg
	syscall
	
	# Show result
	mov.s $f12, $f4
	li $v0, 2
	syscall
	
	# New line
	li $v0, 4
	la $a0, nl
	syscall
