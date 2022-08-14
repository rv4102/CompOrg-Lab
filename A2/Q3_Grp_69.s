# Assignment 2
# Question 3 (Implementation of matrix print & transpose operations in MIPS)
# Sem 5 (Autumn 22-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

    .globl main

# .data to store the display messages in variables
    .data
# display messages
prompt_m:
    .asciiz "Enter value of m: "
prompt_n:
    .asciiz "Enter value of n: "
prompt_a:
    .asciiz "Enter value of a: "
prompt_r:
    .asciiz "Enter value of r: "
prompt_err:
    .asciiz "Given input is not within range of 16-bit integers.\n"
result_a:
    .asciiz "The elements of A are: "
result_b:
    .asciiz "The elements of B are: "
newline:
    .asciiz "\n"

# .text for logic implementation
    .text
main:
    # display prompt to enter 1st int
    li      $v0, 4
    la      $a0, prompt1
    syscall

    # take 1st input
    li      $v0, 5
    syscall
    move    $s0, $v0 # $s0 stores the first input number (m)

    # display prompt to enter 2nd int
    li      $v0, 4
    la      $a0, prompt2
    syscall

    # take 2nd input
    li      $v0, 5
    syscall
    move    $s1, $v0 # $s1 stores the first input number (n)

    # display prompt to enter 1st int
    li      $v0, 4
    la      $a0, prompt1
    syscall

    # take 3rd input
    li      $v0, 5
    syscall
    move    $s0, $v0 # $s0 stores the first input number (a)

    # display prompt to enter 4th int
    li      $v0, 4
    la      $a0, prompt1
    syscall

    # take 4th input
    li      $v0, 5
    syscall
    move    $s0, $v0 # $s0 stores the first input number (r)

    