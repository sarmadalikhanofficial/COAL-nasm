.data
array: .space 40
newline: .asciiz "\n"

.text
.globl main 

main:
	li $t0, 0
	la $t1, array
	li $t2, 10

init_loop:
	addi $t3, $t0, 1   # $t3 = $t0 + 1 (i.e., 1 to 10)
	sw $t3, 0($t1)	
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	blt $t0, $t2, init_loop

	li $t0, 0
	la $t1, array
	
print_loop:
	lw $a0, 0($t1)
	li $v0, 1
	syscall
	
	li $v0, 4
	la, $a0, newline
	syscall
	
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	blt $t0, $t2, print_loop
	
	li $v0, 10
	syscall
	
	