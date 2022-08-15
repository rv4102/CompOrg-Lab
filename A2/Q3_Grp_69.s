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
    .asciiz "The elements of A are: "
result_b:
    .asciiz "The elements of B are: "
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
    sub     $a0, $zero, $a0 # $a0 = -$a0
    li      $t0, 4          # store 4 in a temp register
    mul     $a0, $a0, $t0   # $a0 = -4 * $a0

    addi    $sp, $sp, $a0   # allocate 4 * m*n space for integer array of size m*n
    lw		$v0, -4($fp)	# load the initial address of array in $v0
    jr		$ra				# return to caller routine

# Function to allocate space and populate array A with values
populateMatrix:
    # arguments : $a0 - m*n, $a1 - a, $a2 - r
    # returns   : $v0 - base address of allocated array
    jal     initStack
    jal     mallocInStack   # allocate space for m*n array
    move    $t0, $v0        # store base address of the array in $t0

    li      $t1, 0          # i = 0
    while:
        beq     $t1, $a0, exit_while    # if(i == m*n) break
        move    $t0, $a1                # arr = a*r^i
        addi    $t0, $t0, 4             # arr = arr + 1 (go to next element in row major fashion)
        mul     $a1, $a1, $a2           # a = a*r
        addi    $t1, $t1, 1             # i++
        j       while

    exit_while:
        lw    $v0, -4($fp)              # store the base address of array in $v0
        jr    $ra                       # return to caller routine
    
# Function to generate transpose of array A and store it in array B
transposeMatrix:
    # arguments : $a0 - m, $a1 - n, $a2 - base address of array A
    # returns   : $v0 - base address of array B
    move    $t0, $a0        # temp = $a0
    mul     $a0, $a0, $a1   # $a0 *= $a1

    jal     initStack
    jal     mallocInStack   # allocate space for n*m array
    move    $a0, $t0        # $a0 = temp (m)
    jal     pushToStack     # push m to stack
    move    $a0, $a1        # $a0 = n
    jal     pushToStack     # push n to stack

    move    $t0, $v0        # store base address of the array B in $t0

    li      $t3, 0          # i = 0
    j		check_i			# jump to check_i
    for_i:
        li      $t4, 0      # j = 0
        j       check_j     # jump to check_j    
        for_j:
            lw      $t1, -4($fp)              # load m in $t1
            lw      $t2, -8($fp)              # load n in $t2

            mul     $t1, $t1, $t3             # $t1 = m*i
            add		$t1, $t1, $t4		      # $t1 = m*i + j
            add     $t1, $t0, $t1             # $t1 = B + (m*i + j)
            mul     $t2, $t2, $t4             # $t2 = n*j
            add     $t2, $t2, $t3             # $t2 = n*j + i
            add     $t2, $a0, $t2             # $t2 = A + (n*j + i)

            move    $t1, $t2                  # $t1 = $t2
            addi    $t4, $t4, 1               # j++
        check_j:
            lw      $t2, -4($fp)              # load m in $t2
            blt     $t4, $t2, for_j           # if(j < m), jump to for_j
            addi    $t3, $t3, 1               # else i++
    check_i:
        lw      $t2, -8($fp)              # load n in $t2
        blt     $t4, $t2, for_i           # if(i < n), jump to for_i
    
    # exit if check_i fails
    move    $v0, $t0        # $v0 stores the base address of B
    jr      $ra             # return to caller routine

printMatrix:
    # arguments : $a0 - m, $a1 - n, $a2 - base address of array A
    jal     initStack
    jal     pushToStack     # push m to stack
    move    $a0, $a1        # $a0 = n
    jal     pushToStack     # push n to stack

    li      $t0, 0          # i = 0
    j		check_i_print	# jump to check_i_print
    for_i_print:
        li      $t1, 0          # j = 0
        j		check_j_print   # jump to check_j_print
        for_j_print:
            lw        $t2, -8($fp)              # $t2 = n
            mul       $t3, $t2, $t0             # $t3 = n*i
            add       $t3, $t3, $t1             # $t3 = n*i + j
            add       $t3, $a2, $t3             # $t3 = A + (n*i + j)

            li        $v0, 1
            move      $a0, $t3                  # print A[i][j]
            syscall

            li        $v0, 4
            la        $a0, whitespace           # print " "
            syscall

            addi      $t1, $t1, 1               # j++
        check_j_print:
            lw        $t2, -8($fp)              # load n in $t2
            blt       $t1, $t2, for_j_print     # if(j < n), jump to for_j_print
            addi      $t0, $t0, 1               # else i++
    check_i_print:
        lw        $t2, -4($fp)              # load m in $t2
        blt       $t0, $t2, for_i_print     # if(i < m) jump to for_i_print
    
    jr      $ra             # return to caller routine

print_err:
    # called in case of error
    li      $v0, 4
    la      $a0, prompt_err
    syscall

    li      $v0, 10         # exit the program
    syscall

exit:
    li      $v0, 10         # exit the program
    syscall