    .globl main

    .data
    # display messages
prompt1:
    .asciiz "Enter a positive integer: "
prompt_perfect:
    .asciiz "Entered number is a perfect number."
prompt_not_perfect:
    .asciiz "Entered number is not a perfect number."
prompt_error:
    .asciiz "Entered number is less than 0."
newline:
    .asciiz "\n"

    .text
main:
    # displaying message to prompt the user to enter the value of n
    li $v0, 4
    la $a0, prompt1
    syscall

    # taking the value of n as input
    li $v0, 5
    syscall
    move $s0, $v0 # n = $v0

    ble $s0, 0, error_terminate # if n<=0 throw error

    li $s1, 1 # sum = 1
    li $s2, 2 # i = 2

while:
    mul $s5, $s2, $s2 # temp = i*i
    bgt $s5, $s0, check_perfect # if temp > n branch to check_perfect

    # logic to implement mod
    div $s0, $s2 # n / i
    mfhi $s3 # rem = $hi
    mflo $s4 # quo = $lo
    beq $s3, 0, if_factor # if rem == 0 branch to if_factor
    b update_i

update_i:
    add $s2, $s2, 1 # i = i+1
    b while

if_factor:
    bne $s5, $s0, update_sum_1
    beq $s5, $s0, update_sum_2
    b update_i

update_sum_1:
    add $s1, $s1, $s2 # sum = sum + i
    add $s1, $s1, $s4 # sum = sum + n/i
    b update_i

update_sum_2:
    add $s1, $s1, $s2 # sum = sum+i
    b update_i

check_perfect:
    bne $s1, $s0, is_not_perfect # if sum != n then not perfect
    bne $s0, 1, is_perfect # if n != 1 then perfect
    beq $s0, 1, is_not_perfect # if n == 1 then not perfect

# displaying message when the n is a perfect number
is_perfect:
    li $v0, 4
    la $a0, prompt_perfect
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 10
    syscall

# displaying message when n is not a perfect number
is_not_perfect:
    li $v0, 4
    la $a0, prompt_not_perfect
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 10
    syscall

# displaying error when the value of n is negative
error_terminate:
    li $v0, 4
    la $a0, prompt_error
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 10
    syscall