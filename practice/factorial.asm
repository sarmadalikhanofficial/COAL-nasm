# The factorial of a non-negative integer nnn is the product of all positive integers less than or equal to nnn and is denoted as n!n!n!. By utilizing MIPS assembly language, students will gain practical experience in manipulating data and implementing iterative algorithms, thereby reinforcing their knowledge of fundamental programming constructs in assembly language. This session aims to deepen the understanding of arithmetic operations and control flow in a low-level programming environment. 
 
.data
prompt: .asciiz "Enter a number: "
result: .asciiz "Factorial: "

.text
main:
    li $v0, 4           # print prompt
    la $a0, prompt
    syscall

    li $v0, 5           # read integer
    syscall
    move $t0, $v0       # store input in $t0

    li $t1, 1           # initialize result to 1

factorial:
    ble $t0, $zero, end_factorial   # if n <= 0, end
    mul $t1, $t1, $t0               # result *= n
    subi $t0, $t0, 1                # n -= 1
    j factorial                     # loop

end_factorial:
    li $v0, 4           # print "Factorial: "
    la $a0, result
    syscall

    li $v0, 1           # print result
    move $a0, $t1
    syscall

    li $v0, 10          # exit
    syscall
