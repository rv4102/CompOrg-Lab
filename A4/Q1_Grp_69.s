# Assignment 4
# Question 1 (MIPS program to calculate determinant of a matrix)
# Sem 5 (Autumn 2022-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

# .data to store the display messages in variables
    .data
# display messages
prompt_inp:
    .asciiz "Enter four positive integers (n, a, r and m): \n"
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

    # take 1st input
    li      $v0, 5
    syscall
    move    $s0, $v0        # $s0 stores the first input number (n)
    # check input
    ble     $s0, 0, print_err

    # take 2nd input
    li      $v0, 5
    syscall
    move    $s1, $v0        # $s1 stores the first input number (a)
    # check input
    ble     $s1, 0, print_err

    # take 3rd input
    li      $v0, 5
    syscall
    move    $s2, $v0        # $s2 stores the first input number (r)
    # check input
    ble     $s2, 0, print_err

    # take 4th input
    li      $v0, 5
    syscall
    move    $s3, $v0        # $s3 stores the first input number (m)
    # check input
    ble     $s3, 0, print_err

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

# Function to allocate space and populate array A with values
populateMatrix:
    # arguments : $a0 - n, $a1 - a, $a2 - r, $a3 - m
    # returns   : $v0 - base address of allocated array
    mul     $t0, $a0, $a0       # $t0 = n*n
    sll		$t0, $t0, 2		    # $t0 = n*n * 4
    addi	$t1, $sp, -4		# $t1 = $sp - 4 (Store base address of array)
    move    $fp, $sp
    sub		$sp, $sp, $t0		# $sp = $sp - $t0 (Allocate space for n*n array)
    srl		$t0, $t0, 2			# $t0 = n*n
    move    $t4, $a1		    # $t4 = a

    li      $t2, 0              # i = 0
    while:
        bge     $t2, $t0, exit_while    # if(i >= n*n) break
        div		$t4, $a3			    # a / m
        mfhi	$t3					    # $t3 = a mod m
        sw      $t3, 0($t1)             # arr = (a*r^i) mod m
        addi    $t1, $t1, -4            # go to next element in row major fashion
        mul     $t4, $t4, $a2           # a = a*r
        addi    $t2, $t2, 1             # i++
        j       while

    exit_while:
        addi  $v0, $fp, -4              # store the base address of array in $v0
        jr    $ra                       # return to caller routine

# Function to print the entire matrix
printMatrix:
    # arguments : $a0 - n, $a1 - base address of array A
    move    $t5, $ra            # temporarily store return address
    jal     initStack
    jal     pushToStack         # push n to stack at -4($fp)
    move    $a0, $a1
    jal     pushToStack         # push &A[0] to stack at -8($fp)
    move    $t0, $a1            # load &A[0] in $t0

    li      $t1, 0              # i = 0
    j		check_i_print	    # jump to check_i_print
    for_i_print:
        li      $t2, 0              # j = 0
        j		check_j_print       # jump to check_j_print
        for_j_print:
            li        $v0, 1
            lw        $a0, 0($t0)               # print A[i][j]
            syscall

            li        $v0, 4
            la        $a0, whitespace           # print " "
            syscall

            addi      $t0, $t0, -4              # $t0 now points to next element of matrix A
            addi      $t2, $t2, 1               # j++
        check_j_print:
            lw        $t3, -4($fp)              # load n in $t3
            blt       $t2, $t3, for_j_print     # if(j < n), jump to for_j_print
            addi      $t1, $t1, 1               # else i++

            li        $v0, 4
            la        $a0, newline
            syscall
    check_i_print:
        lw        $t3, -4($fp)               # load n in $t3
        blt       $t1, $t3, for_i_print     # if(i < n) jump to for_i_print
    
    lw      $a0, -4($fp)        # restore $a0 = n
    lw      $fp, 0($fp)         # restore the old frame pointer
    move    $ra, $t5            # restore return address
    addi    $sp, $sp, 12        # pop the top 3 elements of the stack
    jr      $ra                 # return to caller routine

# Function to make a submatrix from given matrix
subMatrix:
    # arguments : $a0 - n, $a1 - base address of array A, $a2 - skipRow, $a3 - skipCol
    # returns : $v0 - base address of subMatrix

    move    $t0, $ra                # temporarily store return address
    jal     initStack
    move    $t1, $a0                # temporarily store n
    move    $a0, $t0
    jal     pushToStack             # push $ra to stack at -4($fp)
    addi	$t1, $t1, -1			# $t1 = n - 1
    mul     $a0, $t1, $t1           # $a0 = (n-1)*(n-1)
    jal     mallocInStack
    move    $t5, $v0                # $t5 = base address of subMatrix of size (n-1)*(n-1)
    addi    $t1, $t1, 1             # $t1 = n
    move    $a0, $t1                # restore n
    
    li      $t0, 0      # i = 0
    j		check_i     # jump to check_i
    for_i:
        beq		$t0, $a2, upd_i	    # if i == skipRow then go to upd_i
        
        li      $t1, 0              # j = 0
        j		check_j		        # jump to check_j
        for_j:
            beq     $t1, $a3, upd_j         # if j == skipCol then go to upd_j

            mul     $t4, $t0, $a0           # $t4 = n*i
            add     $t4, $t4, $t1           # $t4 = n*i + j
            sll     $t4, $t4, 2             # $t4 = 4*(n*i + j)
            sub     $t4, $a1, $t4           # $t4 = A[i][j]

            lw      $t2, 0($t4)             # load A[i][j]
            sw      $t2, 0($t5)             # subMatrix[i'][j'] = A[i][j]

            addi    $t5, $t5, -4            # go to next element of subMatrix
            upd_j:  
                addi    $t1, $t1, 1             # j++
        check_j:
        blt     $t1, $a0, for_j     # if(j < n), jump to for_j
        upd_i:
            addi    $t0, $t0, 1         # else i++
    check_i:
        blt     $t0, $a0, for_i     # if(i < n), jump to for_i
    
    lw      $ra, -4($fp)            # restore $ra
    jr      $ra

# Function to recursively find the determinant
findDeterminant:
    # arguments : $a0 - n, $a1 - base address of array A
    # returns $v0 - determinant calculated recursively

    move    $t0, $ra            # temporarily store $ra
    move    $t1, $a0            # temporarily store n
    jal     initStack
    move    $a0, $t0
    jal     pushToStack         # store $ra in stack at -4($fp)
    move    $a0, $t1            # restore n
    jal     pushToStack         # store n in stack at -8($fp)
    move    $a0, $a1
    jal     pushToStack         # store base addr of A at -12($fp)
    move    $a0, $t1            # $a0 = n

    # base case 1
    slti    $t0, $a0, 2                 # if n == 1 then set $t0 as 1 else set it as 0
    beq     $t0, $zero, recursive_case  # if n != 1 then go to recursive_case

    lw      $v0, 0($a1)                 # $v0 = A[0][0]
    lw      $ra, -4($fp)                # restore $ra
    lw      $fp, 0($fp)                 # restore old $fp
    addi    $sp, $sp, 16                # pop top 4 elements from stack (A, n, $ra and old $fp)
    jr		$ra					        # jump to $ra
    
    recursive_case:
        li      $v0, 0                          # det = 0
        move    $a0, $v0
        jal     pushToStack                     # push det to stack at -16($fp)

        li      $t9, 0                          # i = 0

        j		check_i_det				        # jump to check_i_det
        for_i_det:
            move    $a0, $t9
            jal     pushToStack                     # push i to stack at -20($fp)

            lw      $a0, -8($fp)            # $a0 = n
            lw      $a1, -12($fp)           # $a1 = base addr of A
            li      $a2, 0
            move    $a3, $t9
            jal		subMatrix				# jump to subMatrix (with n, &A[0][0], 0, i as the arguments)

            addi    $a0, $a0, -1            # n = n-1
            jal     pushToStack             # store n-1 in stack at 0($sp)
            move    $a1, $v0                # $a1 = base address of subMatrix
            jal     findDeterminant

            lw      $t0, 0($sp)             # restore $t0 = n-1
            addi    $sp, $sp, 4             # pop n-1 from stack

            ### pop subMatrix ((n-1)*(n-1)) from stack
            mul     $t0, $t0, $t0           # $t0 = (n-1)*(n-1)
            sll     $t0, $t0, 2             # $t0 = $t0 << 2
            add     $sp, $sp, $t0
            ###

            lw      $fp, 0($fp)             # restore old $fp
            addi    $sp, $sp, 8             # pop top 2 elements from stack ($ra, old $fp)

            lw      $t9, -20($fp)           # restore i
            addi    $sp, $sp, 4             # pop i from stack

            lw		$t4, -16($fp)		    # restore det
            addi    $sp, $sp, 4             # pop det from stack

            lw      $t1, -12($fp)           # restore base addr of A
            
            sll     $t3, $t9, 2             # $t3 = i << 2
            sub     $t1, $t1, $t3           # $t1 stores address of &A[0][i]
            lw      $t2, 0($t1)             # $t2 stores A[0][i]
            
            andi	$t3, $t9, 1		        # $t3 = i & 1
            # if $t3 == 0 then $t2 remains the same
            beq		$t3, $zero, even
            # else $t2 = -A[0][i]
            nor     $t2, $t2, $zero
            addi    $t2, $t2, 1
            even:
                mul     $t8, $t2, $v0           # temp = $t2 * determinant(n-1, A')
                add     $t4, $t4, $t8           # det += $t2 * determinant(n-1, A')
                move    $a0, $t4
                jal     pushToStack             # push det to stack at -16($fp)

            addi    $t9, $t9, 1             # i++
        check_i_det:
            lw      $a0, -8($fp)            # $a0 = n
            blt     $t9, $a0, for_i_det     # if(i < n), jump to for_i_det
        
        # exit if check_i_det fails
        lw      $v0, -16($fp)               # $v0 = det
        lw      $ra, -4($fp)                # restore $ra
        lw      $fp, 0($fp)                 # restore old $fp
        addi    $sp, $sp, 20                # pop top 5 elements from stack (det, A, n, $ra and old $fp)
        jr		$ra					        # jump to $ra

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