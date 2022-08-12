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

#hello