# 3. Modify the "main" so that:
#       (i) it reads a number, M
#       (ii) it reads M different numbers
#       (iii) for each number read in (i), call sumN, with that number as the argument, and print the result.

.data
        init_prompt: .asciiz "\nEnter a positive integer m: "
        in_prompt: .asciiz "\nEnter a positive integer n: "
        out_prompt: .asciiz "\nThe sum of integers from 1 to n: "

.text
main:
        li $t0, 1      # int loop_counter = 1
        
        la $a0, init_prompt
        li $v0, 4
        syscall             # print initial prompt

        li $v0, 5
        syscall             # read int m
        move $t1, $v0       # move m to $t1 for storage

loop:
        la $a0, in_prompt
        li $v0, 4
        syscall             # print in_prompt

        li $v0, 5
        syscall             # read n to $v0

        add $a0, $v0, $0    # move n at $v0 to $a0, to pass to sum_n as an argument

        jal sum_n

        add $s0, $v0, $0   # move result of sum_n stored at $v0 to $s0

        la $a0, out_prompt
        li $v0, 4
        syscall             # print out_prompt

        add $a0, $s0, $0    # move sum stored at $s0 to $a0 for printing
        li $v0, 1
        syscall             # print sum

        li $s0, 0           # reset value at $s0 for next iteration
        li $a0, 0           # reset value at $a0 for next iteration

        addi $t0, $t0, 1    # counter++
        ble $t0, $t1, loop  # while counter <= m

        j terminate
        
sum_n:
        addi $sp, $sp, -12   # make space on stack to store 3 registers for $s0, $t0, and $t1
        sw $s0, 8($sp)      # save $s0 on stack
        sw $t0, 4($sp)      # save $t0 on stack
        sw $t1, 0($sp)      # save $t1 on stack

        li $v0, 0      # initialize sum to 0
        li $t0, 1      # initialize counter to 1
        add $t1, $0, $a0     # initialize limit to n, which is stored at $a0

        again:
            add $v0, $v0, $t0   # sum += counter
            addi $t0, $t0, 1    # counter++
            ble $t0, $t1, again # loop while counter <= n

        li $t1, 0           # reset limit to 0 for next iteration

        lw $t1, 0($sp)      # restore $t1 from stack
        lw $t0, 4($sp)      # restore $t0 from stack
        lw $s0, 8($sp)      # restore $s0 from stack
        addi $sp, $sp, 12   # deallocate stack space

        jr $ra              # return to caller

terminate:
        li $v0, 10
        syscall

        