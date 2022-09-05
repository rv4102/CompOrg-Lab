# Assignment 4
# Question 3 (MIPS program to search in an array)
# Sem 5 (Autumn 2022-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

# .data to store the display messages in variables
    .data
# display messages
prompt_inp:
    .asciiz "Enter 10 integers: \n"
prompt_err:
    .asciiz "Given input is not positive.\n"
print_A:
    .asciiz "The elements of A are: \n"
print_determinant:
    .asciiz "Final determinant of the matrix A is "
newline:
    .asciiz "\n"
whitespace:
    .asciiz " "

# .text for logic implementation
    .text
.globl main
main:
    # display prompt to enter the integers
    li      $v0, 4
    la      $a0, prompt_inp
    syscall

    li      $t0, 0    
    li      $t1, 10          
    input_loop:
        # take 1st input
        li      $v0, 5
        syscall
        move    $s0, $v0                # $s0 stores the first input number (n)
        addi    $t0, $t0, 1             # i++
        bne		$t0, $t1, input_loop    # while (i != 10), go to input_loop
    
    
        
    

    move    $a0, $s0
    move    $a1, $s1
    move    $a2, $s2
    move    $a3, $s3
    jal     populateMatrix
    move    $a1, $v0        # save the returned address of A

    li      $v0, 4
    la      $a0, print_A
    syscall

    move    $a0, $s0
    jal     printMatrix

    jal     findDeterminant
    move    $s4, $v0        # save returned determinant

    li      $v0, 4
    la      $a0, print_determinant
    syscall

    li      $v0, 1
    move    $a0, $s4        # print det
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    j       exit





# Function to initialize the stack pointer and frame pointer
initStack:
    # The stack will look like this after initStack is called:
    # ----------------- <-- $sp + 4
    # old_frame_pointer
    # ----------------- <-- $sp, $fp
    #    free_memory   

    addi    $sp, $sp, -4    # allocate space for storing old $fp
    sw      $fp, 0($sp)     # store the current frame pointer in stack
    move    $fp, $sp        # set the frame pointer to point to current top of stack
    jr      $ra             # return to caller routine

# Function to push one argument to the stack
pushToStack:
    # The stack will look like this after pushToStack is called:
    # ----------------- <-- $fp + 4 or $sp + 8
    # old_frame_pointer
    # ----------------- <-- $fp or $sp + 4
    #       $a0        
    # ----------------- <-- $sp
    #    free_memory   

    # assumption: stack has already been initialised
    addi    $sp, $sp, -4    # allocate space for storing $a0
    sw      $a0, 0($sp)     # store the argument $a0 in the stack
    jr      $ra             # return to caller routine

# Function to allocate space for $a0 memory locations
mallocInStack:
    # assumption $a0 is < 2^13 because we need 4 * $a0 memory to store the array
    sll		$t0, $a0, 2	    # $t0 = $a0 << 2

    addi	$v0, $sp, -4	# load the initial address of array in $v0
    sub     $sp, $sp, $t0   # allocate $a0 space for integer array
    jr		$ra				# return to caller routine

print_err:
    # called in case of error
    li      $v0, 4
    la      $a0, prompt_err
    syscall

    j		main				# jump to main

exit:
    li      $v0, 10         # exit the program
    syscall