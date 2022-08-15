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
prompt2:
    .asciiz "Enter k:"
prompt3:
    .asciiz "Sorted array: "
prompt4:
    .asciiz "value of k is out of bounds"
prompt5:
    .asciiz "kth largest number is: "
prompt6:
    .asciiz "done"
prompt7:
    .asciiz "reading done"

    .text
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    # la $t1, array
    # li $s1, 10
    # li $s2, 0
    li $s1, 10
    jal read

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall

    move $s2, $v0
    bgt $s2, $s1, error_k_value
    ble $s2, 0, error_k_value
 
    li $v0, 4
    la $a0, prompt7
    syscall
    ######
    # la $a0, array
    # move $a1, $s1
    # jal printing_sorted_arr
    ####
    la $a0, array
    move $a1, $s1

    jal sort_array

    li $v0, 4
    la $a0, prompt3
    syscall

    la $a0, array
    move $a1, $s1
    jal printing_sorted_arr

    li $v0, 4
    la $a0, prompt5
    syscall    

    sub $t1, $s1, $s2
    sll $t1, $t1, 2
    lw $t2, array($t1)

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

read:
    li $t1, 0
    b read_input

read_input:
    li $v0, 5
    syscall
    
    sw $v0, array ($t1)
    addi $t1, $t1, 4
    
    bne $t1, 40, read_input
    jr $ra
    # slt $t1, $s0, $t0
    # beq $t1, $zero, read_input

sort_array:
    li $t0, 1
    j loop_condition

loop_start:
    sll $t4, $t0, 2
    add $t4, $a0, $t4
    lw $t3, 0($t4)
    addi $t1, $t0, -1
    j loop2

swap:
    sll $t4, $t1, 2
    add $t4, $a0, $t4
    lw $t2, 0($t4)
    addi $t4, $t4, 4
    sw $t2, 0($t4)
    addi $t1, $t1, -1

loop2:
    # lw $s3, 0 ($t3)
    # addi $t3, $t3, 4
    # lw $s4, 0 ($t3)
    # addi $t1, $t1, 1
    # slt $t4, $s3, $s4
    # bne $t4, $zero, move_to_loop2
    blt $t1, $zero, loop3
    sll $t4, $t1, 2
    add $t4, $a0, $t4
    lw $t2, 0($t4)
    bgt $t2, $t3, swap

loop3:
    add $t4, $t1, 1
    sll $t4, $t4, 2
    add $t4, $a0, $t4
    sw $t3, 0($t4)
    addi $t0, $t0, 1

loop_condition:
    blt $t0,  $a1, loop_start
    li $v0, 4
    la $a0, prompt6
    syscall

    jr $ra
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
error_k_value:
    li $v0, 4
    la $a0, prompt4
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 10
    syscall

printing_sorted_arr:
    li $t0, 0
    li $t1, 0
while_print:
    bge $t0, $a1, while_print_terminate
    lw $t2, array($t1)
    addi $t1, $t1, 4

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, tab
    syscall

    addi $t0, $t0, 1
    j while_print

while_print_terminate:
    li $v0, 4
    la $a0, newline
    syscall
    jr $ra

