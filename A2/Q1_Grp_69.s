# Assignment 2
# Question 1 (Implement Booth's Algorithm in MIPS)
# Sem 5 (Autumn 2022-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

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
.globl main
main:
    # display prompt to enter 1st int
    li      $v0, 4
    la      $a0, prompt1
    syscall

    # take 1st input
    li      $v0, 5
    syscall
    move    $s0, $v0 # $s0 stores the first input number

    # check input
    bgt     $s0, 32767, print_err
    blt     $s0, -32768, print_err

    # display prompt to enter 2nd int
    li      $v0, 4
    la      $a0, prompt2
    syscall

    # take 2nd input
    li      $v0, 5
    syscall
    move    $s1, $v0 # $s1 stores the first input number

    # check input
    bgt     $s1, 32767, print_err
    blt     $s1, -32768, print_err

    # if both inputs are INT_MIN
    beq     $s0, -32768, check_2
    bne     $s0, -32768, continue_1

check_2:
    beq     $s1, -32768, edge_handling

continue_1:
    # store the smaller in $s0
    blt		$s1, $s0, swap	    # if $s0 < $s1 then swap
    bge		$s1, $s0, continue_2	# if $s1 >= $s0 then continue
    
swap:
    move 	$t8, $s0
    move    $s0, $s1
    move    $s1, $t8

continue_2:
    # store inputs in a0 and a1 registers for function call
    move    $a0, $s0
    move    $a1, $s1

    # calling multiply_booth
    jal     multiply_booth

    # store result in $s0 register
    move    $s0, $v0

    b       print_result

edge_handling:
    li      $s0, 1073741824
    j		print_result				# jump to print_result

multiply_booth:
    # let $a0 be Multiplier (This will act as the product)
    # let $a1 be Multiplicand

    move    $v0, $zero # set $v0 as 0
    
    li      $t5, 1 # make temp = 1
    sll     $t5, $t5, 16 # left shift by 16 bits now temp = 2^16
    sub     $t5, $t5, 1 # temp-- (now temp has upper 16 bits as 0 and lower 16 bits as 1)

    and     $a0, $a0, $t5 # mask a0 with temp (upper half of $a0 is set as 0 and lower half of $a0 is the original multiplicand)
    sll     $a1, $a1, 16 # num2 = num2 << 16 (shift lower 16 bits to upper 16 bits)

    li      $t2, 0 # set previous LSB as 0
    li      $t3, 0 # current LSB
    andi    $t3, $a0, 1 # $t3 = $a0 & 1 (Get the current LSB)

    li      $t4, 0 # set counter = 0

    while:
        beq     $t4, 16, end # if counter == 16, break
        add     $t4, $t4, 1 # counter++

        beq     $t2, $t3, pass_11_00 # if 11 or 00 then go to pass_11_00 
        blt     $t2, $t3, pass_10 # if prev is 0, curr is 1 then go to pass_10
        b       pass_01 # else go to pass_01

    end:
        move    $v0, $a0 # Move product to $v0 before returning

    jr      $ra

pass_11_00:
    # get previous LSB
    andi    $t2, $a0, 1 # $t2 = prev_prod & 1

    # set current LSB
    sra     $a0, $a0, 1 # $a0 = $a0 >> 1 (Arithmetic right shift curr_prod = prev_prod >> 1)
    andi    $t3, $a0, 1 # $t3 = curr_prod & 1

    b       while

pass_01:
    # add multiplicand to left half of product
    add     $a0, $a0, $a1 # $a0 = $a0 + $a1

    # get previous LSB
    andi    $t2, $a0, 1 # $t2 = prev_prod & 1

    # set current LSB
    sra     $a0, $a0, 1 # $a0 = $a0 >> 1 (Arithmetic right shift curr_prod = prev_prod >> 1)
    andi    $t3, $a0, 1 # $t3 = curr_prod & 1

    b       while

pass_10:
    # subtract multiplicand from left half of product
    sub     $a0, $a0, $a1 # $a0 = $a0 - $a1

    # get previous LSB
    andi    $t2, $a0, 1 # $t2 = prev_prod & 1

    # set current LSB
    sra     $a0, $a0, 1 # $a0 = $a0 >> 1 (Arithmetic right shift curr_prod = prev_prod >> 1)
    andi    $t3, $a0, 1 # $t3 = curr_prod & 1

    b       while

print_err:
    # called in case of error
    li      $v0, 4
    la      $a0, prompt_err
    syscall

    j		main	# jump to main

print_result:
    # print the final result
    li      $v0, 4
    la      $a0, result
    syscall

    li      $v0, 1
    move    $a0, $s0
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10 # exit the program
    syscall