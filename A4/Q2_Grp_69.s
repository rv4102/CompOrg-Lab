# Assignment 4
# Question 1 (MIPS program to calculate determinant of a matrix)
# Sem 5 (Autumn 2022-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

    .data
array .space 40

prompt_enter:
    .asciiz "Enter an integer: "
newline: 
    .asciiz "\n"
prompt_space:
    .asciiz " "
prompt_sorted:
    .asciiz "Sorted Array: "

    .text
.globl main
main:
    li %s0, 10
    jal read_input
    

read_input:
    li $t0, 0
    b read_loop

read_loop:
    li $v0,  4
    la $a0, prompt_enter
    syscall
    li $v0, 5
    syscall
    sw $v0, array($t0)
    addi $t0, $t0, 4
    slti $t1, $t0, 40
    beq $t1, 1, read_loop
    jr $ra


