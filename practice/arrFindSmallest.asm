# Find the smallest number

.data
arr: .word 3, 9, 2, 7, 4
.text

main:
  la $t0, arr
  lw $t1, 0($t0)
  li $t2, 1
  addi $t0, $t0, 4

loop8:
  lw $t3, 0($t0)
  blt $t3, $t1, update8
  j skip8

update8:
  move $t1, $t3

skip8:
  addi $t0, $t0, 4
  addi $t2, $t2, 1
  blt $t2, 5, loop8
  move $a0, $t1
  li $v0, 1
  syscall
  li $v0, 10
  syscall
