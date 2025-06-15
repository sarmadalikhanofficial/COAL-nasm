# Find the largest number

.data
arr: .word 3, 9, 2, 7, 10
.text

main:
  la $t0, arr
  lw $t1, 0($t0)
  li $t2, 1
  addi $t0, $t0, 4

loop7:
  lw $t3, 0($t0)
  bgt $t3, $t1, update
  j skip

update:
  move $t1, $t3

skip:
  addi $t0, $t0, 4
  addi $t2, $t2, 1
  blt $t2, 5, loop7
  move $a0, $t1
  li $v0, 1
  syscall
  li $v0, 10
  syscall
