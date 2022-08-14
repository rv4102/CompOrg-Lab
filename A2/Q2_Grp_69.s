# Assignment 2
# Question 1 (Implement Booth's Algorithm in MIPS)
# Sem 5 (Autumn 22-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

    .globl main
    .data

array: .space 40
newline:
    .asciiz "\n"
prompt1: 
    .asciiz "Enter the array elements: "

    .text
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    j read_input

sort_array:
    la $t1, array
    li $s1, 10

first_loop:
    beq $s1, $s2, 

read_input:
    addi $sp, $sp, -4
    li $v0, 5
    syscall

    mul $t4, $t4, 4
    beq $t0, $t4, function_end

    sw $v0, array($t0)
    addi $t0, $t0,  4
    addi $sp, $sp, 4
    j read_input

function_end:
    jr $ra