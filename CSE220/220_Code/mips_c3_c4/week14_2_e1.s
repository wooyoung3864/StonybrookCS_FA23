# 2. (a) Write a function, inner_product, to compute the inner product of two arrays.
#
#       @param
#           $a0: address of A
#           $a1: address of B
#           $a2: length of A & B (N = 10 by default)
#
#       @return
#           $v0: result
#
#    (b) Write a "main" to test it.

.data
        A: .word 7, 3, 8, -9, 4, 6, -13, 2, 1, 5    # predefine and initialize A
        B: .word -13, -9, 1, 2, 3, 4, 5, 6, 7, 8    # predefine and initialize B
        N: .word 10                                 # #define N 10

        out_msg: .asciiz "\nThe inner product is: "

.text
main:
        la $a0, A           
        la $a1, B           # provide pointers to beginning of A and B as arguments for inner_product
        lw $a2, N           # provide N as an argument for inner_product
        jal inner_product

        move $t0, $v0       # move result from inner_product to $t0 for temporary storage

        la $a0, out_msg
        li $v0, 4
        syscall             # load & print output message

        move $a0, $t0       # move inner product stored at $t0 to $a0 for printing
        li $v0, 1
        syscall             # print inner product

        j terminate         # terminate execution

inner_product:
        addi $sp, $sp, -16  # allocate stack space for 4 registers
        sw $t7, 12($sp)     # stack.push($t7)
        sw $t6, 8($sp)     # stack.push($t6)
        sw $t5, 4($sp)     # stack.push($t5)
        sw $t2, 0($sp)      # stack.push($t2)

        li $t2, 0           # int count = 0
        li $v0, 0           # int sum = 0
        li $t5, 0           # int product = 0

        traverse_array:
            lw $t6, 0($a0)  # dereference pointer to A (int *p)
            lw $t7, 0($a1)  # dereference pointer to B (int *q)

            mul $t5, $t6, $t7   # product = (*p) * (*q)
            add $v0, $v0, $t5   # sum += product
            li $t5, 0           # reset product to 0

            addi $a0, $a0, 4    # p++
            addi $a1, $a1, 4    # q++  
            addi $t2, $t2, 1    # count++
        blt $t2, $a2, traverse_array

        lw $t2, 0($sp)      # stack.pop($t2)
        lw $t5, 4($sp)      # stack.pop($t5)
        lw $t6, 8($sp)      # stack.pop($t6)
        lw $t7, 12($sp)     # stack.pop($t7)
        addi $sp, $sp, 16   # deallocate stack space

        jr $ra              # return to caller (main)

terminate:
        li $v0, 10
        syscall             # terminate execution

