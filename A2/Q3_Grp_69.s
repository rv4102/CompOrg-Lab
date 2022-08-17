# Assignment 2
# Question 3 (Implementation of matrix print & transpose operations in MIPS)
# Sem 5 (Autumn 2022-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

# .data to store the display messages in variables
    .data
# display messages
prompt_inp:
    .asciiz "Enter four positive integers m, n, a and r: \n"
prompt_err:
    .asciiz "Given input is not positive.\n"
result_a:
    .asciiz "The elements of A are: \n"
result_b:
    .asciiz "The elements of B are: \n"
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

    # take 1st input
    li      $v0, 5
    syscall
    move    $s0, $v0        # $s0 stores the first input number (m)

    # check input
    ble     $s0, 0, print_err

    # take 2nd input
    li      $v0, 5
    syscall
    move    $s1, $v0        # $s1 stores the first input number (n)

    # check input
    ble     $s1, 0, print_err

    # take 3rd input
    li      $v0, 5
    syscall
    move    $s2, $v0        # $s2 stores the first input number (a)

    # check input
    ble     $s2, 0, print_err

    # take 4th input
    li      $v0, 5
    syscall
    move    $s3, $v0        # $s3 stores the first input number (r)

    # check input
    ble     $s3, 0, print_err

    mul     $a0, $s0, $s1
    move    $a1, $s2
    move    $a2, $s3
    jal     populateMatrix
    move    $s4, $v0        # store return address of A

    move    $a0, $s0
    move    $a1, $s1
    move    $a2, $s4
    jal     transposeMatrix
    move    $s5, $v0        # store return address of B

    li      $v0, 4
    la      $a0, result_a
    syscall

    move    $a0, $s0
    move    $a1, $s1
    move    $a2, $s4
    jal     printMatrix     # print the Matrix of A

    li      $v0, 4
    la      $a0, result_b
    syscall

    move    $a0, $s1
    move    $a1, $s0
    move    $a2, $s5
    jal     printMatrix     # print the Matrix of B

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

# Function to allocate space for m * n memory locations
mallocInStack:
    # assumption $a0 (m*n) is < 2^13 because we need 4 * $a0 memory to store the array
    sll		$t0, $a0, 2	    # $t0 = $a0 << 2

    addi	$v0, $fp, -4	# load the initial address of array in $v0
    sub     $sp, $sp, $t0   # allocate 4 * m*n space for integer array of size m*n
    jr		$ra				# return to caller routine

# Function to allocate space and populate array A with values
populateMatrix:
    # arguments : $a0 - m*n, $a1 - a, $a2 - r
    # returns   : $v0 - base address of allocated array
    move    $s7, $ra        # store return address of populateMatrix
    jal     initStack
    jal     mallocInStack   # allocate space for m*n array
    move    $t0, $v0        # store base address of the array in $t0

    li      $t1, 0          # i = 0
    while:
        bge     $t1, $a0, exit_while    # if(i >= m*n) break
        sw      $a1, 0($t0)             # arr = a*r^i
        addi    $t0, $t0, -4            # go to next element in row major fashion
        mul     $a1, $a1, $a2           # a = a*r
        addi    $t1, $t1, 1             # i++
        j       while

    exit_while:
        addi  $v0, $fp, -4              # store the base address of array in $v0
        move  $ra, $s7                  # restore the return address
        jr    $ra                       # return to caller routine
    
# Function to generate transpose of array A and store it in array B
transposeMatrix:
    # arguments : $a0 - m, $a1 - n, $a2 - base address of array A
    # returns   : $v0 - base address of array B

    move    $s7, $ra        # store return address in temp register

    jal     initStack
    jal     pushToStack     # push m to stack (at $fp - 4)
    move    $t1, $a0        # temp = $a0
    move    $a0, $a1        # $a0 = n
    jal     pushToStack     # push n to stack (at $fp - 8)
    move    $a0, $t1        # $a0 = temp (m)

    mul     $a0, $a1, $a0   # $a0 *= $a1 ($a0 = n*m)
    jal     mallocInStack   # allocate space for n*m array

    addi    $t0, $v0, -8    # store base address of the array B in $t0

    li      $t3, 0          # i = 0
    j		check_i			# jump to check_i
    for_i:
        li      $t4, 0      # j = 0
        j       check_j     # jump to check_j    
        for_j:
            lw      $t1, -4($fp)              # load m in $t1
            lw      $t2, -8($fp)              # load n in $t2

            mul     $t1, $t1, $t4             # $t1 = m*j
            add		$t1, $t1, $t3		      # $t1 = m*j + i
            sll     $t1, $t1, 2               # $t1 = 4*(m*j + i)
            sub     $t1, $t0, $t1             # $t1 = B[j][i]
            
            lw      $t5, 0($a2)               # load A[i][j]
            sw      $t5, 0($t1)               # B[j][i] = A[i][j]

            addi    $a2, $a2, -4              # $a2 now points to next element of matrix A

            addi    $t4, $t4, 1               # j++
        check_j:
            lw      $t2, -8($fp)              # load n in $t2
            blt     $t4, $t2, for_j           # if(j < n), jump to for_j
            addi    $t3, $t3, 1               # else i++
    check_i:
        lw      $t2, -4($fp)              # load m in $t2
        blt     $t3, $t2, for_i           # if(i < m), jump to for_i
    
    # exit if check_i fails
    move    $v0, $t0        # $v0 stores the base address of B
    move    $ra, $s7        # restore return address from temp register
    jr      $ra             # return to caller routine

printMatrix:
    # arguments : $a0 - m, $a1 - n, $a2 - base address of array A
    move    $s7, $ra        # store return address in temp register

    jal     initStack
    jal     pushToStack     # push m to stack
    move    $a0, $a1        # $a0 = n
    jal     pushToStack     # push n to stack

    move    $t3, $a2        # $t3 = base address of array A

    li      $t0, 0          # i = 0
    j		check_i_print	# jump to check_i_print
    for_i_print:
        li      $t1, 0          # j = 0
        j		check_j_print   # jump to check_j_print
        for_j_print:
            li        $v0, 1
            lw        $a0, 0($t3)                  # print A[i][j]
            syscall

            li        $v0, 4
            la        $a0, whitespace           # print " "
            syscall

            addi      $t3, $t3, -4              # $t3 now points to next element of matrix A
            addi      $t1, $t1, 1               # j++
        check_j_print:
            lw        $t2, -8($fp)              # load n in $t2
            blt       $t1, $t2, for_j_print     # if(j < n), jump to for_j_print
            addi      $t0, $t0, 1               # else i++

            li        $v0, 4
            la        $a0, newline
            syscall
    check_i_print:
        lw        $t2, -4($fp)              # load m in $t2
        blt       $t0, $t2, for_i_print     # if(i < m) jump to for_i_print
    
    move    $ra, $s7        # restore return address from temp register
    jr      $ra             # return to caller routine

print_err:
    # called in case of error
    li      $v0, 4
    la      $a0, prompt_err
    syscall

    j		main				# jump to main

exit:
    li      $v0, 10         # exit the program
    syscall