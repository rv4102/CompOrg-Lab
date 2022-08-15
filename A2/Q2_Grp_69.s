# Assignment 2
# Question 2 (Implement Bubble Sort in MIPS)
# Sem 5 (Autumn 22-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

    .globl main
    .data

array: .space 40
newline:
    .asciiz "\n"
tab:
    .asciiz " "
prompt1: 
    .asciiz "Enter the array elements: "

    .text
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    la $t1, array
    li $s1, 10
    li $s2, 0

read_input:
    # addi $sp, $sp, -4
    # li $v0, 5
    # syscall

    # mul $t4, $t4, 4
    # beq $t0, $t4, function_end

    # sw $v0, array($t0)
    # addi $t0, $t0,  4
    # addi $sp, $sp, 4
    # j read_input

    beq $s1, $s2, sort_array
    li $v0, 5
    syscall
    # add $t1, $t0, $zero
    # sll $t1, $t0, 2
    # add $t3, $v0, $zero
    sw $v0, array ($t1)
    addi $t1, $t1, 4
    addi $s2, $s2, 1
    j read_input
    # slt $t1, $s0, $t0
    # beq $t1, $zero, read_input

sort_array:
    la $s0, array
    li $t0, 0
    li $t1, 0
    li $s1, 11
    li $s2, 11
    add $t2, $zero, $s0
    add $t3, $zero, $s0
    addi $s1, $s1, -1

# loop1:
#     li $t1, 0
#     addi $s2, $s2, -1
#     add $t3, $zero, $s0

# loop2:
#     lw $s3, array ($t3)
#     addi $t3, $t3, 4
#     lw $s4, array ($t3)
#     addi $t1, $t1, 1
#     slt $t4, $s3, $s4
#     bne $t4, $zero, move_to_loop2

# swap:
#     sw $s3, array ($t3)
#     sw $s4, -4($t3)
#     lw $s4, array ($t3)

# move_to_loop2:
#     bne $t1, $s2, loop2

# addi $t0, $t0, 1
# bne $t0, $s1, loop1
# li $t0, 0
# addi $s1, $s1, 1

printing_sorted_arr:
    li $v0, 1
    lw $s0, array ($t2)
    syscall
    li $v0, 4
    la $a0, tab
    syscall
    addi $t2, $t2, 4
    addi $t0, $t0,1
    bne $t0, $s1, printing_sorted_arr

li $v0, 10
syscall

