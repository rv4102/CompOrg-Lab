# Assignment 2
# Question 1 (Implement Booth's Algorithm in MIPS)
# Sem 5 (Autumn 22-23)
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
    .asciiz "Given input is not within range of 16-bit integers.\n"
result:
    .asciiz "Product of the two numbers are: "
newline:
    .asciiz "\n"

# .text for logic implementation
    .text
main:
    # display prompt to enter 1st int
    li      $v0, 4
    la      $a0, prompt1
    syscall

    # take input
    li      $v0, 5
    syscall
    move    $s0, $v0

    # check input
    bgt     $s0, 32767, print_err
    blt     $s0, -32768, print_err

    # display prompt to enter 2nd int
    li      $v0, 4
    la      $a0, prompt2
    syscall

    # take input
    li      $v0, 5
    syscall
    move    $s1, $v0

    # check input
    bgt     $s1, 32767, print_err
    blt     $s1, -32768, print_err

    # store inputs in a0 and a1 registers for function call
    move    $a0, $s0
    move    $a1, $s1

    # calling multiply_booth
    jal     multiply_booth

    # store result in $s0 register
    move    $s0, $v0

    b       print_result

multiply_booth:
    # let $a0 be Q
    # let $a1 be M

    move    $v0, $zero # set $v0 as 0
    
    li      $t5, 1 # make temp = 1
    sll     $t5, $t5, 16 # left shift by 16 bits now temp = 2^16
    sub     $t5, $t5, 1 # temp-- (now temp has upper 16 bits as 0 and lower 16 bits as 1)
    and     $a0, $a0, $t5 # mask a0 with temp
    sll     $a1, $a1, 16 # num2 = num2 << 16 (store lower half of 32 bit register in upper half of 32 bit register)

    li      $t2, 0 # set previous LSB as 0
    li      $t3, 0 # current LSB
    andi    $t3, $a0, 1 # t3 = num1 & 1

    li      $t4, 0 # counter = 0

    while:
        beq     $t4, 16, end # if counter == 16, break
        add     $t4, $t4, 1 # counter++
        beq     $t2, $t3, pass_11_00 # if 11 or 00 then go to pass_11_00 
        blt     $t2, $t3, pass_10 # if prev is 0, curr is 1 then go to pass_10
        b       pass_01 # else go to pass_01

    end:
        move    $v0, $a0

    jr      $ra

pass_11_00:
    # get previous LSB
    andi    $t2, $a0, 1 # t2 = prev_prod & 1

    # set current LSB
    sra     $a0, $a0, 1 # t3 = t0 >> 1
    andi    $t3, $a0, 1 # t3 = curr_prod & 1

    b       while

pass_01:
    # add multiplicand to left half of product
    add     $a0, $a0, $a1 # t0 = t0 + t1

    # get previous LSB
    andi    $t2, $a0, 1 # t2 = prev_prod & 1

    # set current LSB
    sra     $a0, $a0, 1 # t3 = t0 >> 1
    andi    $t3, $a0, 1 # t3 = curr_prod & 1

    b       while

pass_10:
    # subtract multiplicand from left half of product
    sub     $a0, $a0, $a1 # t0 = t0 - t1

    # get previous LSB
    andi    $t2, $a0, 1 # t2 = prev_prod & 1

    # set current LSB
    sra     $a0, $a0, 1 # t3 = t0 >> 1
    andi    $t3, $a0, 1 # t3 = curr_prod & 1

    b       while

print_result:
    li      $v0, 4
    la      $a0, result
    syscall

    li      $v0, 1
    move    $a0, $s0
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10
    syscall

print_err:
    li      $v0, 4
    la      $a0, prompt_err
    syscall

    li      $v0, 10
    syscall