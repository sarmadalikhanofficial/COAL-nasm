# Reverse array (print backwards)

.data
arr: .word 1, 2, 3, 4, 5
newline: .asciiz "\n"
.text

main:
  la $t0, arr
  li $t1, 4
  mul $t1, $t1, 4
  add $t0, $t0, $t1
  li $t2, 0

loop10:
  lw $a0, 0($t0)
  li $v0, 1
  syscall

  li $v0, 4
  la $a0, newline
  syscall

  addi $t0, $t0, -4
  addi $t2, $t2, 1
  blt $t2, 5, loop10
  li $v0, 10
  syscall