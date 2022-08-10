    .globl main

# .data to store the display messages in variables
    .data
# display messages
prompt1:
    .asciiz "Enter the first positive integer: "
prompt2:
    .asciiz "Enter the second positive integer: "
prompt3:
    .asciiz "GCD of the two integers is: "
error: 
    .asciiz "Entered integer is not positive."
newline:
    .asciiz "\n"

# .text for logic implementation
    .text
main:
    # displaying message to prompt the user to enter the first positive integer
    li $v0, 4
    la $a0, prompt1
    syscall

    # taking input for the first positive integer
    li $v0, 5
    syscall
    move $s0, $v0

    # checking whether the number taken as input is not negative
    blt $s0, 0, error_terminate

    # displaying message to prompt the user to enter the second positive integer
    li $v0, 4
    la $a0, prompt2
    syscall

    # taking input for the second positive integer
    li $v0, 5
    syscall
    move $s1, $v0

    # checking whether the number taken as input is not negative
    blt $s1, 0, error_terminate

    # if a is equal to zero, then gcd=b. So printing b
    beq $s0, 0, print_ans_b

# while loop to calculate the gcd of a and b 
while:
    #if b is equal to 0, gcd = a
    beq $s1, 0, print_ans
    #if a>b, updating a
    bgt $s0, $s1, update_a
    #if a<=b, updating b
    ble $s0, $s1, update_b

# updating the value of a
update_a:
    sub $s0, $s0, $s1
    b while     #to continue the while loop

# updating the value of b
update_b:
    sub $s1, $s1, $s0
    b while     #to continue the while loop

# printing gcd, i.e final value of a after the while loop
print_ans:
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

#printing the gcd when a is equal to zero, i.e value of b
print_ans_b:
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

#printing the error when one of the number is negative
error_terminate:
    li $v0, 4
    la $a0, error
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 10
    syscall