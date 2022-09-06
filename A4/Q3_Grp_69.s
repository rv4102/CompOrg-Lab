# Assignment 4
# Question 3 (MIPS program to search in an array)
# Sem 5 (Autumn 2022-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

# text segment
    .data
array: .space 40

prompt_enter:
    .asciiz "Enter an integer: "
prompt_n:
    .asciiz "Enter n: "
newline: 
    .asciiz "\n"
prompt_space:
    .asciiz " "
prompt_found:
    .asciiz " is FOUND in the array at index "
prompt_not_found:
    .asciiz " NOT FOUND in the array.\n"

# code segment
    .text
.globl main
main:
    li $s0, 10
    jal read_input

    li $v0, 4
    la $a0, prompt_n
    syscall

    li $v0, 5
    syscall
    move $s0, $v0               # $s0 = n

    li $a0, 0                   # start = 0
    li $a1, 9                   # end = 9
    move $a2, $s0               # key = n
    jal recursive_search        # recursive_search(start, end, key)
    move $s1, $v0

    # if return value is -1, then return not found
    li $t0, -1
    beq $s1, $t0, not_found

    # else return index
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, prompt_found
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    j exit_prog

read_input:
    li $t0, 0                   # i = 0
    b read_loop

read_loop:
    li $v0,  4
    la $a0, prompt_enter
    syscall

    li $v0, 5
    syscall
    sw $v0, array($t0)          # store input in array[i]

    addi $t0, $t0, 4            # i++
    slti $t1, $t0, 40           # if(i < 10)
    beq $t1, 1, read_loop       # go to read_loop
    jr $ra                      # else return

# function to recursively search for a value in an array using ternary search
recursive_search:
    # arguments: $a0 - start, $a1 - end, $a2 - key
    # returns: $v0 - index if found, -1 if not found
    move $t0, $ra
    jal initStack
    jal pushToStack         # push start to stack at -4($fp)
    move $a0, $a1
    jal pushToStack         # push end to stack at -8($fp)
    move $a0, $a2
    jal pushToStack         # push key to stack at -12($fp)
    move $a0, $s0
    jal pushToStack         # push $s0 to stack at -16($fp)
    move $a0, $t0
    jal pushToStack         # push $ra to stack at -20($fp)

    j check_while
while_recursive_search:
    lw $a0, -4($fp)
    lw $a1, -8($fp)
    lw $a2, -12($fp)
    sub $t0, $a1, $a0       # $t0 = end - start
    li $t1, 3               # $t1 = 3
    div $t0, $t1
    mflo $t0                # $t0 = (end - start)/3
    add $s0, $a0, $t0       # $s0 = start + (end - start)/3
    sub $s1, $a1, $t0       # $s1 = end - (end - start)/3

# base case 1 
    sll $t0, $s0, 2         # $t0 = 4 * mid1
    lw $t0, array($t0)      # $t0 = A[mid1]
    bne $a2, $t0, base_case_2
    move $v0, $s0           # if key == A[mid1], return mid1
    j exit

base_case_2:                # else go to base_case_2
    sll $t0, $s1, 2         # $t0 = 4 * mid2
    lw $t0, array($t0)      # $t0 = A[mid2]
    bne $a2, $t0, recursive_case_1
    move $v0, $s1
    j exit

recursive_case_1:
    sll $t0, $s0, 2         # $t0 = 4 * mid1
    lw $t0, array($t0)      # $t0 = A[mid1]
    bge $a2, $t0, recursive_case_2
    lw $a0, -4($fp)         # $a0 = start
    addi $a1, $s0, -1       # $a1 = mid1 - 1
    lw $a2, -12($fp)        # $a2 = key
    jal recursive_search
    j exit

recursive_case_2:
    sll $t0, $s1, 2         # $t0 = 4 * mid2
    lw $t0, array($t0)      # $t0 = A[mid2]
    ble $a2, $t0, recursive_case_3
    addi $a0, $s1, 1        # $a0 = mid2 + 1
    lw $a1, -8($fp)         # $a1 = end
    lw $a2, -12($fp)        # $a2 = key
    jal recursive_search
    j exit

recursive_case_3:
    addi $a0, $s0, 1        # $a0 = mid1 + 1
    addi $a1, $s1, -1       # $a1 = mid2 - 1
    lw $a2, -12($fp)        # $a2 = key
    jal recursive_search
    j exit

check_while:
    lw $t0, -4($fp)
    lw $t1, -8($fp)
    ble $t0, $t1, while_recursive_search
    li $v0, -1              # if (start > end), return -1

exit:
    lw $s0, -16($fp)        # restore $s0
    lw $ra, -20($fp)        # restore $ra
    lw $fp, 0($fp)          # restore $fp
    addi $sp, $sp, 24       # pop top 6 elements
    jr $ra

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

not_found:
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, prompt_not_found
    syscall
 
    j exit_prog

exit_prog:
    li      $v0, 10         # exit the program
    syscall