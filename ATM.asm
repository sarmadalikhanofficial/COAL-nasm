.data
prompt1:    .asciiz "Welcome to the ATM.\n"
menu:       .asciiz "\nMenu: \n1. Check Balance\n2. Deposit Money\n3. Withdraw Money\n4. Exit\nEnter your choice: "
balanceMsg: .asciiz "Your balance is: $"
depositMsg: .asciiz "Enter amount to deposit: "
withdrawMsg: .asciiz "Enter amount to withdraw: "
goodbye:    .asciiz "\nThank you for using the ATM. Goodbye!\n"
insufficient_funds: .asciiz "\nError: Insufficient funds! Please check your balance.\n"

.text
.globl main

main:
    # Initialize balance to $1000 (you can change this value)
    li $t0, 1000             # $t0 = balance

loop:
    # Print ATM welcome message
    li $v0, 4
    la $a0, prompt1
    syscall

    # Print the menu
    li $v0, 4
    la $a0, menu
    syscall

    # Get user's choice
    li $v0, 5
    syscall
    move $t1, $v0            # Store the choice in $t1

    # Handle menu options
    beq $t1, 1, check_balance
    beq $t1, 2, deposit_money
    beq $t1, 3, withdraw_money
    beq $t1, 4, exit_program

    # If invalid choice, go back to the menu
    j loop

check_balance:
    # Print balance message
    li $v0, 4
    la $a0, balanceMsg
    syscall

    # Print balance
    li $v0, 1
    move $a0, $t0
    syscall

    # Go back to menu
    j loop

deposit_money:
    # Print deposit message
    li $v0, 4
    la $a0, depositMsg
    syscall

    # Get deposit amount
    li $v0, 5
    syscall
    move $t2, $v0            # Store deposit amount in $t2

    # Add deposit amount to balance
    add $t0, $t0, $t2

    # Go back to menu
    j loop

withdraw_money:
    # Print withdraw message
    li $v0, 4
    la $a0, withdrawMsg
    syscall

    # Get withdrawal amount
    li $v0, 5
    syscall
    move $t2, $v0            # Store withdrawal amount in $t2

    # Check if sufficient balance is available
    blt $t2, $t0, sufficient_balance
    # If not enough balance, print error and return to menu
    li $v0, 4
    la $a0, insufficient_funds
    syscall
    j loop

sufficient_balance:
    # Subtract withdrawal amount from balance
    sub $t0, $t0, $t2

    # Go back to menu
    j loop

exit_program:
    # Print goodbye message
    li $v0, 4
    la $a0, goodbye
    syscall

    # Exit the program
    li $v0, 10
    syscall