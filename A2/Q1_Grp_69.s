# Assignment 2
# Question 1
# Sem 5
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

    .globl main

# .data to store the display messages in variables
    .data
# display messages
prompt1:
    .asciiz "Enter first number: "
prompt2:
    .asciiz "Enter second number: "
prompt_err:
    .asciiz "Given input is not within range of 16-bit integers."
result:
    .asciiz "Product of the two numbers are: "
newline:
    .asciiz "\n"

# .text for logic implementation
    .text
main:
    # display prompt to enter 1st int
    li $v0, 4
    la $a0, prompt1
    syscall

    # take input
    li $v0, 5
    syscall
    move $s0, $v0

    # check input
    bgt $s0, 32767, prompt_err

    # display prompt to enter 2nd int
    li $v0, 4
    la $a0, prompt2
    syscall

    # take input
    li $v0, 5
    syscall
    move $s1, $v0

    # check input
    blt $s1, -32768, prompt_err

    # store inputs in a0 and a1 registers for function call
    move $a0, $s0
    move $a1, $s1

    #calling multiply_booth
    jal multiply_booth

multiply_booth:
    # load the numbers as local variables
    move $t0, $a0 # multiplier
    move $t1, $a1 # multiplicand
    sll $t1, $t1, 16 # t1 = t1 << 16 (store lower half of 32 bit register in upper half of 32 bit register)

    li $t2, 0 # set previous LSB as 0
    li $t3, 0 # current LSB
    # get current LSB
    div $t0, 2 # n1 mod 2
    mfhi $t3 # move remainder to $t3

    

    jr $ra

while:


00_pass:
    # get previous LSB
    div $t0, 2 # n1 mod 2
    mfhi $t2 # store previous LSB

    # set current LSB
    srl $t3, $t0, 1 # t3 = t0 >> 1
    div $t0, 2 # n1 mod 2
    mfhi $t3 # store current LSB

11_pass:
    # get previous LSB
    div $t0, 2 # n1 mod 2
    mfhi $t2 # store previous LSB

    # set current LSB
    srl $t3, $t0, 1 # t3 = t0 >> 1
    div $t0, 2 # n1 mod 2
    mfhi $t3 # store current LSB

01_pass:
    # add multiplicand to left half of product
    add $t0, $t0, $t1 # t0 = t0 + t1

    # get previous LSB
    div $t0, 2 # n1 mod 2
    mfhi $t2 # store previous LSB

    # set current LSB
    srl $t3, $t0, 1 # t3 = t0 >> 1
    div $t0, 2 # n1 mod 2
    mfhi $t3 # store current LSB
    j 

10_pass:
    # subtract multiplicand from left half of product
    sub $t0, $t0, $t1 # t0 = t0 - t1

    # get previous LSB
    div $t0, 2 # n1 mod 2
    mfhi $t2 # store previous LSB

    # set current LSB
    srl $t3, $t0, 1 # t3 = t0 >> 1
    div $t0, 2 # n1 mod 2
    mfhi $t3 # store current LSB