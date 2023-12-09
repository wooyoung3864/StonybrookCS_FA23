# 2. Write an algorithm and program to count the number of 1's in the binary representation of a 32-bit word.

.data
        prompt: .asciiz "\nEnter an integer: "
        out: .asciiz "\nThe number of 1's is: "

.text
 main:  
        li $t0, 0       # int counter = 0
        li $t4, 0       # int count_ones = 0
        li $t1, 32      # int limit = 32

        la $a0, prompt
        li $v0, 4
        syscall

        li $v0, 5
        syscall
        move $t2, $v0   # initialize int input at $t2

loop:
        andi $t3, $t2, 1    # $t3 <= (LSB of $t2) & 1 

        bgt $t3, $zero, incr  # if $t3 > 0 (i.e. == 1), counter++
        j continue
        
        incr:
                addi $t4, $t4, 1     # count_ones++
    
        continue:
            sra $t2, $t2, 1
            addi $t0, $t0, 1    # counter++
blt $t0, $t1, loop

print_result:
        la $a0, out
        li $v0, 4
        syscall

        li $v0, 1
        move $a0, $t4
        syscall

terminate:
        li $v0, 10
        syscall

