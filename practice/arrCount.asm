# Count numbers > 10

.data
arr: .word 5, 11, 8, 15, 3
.text

main:
  la $t0, arr
  li $t1, 0
  li $t2, 0

loop11:
  lw $t3, 0($t0)
  li $t4, 10
  bgt $t3, $t4, inc
  j skip11

inc:
  addi $t2, $t2, 1

skip11:
  addi $t0, $t0, 4
  addi $t1, $t1, 1
  blt $t1, 5, loop11
  move $a0, $t2
  li $v0, 1
  syscall
  li $v0, 10
  syscall
