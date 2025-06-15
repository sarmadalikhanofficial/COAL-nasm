.data
msg1: .asciiz "Enter First Number: "
msg2: .asciiz "Enter Second Number: "
add_msg: .asciiz "Addition :"
mul_msg: .asciiz "Multiplication: "
nl: .asciiz "\n"

.text
.globl main

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 6
	syscall
	mov.s $f4, $f0
	
	add.s $f6, $f2, $f4
	li $v0, 4
	la $a0, add_msg
	syscall
	
	mov.s $f12, $f6
	li $v0, 2
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	mul.s $f8, $f2, $f4
	li $v0, 4
	la $a0, mul_msg
	syscall
	
	mov.s $f12 , $f8
	li $v0, 2
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 10
	syscall

	
	
	
	
	
