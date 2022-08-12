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

    # calling multiply_booth
    jal multiply_booth

    b print_result

multiply_booth:
    # load the numbers as local variables
    move $t0, $a0 # multiplier
    move $t1, $a1 # multiplicand
    sll $t1, $t1, 16 # t1 = t1 << 16 (store lower half of 32 bit register in upper half of 32 bit register)

    li $t2, 0 # set previous LSB as 0
    li $t3, 0 # current LSB
    andi $t3, $t0, 1 # t3 = n1 & 1

    li $s0, 0 # counter = 0

    while:
        beq $s0, 16, end # if counter == 16, break
        add $s0, $s0, 1 # counter++
        beq $t2, $t3, 00_11_pass # if 11 or 00 then branch 
        blt $t2, $t3, 10_pass # prev is 0, curr is 1
        b 01_pass

    end:
        li $s0, $a0 # store result in s0

    jr $ra

00_11_pass:
    # get previous LSB
    andi $t2, $t0, 1 # t2 = prev_prod & 1

    # set current LSB
    srl $t3, $t0, 1 # t3 = t0 >> 1
    andi $t3, $t0, 1 # t3 = curr_prod & 1

    b while

01_pass:
    # add multiplicand to left half of product
    add $t0, $t0, $t1 # t0 = t0 + t1

    # get previous LSB
    andi $t2, $t0, 1 # t2 = prev_prod & 1

    # set current LSB
    srl $t3, $t0, 1 # t3 = t0 >> 1
    andi $t3, $t0, 1 # t3 = curr_prod & 1

    b while

10_pass:
    # subtract multiplicand from left half of product
    sub $t0, $t0, $t1 # t0 = t0 - t1

    # get previous LSB
    andi $t2, $t0, 1 # t2 = prev_prod & 1

    # set current LSB
    srl $t3, $t0, 1 # t3 = t0 >> 1
    andi $t3, $t0, 1 # t3 = curr_prod & 1

    b while

print_result:
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    la $a0, $s0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall