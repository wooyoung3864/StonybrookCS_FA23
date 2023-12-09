# 1. Write a function, SumN, to compute 1 + 2 + 3 + ... + N.
#       - argument N in $a0
#       - result in $v0
# 2. Write a "main" to
#       - read a value for n
#       - call SumN
#       - print result

.data
        in_prompt: .asciiz "\nEnter a positive integer n: "
        out_prompt: .asciiz "\nThe sum of integers from 1 to n: "

.text
main:
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

        add $a0, $s0, $0    # move sum stored at $v0 to $s0 for printing
        li $v0, 1
        syscall             # print sum

        j terminate
        
sum_n:
        addi $sp, $sp, -8   # make space on stack to store 3 registers for $s0, $t0, and $t1
        sw $t0, 4($sp)      # save $t0 on stack
        sw $t1, 0($sp)      # save $t1 on stack

        addi $v0, $0, 0      # initialize sum to 0
        addi $t0, $t0, 1      # initialize counter to 1
        add $t1, $a0, $0     # initialize limit to n, which is stored at $a0

        again:
            add $v0, $v0, $t0   # sum += counter
            addi $t0, $t0, 1    # counter++
            ble $t0, $t1, again # loop while counter <= n

        lw $t1, 0($sp)      # restore $t1 from stack
        lw $t0, 4($sp)      # restore $t0 from stack
        addi $sp, $sp, 8   # deallocate stack space

        jr $ra              # return to caller

terminate:
        li $v0, 10
        syscall

        