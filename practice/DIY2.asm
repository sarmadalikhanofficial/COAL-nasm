.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
add_msg: .asciiz "Addition: "
mul_msg: .asciiz "Multiplication: "
div_msg: .asciiz "Division: "
sub_msg: .asciiz "Subtraction: "
nl: .asciiz "\n"

.text
.globl main
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 6
        syscall
        mov.s $f2, $f0
        
        #add
        add.s $f3, $f1, $f2
        li $v0, 4
        la $a0, add_msg
        syscall
        mov.s $f12, $f3
        li $v0, 2
        syscall
        
        li $v0, 4
        la $a0, nl
	syscall
	
	#mul
	mul.s $f3, $f1, $f2
        li $v0, 4
        la $a0, mul_msg
        syscall
        mov.s $f12, $f3
        li $v0, 2
        syscall
        
        li $v0, 4
        la $a0, nl
	syscall
	
	#div
	div.s $f3, $f1, $f2
        li $v0, 4
        la $a0, div_msg
        syscall
        mov.s $f12, $f3
        li $v0, 2
        syscall
        
        li $v0, 4
        la $a0, nl
	syscall
        
        #sub
	sub.s $f3, $f1, $f2
        li $v0, 4
        la $a0, sub_msg
        syscall
        mov.s $f12, $f3
        li $v0, 2
        syscall
        
        
        li $v0, 4
        la $a0, nl
	syscall
