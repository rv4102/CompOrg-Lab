# Assignment 1
# Question 3
# Sem 5
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

    .globl main

    .data
# display messages. Storing them in appropriate variables.
prompt1:
    .asciiz "Enter a positive integer greater than equals to 10: "
prompt_prime:
    .asciiz "Entered number is a PRIME number."
prompt_composite:
    .asciiz "Entered number is a COMPOSITE number."
prompt_error:
    .asciiz "Entered number is less than 10."
newline:
    .asciiz "\n"

# .text to implement the working
    .text
main:
    # displaying message to prompt the user to enter the value of n
    li $v0, 4
    la $a0, prompt1
    syscall

    # taking the value of n as input
    li $v0, 5
    syscall
    move $s0, $v0 # store n in register $s0

    li $s3, 1 # flag = 1
    li $s1, 2 # i = 2

    blt $s0, 10, error_terminate # if n<10 branch to error_terminate    

while:
    mul $s2, $s1, $s1 # temp = i*i
    bgt $s2, $s0, check_prime # if temp > n branch to check_prime

    # logic to implement mod
    div $s0, $s1 # n mod i
    # rem = $hi
    mfhi $s4 # move remainder to $s4
    beq $s4, 0, valid_mod # if rem == 0 branch to valid_mod

    add $s1, $s1, 1 # i = i + 1
    b while

valid_mod:
    li $s3, 0 # flag = 0
    b check_prime

check_prime:
    beq $s3, 1, is_prime # if flag == 1, prime
    bne $s3, 1, is_composite # if flag != 1, composite

# displaying message when n is prime
is_prime:
    li $v0, 4
    la $a0, prompt_prime
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

# displaying message when n is composite
is_composite:
    li $v0, 4
    la $a0, prompt_composite
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

# displaying error message when the value of n is negative
error_terminate:
    li $v0, 4
    la $a0, prompt_error
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall