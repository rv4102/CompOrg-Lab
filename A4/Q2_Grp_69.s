# Assignment 4
# Question 1 (MIPS program to calculate determinant of a matrix)
# Sem 5 (Autumn 2022-23)
# Group 69
# Rushil Venkateswar (20CS30045)
# Jatin Gupta (20CS10087)

    .data
array: .space 40


prompt_enter:
    .asciiz "Enter an integer: "
newline: 
    .asciiz "\n"
prompt_space:
    .asciiz " "
prompt_sorted:
    .asciiz "Sorted Array: "
debug:
    .asciiz "Jatin is a bitch"
debug2:
    .asciiz "Jatin is a bitch no.2"
debug3:
    .asciiz "Jatin is a bitch no.3"
debug4:
    .asciiz "Jatin is a bitch no.4"

    .text
main:
    jal read_input
    
    li $a1, 0
    li $a2, 9
    la $a0, array
    
    li $s0, 0
    li $s1, 9
    li $s2, 0

    jal recursive_sort

    li $v0, 4
    la $a0, prompt_sorted
    syscall

    li $v0, 4
    la $a0, prompt_space
    syscall

    la $a0, array
    b print_array

read_input:
    li $t0, 0
    b read_loop

read_loop:
    li $v0,  4
    la $a0, prompt_enter
    syscall
    li $v0, 5
    syscall
    sw $v0, array($t0)
    addi $t0, $t0, 4
    slti $t1, $t0, 40
    beq $t1, 1, read_loop
    jr $ra



recursive_sort:

    move $t0, $ra
    move $t1, $a0
    jal initStack   
    move $a0, $t0
    jal pushToStack         
    move $a0, $t1
    jal pushToStack         
    move $a0, $a1
    jal pushToStack         
    move $a0, $a2
    jal pushToStack         
    

    move $a0, $s0
    jal pushToStack     
    
    move $a0, $s1           
    jal pushToStack

    move $a0, $s2           
    jal pushToStack

    move $s0, $a1         
    move $s1, $a2         
    move $s2, $a1         

    slt $t4, $s0, $s1
    beq $t4, 1, continue

end_funct:
 
    lw $s2, 0($sp)
    lw $s1, 4($sp)
    lw $s0, 8($sp)
    lw $a2, 12($sp)
    lw $a1, 16($sp)
    lw $a0, 20($sp)
    lw $ra, 24($sp)

    lw $fp, 0($fp)
    addi $sp , $sp, 32
    
    jr $ra 

continue:

    bgt $s0, $s1, end_funct

    while1:
        move $t0, $s0
        sll $t0, $t0, 2
        la  $t2, array
        add $t3, $t2, $t0
        lw  $t1, 0($t3)
        move $t0, $s2
        sll $t0, $t0, 2
        la $t2, array
        add $t2, $t2, $t0
        lw $t3, 0($t2)

        lw $t4, 12($sp)
        bgt $t1, $t3, while2
        bge $s0, $a2, while2
        addi $s0, $s0, 1
        j while1
    
    while2:
        
        move $t0, $s1
        sll $t0, $t0, 2
        la $t2, array
        add $t3, $t2, $t0
        lw $t1, 0($t3)

        move $t0, $s2
        sll $t0, $t0, 2
        la $t2, array
        add $t2, $t2, $t0
        lw $t3, 0($t2)
        
        lw $t4, 16($sp)
        blt $t1, $t3, cond_if
        ble $s1, $t4, cond_if
        addi $s1, $s1, -1
        j while2
    
    cond_if:
           
        blt $s0, $s1, else
      
        sll $t2, $s1, 2
        sll $t3, $s2, 2
        lw $t0 , array($t3)
        lw $t1, array($t2)
        sw $t0, array($t2)
        sw $t1, array($t3)
          
        move $t0, $s1
        addi $t0, $t0, -1
        move $a2, $t0

        lw $a0, 20($sp)
        lw $a1, 16($sp)
        
        jal recursive_sort

        lw $a2, 12($sp)
        
        move $t0, $s1
        addi $t0, $t0, 1
        move $a1, $t0
        lw $a0, 20($sp)
        
        jal recursive_sort
        
        b end_funct
        
    else:
        
        sll $t2,$s0,2
        sll $t3,$s1,2
        lw $t0 , array($t2)
        lw $t1, array($t3)
        sw $t0, array($t3)
        sw $t1, array($t2)
        b continue

print_array:
    li $t0, 0
    while_print:
        beq $t0, 10, end
        sll $t1, $t0, 2
        li $v0, 1
        lw $a0, array($t1)
        syscall

        li $v0, 4
        la $a0, prompt_space
        syscall

        addi $t0, $t0, 1

        j while_print

end:
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

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

