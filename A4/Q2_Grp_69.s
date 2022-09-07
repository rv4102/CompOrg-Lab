# Assignment 4
# Question 1 (MIPS program to calculate determinant of a matrix)
# Sem 5 (Autumn 2022-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

# .data to store the display messages in variables
    .data

#array of 10 integers
array: .space 40

#display messages
prompt_enter:
    .asciiz "Enter an integer: "
newline: 
    .asciiz "\n"
prompt_space:
    .asciiz " "
prompt_sorted:
    .asciiz "Sorted Array: "

#.text for logic implementation
    .text
.globl main

#main function starts
main:

    # calling function to read array elements
    jal     read_input
    
    # setting the first argument as address of array, second argument as 0 (left index), third argument as 9(right index)
    li      $a1, 0
    li      $a2, 9
    la      $a0, array

    # setting initial values of l, r, p for intitial function call
    li      $s0, 0 
    li      $s1, 9
    li      $s2, 0

    # function call to sort the array
    jal     recursive_sort

    # after sorting the array, calling the function to print the sorted array
    li      $v0, 4
    la      $a0, prompt_sorted
    syscall

    li      $v0, 4
    la      $a0, prompt_space
    syscall

    la      $a0, array
    jal     print_array

    # terminating the program
    li      $v0, 10
    syscall

# function to read the input
read_input:
    li      $t0, 0                  # i = 0
    b       read_loop

# loop to read the integers
read_loop:

    li      $v0,  4                       # displaying message to the user to enter an integer
    la      $a0, prompt_enter
    syscall

    li      $v0, 5                        # reading the integer
    syscall

    sw      $v0, array($t0)               # storing the integer in array
    addi    $t0, $t0, 4                   # i++   
    slti    $t1, $t0, 40                  # if (i==10) break
    beq     $t1, 1, read_loop
    jr      $ra                           # return from the read_input function

# function to sort the array
recursive_sort:
    # arguments: $a0 => array, $a1 => left, $a2 => right
    # storing the required register values
    move    $t0, $ra
    move    $t1, $a0
    jal     initStack                   # intitializing the stack frame
    move    $a0, $t0           
    jal     pushToStack                 # pushing $ra to stack 
    move    $a0, $t1
    jal     pushToStack                 # pushing $a0 (array) to stack
    move    $a0, $a1
    jal     pushToStack                 # pushing $a1 (left) to stack
    move    $a0, $a2
    jal     pushToStack                 # pushing $a2 (right) to stack
    
    move    $a0, $s0                   # pushing callee saved $s0 (l) to stack
    jal     pushToStack     
    
    move    $a0, $s1                   # pushing $s1 (r) to stack
    jal     pushToStack

    move    $a0, $s2                   # pushing $s2 (p) to stack 
    jal     pushToStack

    # $s0 represents l
    # $s1 represents r
    # $s2 represents p
    move    $s0, $a1                   # l = left               
    move    $s1, $a2                   # r = right
    move    $s2, $a1                   # p = left

    slt     $t4, $s0, $s1               # if(l<r) then continue operations, else return
    beq     $t4, 1, continue

end_funct:
 
    #restoring the arguments and callee saved register values

    lw      $s2, 0($sp)                 # restoring $s2 (p)
    lw      $s1, 4($sp)                 # restoring $s1 (r)
    lw      $s0, 8($sp)                 # restoring $s0 (l)
    lw      $a2, 12($sp)                # restoring $a2 (right)
    lw      $a1, 16($sp)                # restoring $a1 (left)
    lw      $a0, 20($sp)                # restoring $a0 (array)
    lw      $ra, 24($sp)                # restoring $ra (return address)

    lw      $fp, 0($fp)                 # restoring the prev. frame pointer
    addi    $sp , $sp, 32               # destroying the stack frame
    
    jr      $ra                         # return 

continue:

    bge     $s0, $s1, end_funct        # if(l>r) return 

    # first loop
    while1:                        
        move    $t0, $s0              
        sll     $t0, $t0, 2
        la      $t2, array
        add     $t3, $t2, $t0
        lw      $t1, 0($t3)            # $t1 stores A[l]
        move    $t0, $s2
        sll     $t0, $t0, 2
        la      $t2, array
        add     $t2, $t2, $t0
        lw      $t3, 0($t2)             # $t3 stores A[p]

        lw      $t4, 12($sp)            # $t4 stores right
        bgt     $t1, $t3, while2        # if (A[l] > A[p]) end loop
        bge     $s0, $a2, while2        # if (l >= right) end loop
        addi    $s0, $s0, 1             # l++
        j       while1                  # continue loop
    
    #second loop
    while2:
        move    $t0, $s1
        sll     $t0, $t0, 2
        la      $t2, array
        add     $t3, $t2, $t0
        lw      $t1, 0($t3)           # $t1 stores A[r]

        move    $t0, $s2
        sll     $t0, $t0, 2
        la      $t2, array
        add     $t2, $t2, $t0
        lw      $t3, 0($t2)           # $t3 stores A[p]
        
        lw      $t4, 16($sp)          # $t4 stores left
        blt     $t1, $t3, cond_if     # if(A[r] < A[p]) end loop
        ble     $s1, $t4, cond_if     # if(r<left) end loop
        addi    $s1, $s1, -1          # j--
        j       while2                # continue loop
    
    # if (l>=r), then 
    cond_if:
           
        blt     $s0, $s1, else        # checking for the condition  
                                      # if (l>=r) continue, else jump to else branch
        sll     $t2, $s1, 2
        sll     $t3, $s2, 2
        lw      $t0 , array($t3)      # swapping A[p], A[r]
        lw      $t1, array($t2)
        sw      $t0, array($t2)
        sw      $t1, array($t3)
          
        move    $t0, $s1             
        addi    $t0, $t0, -1
        move    $a2, $t0              # storing (r-1) in $a2 as the third argument

        lw      $a0, 20($sp)          # setting first argument as (A)
        lw      $a1, 16($sp)          # setting second argument as left
        
        jal     recursive_sort        # recursively calling the function, recursive_sort(A, left, r-1)

        lw      $a2, 12($sp)          # setting third argument as right
        
        move    $t0, $s1
        addi    $t0, $t0, 1
        move    $a1, $t0              # setting second argument as r+1
        lw      $a0, 20($sp)          # setting first argument as (A)
        
        jal     recursive_sort        # recursively calling the sort function, recursive_sort(array, r+1, right)
        
        b       end_funct             # return
        
    else:
        # if(l<r) 
        sll     $t2,$s0,2
        sll     $t3,$s1,2
        lw      $t0 , array($t2)       # swapping A[l], A[r]
        lw      $t1, array($t3)
        sw      $t0, array($t3)
        sw      $t1, array($t2)
        b       continue               # continue the loop

# function to print the array
print_array:
    li          $t0, 0               # i = 0
    while_print:                     # loop to print the array elements
        beq     $t0, 10, end         # if(i==10) break
        sll     $t1, $t0, 2
        li      $v0, 1
        lw      $a0, array($t1)      # $a0  = A[i]
        syscall                      # printing A[i]

        li      $v0, 4
        la      $a0, prompt_space
        syscall                       # printing space between elements

        addi    $t0, $t0, 1           # i++

        j       while_print           # continue loop

end:
    li      $v0, 4                   
    la      $a0, newline
    syscall                          # printing new line

    jr      $ra                      # return

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

