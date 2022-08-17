# Assignment 2
# Question 2 (Implement Bubble Sort in MIPS)
# Sem 5 (Autumn 22-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

    .globl main         # main is a global name
    .data               # storing the data variables

array: .space 40        # array of 10 integers

# messages to be printed
newline:
    .asciiz "\n"
tab:
    .asciiz " "
prompt1: 
    .asciiz "Enter an integer: "
prompt2:
    .asciiz "Enter k:"
prompt3:
    .asciiz "Sorted array: "
prompt4:
    .asciiz "value of k is out of bounds"
prompt5:
    .asciiz "kth largest number is: "

# messages used for debugging
prompt6:
    .asciiz "done"
prompt7:
    .asciiz "reading done"

# main function starts
    .text
main:

    li $s1, 10              # storing size of array in $s1. $s1 stores 10
    jal read                # reading integers. calling read function

    jal read_k              # function to get k

    la $a0, array           # storing the array in $a0 (first argument)
    move $a1, $s1           # $a1 (second argument) = 10
    jal sort_array          # calling the function to sort the array

    li $v0, 4               # prompting the user that the next line represents the sorted array
    la $a0, prompt3
    syscall

    la $a0, array           # $a0 (first argument) = array
    move $a1, $s1           # $a1 (second argument) = 10
    jal printing_sorted_arr # calling the function to print the sorted array iteratively

    jal find_k_largest      # calling the find_k_largest function to find the 

    li $v0, 10              # ending the program
    syscall

# function to read the array

# registers
# $t1 = i (memory location of ith array element wrt to 0th element)
read:
    li $t1, 0
    b read_input            #reading input loop

#loop to read the input
read_input:
    li $v0, 4               #prompting user to enter an integer
    la $a0, prompt1
    syscall

    li $v0, 5               #taking input for an array element
    syscall
    
    sw $v0, array ($t1)     #storing the enteered integer in ith index of array
    addi $t1, $t1, 4        #i++ and then scaling it.
    
    bne $t1, 40, read_input     #if (i==10) break;
    jr $ra                      #return

#function to take k as input
read_k:
    li $v0, 4               # prompting the user to enter k
    la $a0, prompt2
    syscall

    li $v0, 5               # taking input of k
    syscall

    move $s2, $v0           # $s2 stores k
    bgt $s2, $s1, error_k_value   # if k>10 display error and end
    ble $s2, 0, error_k_value     # if k<=0 display error and end

    jr $ra                  #if valid k, then return

# if the value of k is not within the appropriate limits
error_k_value:                  
    li $v0, 4                   #prompting the user that the value of k is invalid
    la $a0, prompt4         
    syscall

    li $v0, 4                   #printing newline
    la $a0, newline
    syscall

    j read_k


# function to sort the array using bubble sort

# registers
# $a0 = array
# $a1 = 10
# $t0 = i
# $t1 = j
sort_array:
    li $t0, 1               # i = 1;
    j loop_condition_outer  # jumping to the brach to check the outer loop condition

loop_start:                 # if loop condition fulfills, going inside the outer loop
    sll $t4, $t0, 2         # multiplying i by 4 to scale it to bits
    add $t4, $a0, $t4       # adding the array memory location offset so that $t4 represent the memory locaion of ith element
    lw $t3, 0($t4)          # $t3 = array[i]
    addi $t1, $t0, -1       # $t1 = i-1; j= i-1;
    j loop_condition_inner  # jumping to the branch to check the inner loop condition

# $t2 = array[j]
# $t3  = array[i]
# $t1 = j
swap:                       # function to swap the two array elements
    sll $t4, $t1, 2         # multiplying j by 2 to convert it to bits
    add $t4, $a0, $t4       # adding array memory offset to store the array[j]
    lw $t2, 0($t4)          # $t2 = array[j]
    addi $t4, $t4, 4        # $t4 represents memory loccation of (j+1)th element
    sw $t2, 0($t4)          # array[j+1] = array[j]
    addi $t1, $t1, -1       # j--;

loop_condition_inner:
    blt $t1, $zero, loop_termination_inner       # if (j<0) break
    sll $t4, $t1, 2             # multiplying j by 4 to convert it to bits
    add $t4, $a0, $t4           # adding the array memory location offset to store the jth element of the array 
    lw $t2, 0($t4)              # $t2 = array[j]
    bgt $t2, $t3, swap          # if(array[j] > array[i]) calling the swap function

loop_termination_inner:         #after the inner loop terminates
    add $t4, $t1, 1             # $t4 = j+1
    sll $t4, $t4, 2             # multiplying $t4 by 4 to convert it to bits
    add $t4, $a0, $t4           # adding the array memory location offset to represent the location of (j+1)th element
    sw $t3, 0($t4)              # array[j+1] = array[i]
    addi $t0, $t0, 1            # i++, then moving on to check the outer loop condition

loop_condition_outer:           # to check the outer loop condition
    blt $t0,  $a1, loop_start   # if(i<10) start the loop
    jr $ra                      #else return


# function to print the sorted array
# registers
# $a0 = array
# $a1 = 10
# $t0 = i;
printing_sorted_arr:
    li $t0, 0
    li $t1, 0                   # $t1 represents i in bits (after multiplying i with 4)
                                # starting the loop to print the array
while_print:                    # loop to print the array elements iteratively
                                # checking the condition to continue the loop
    bge $t0, $a1, while_print_terminate     # if (i==10) break
    lw $t2, array($t1)          # $t2 stores array[i]
    addi $t1, $t1, 4            # now $t1 represents the location of (i+1)th element 

    li $v0, 1                   # to print the array element
    move $a0, $t2               # printing the array[i]
    syscall

    li $v0, 4                   # printing space
    la $a0, tab
    syscall

    addi $t0, $t0, 1            #i++;
    j while_print               #continuing the loop

# after the loop terminates
while_print_terminate:                
    li $v0, 4                   # printing '\n'
    la $a0, newline
    syscall
    jr $ra                      # return

#function to find the kth largest element in the sorted array
find_k_largest:
    li $v0, 4               # prompting the user that the next integer printed is the kth largest element in the array
    la $a0, prompt5
    syscall    

    # $s1 = 10
    # $s2 = k
    sub $t1, $s1, $s2       # $t1 stores (10 - k)
    sll $t1, $t1, 2         # multiplying the $t1 by 4 to convert it to bits
    lw $t2, array($t1)      # $t2 stores array[n-k]

    li $v0, 1               # printing the kth largest integer
    move $a0, $t2           # printing array[n-k]
    syscall

    li $v0, 4               # printing the newline
    la $a0, newline
    syscall

    jr $ra                  # return 