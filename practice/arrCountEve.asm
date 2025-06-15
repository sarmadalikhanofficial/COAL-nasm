# Count even numbers

.data
arr: .word 1, 2, 3, 4, 5
.text

main:
  la $t0, arr
  li $t1, 0
  li $t2, 0

loop9:
  lw $t3, 0($t0)
  rem $t4, $t3, 2
  beqz $t4, even
  j skip9

even:
  addi $t2, $t2, 1

skip9:
  addi $t0, $t0, 4
  addi $t1, $t1, 1
  blt $t1, 5, loop9
  move $a0, $t2
  li $v0, 1
  syscall
  li $v0, 10
  syscall
