# 2. Write a function that computes the factorial of a number N iteratively.

.data
        input_prompt: .asciiz "\nEnter a positive integer n: "
        output_prompt: .asciiz "\nThe factorial of n is: "

.text
main:
        la $a0, input_prompt
        li $v0, 4
        syscall             # print input prompt

        li $v0, 5
        syscall
        move $a0, $v0       # read N and move to $a0, to pass as an argument to factorial

        jal factorial
        move $s0, $v0       # move result of factorial at $v0 to $s0 for storage

        la $a0, output_prompt
        li $v0, 4
        syscall             # print output prompt

        move $a0, $s0
        li $v0, 1
        syscall             # print result value

        j terminate

factorial:
            # Motivation for storing s & t registers on the stack:
            #   s & t registers get modified by both the caller and the callee.
            #   In order to avoid unintended overwrites of data, the callee keeps a copy of the s & t registers' contents 
            #   so that it can revert them back to their original state after using the registers to perform the desired operations.
            # This is done by first allocating n*m bytes of space by shifting the stack pointer n units down 
            #   and storing n*m bytes into each index of the stack,
            #   with successive indices denoted by an offset of (n-i)*m.
            # Deallocation is performed in reverse order and by shifting the stack pointer n*m units up.

        addi $sp, $sp, -12  # allocate stack space for 3 word registers, by shifting the stack pointer 12 indices down
        sw $s0, 8($sp)      # save $s0 on stack (located at offset 8 from stack pointer)
        sw $t0, 4($sp)      # save $t0 on stack (located at offset 4 from stack pointer)
        sw $t1, 0($sp)      # save $t1 on stack (located at offset 0 from stack pointer)

        addi $s0, $s0, 1    # 

        lw $t1, 0($sp)      # restore $t1 from stack (located at offset 0 from stack pointer)
        lw $t0, 4($sp)      # restore $t0 from stack (located at offset 4 from stack pointer)
        lw $s0, 8($sp)      # restore $s0 from stack (located at offset 8 from stack pointer)
        addi $sp, $sp, 12   # deallocate stack space, by shifting the stack pointer 12 indices up

        jr $ra              # return to caller

terminate:
        li $v0, 10
        syscall