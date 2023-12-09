# 1. Write an algorithm and code to print all the negative numbers in an array of 10 elements, one per line.
# -- Assume array is initialized.

.data
        A: .word 10, 11, -4, 6, 1, 4, 42, -11, 0, 3
        out_msg: .asciiz "The negative numbers in the array are: "
        new_line: .asciiz "\n"

.text
main:
        li $t0, 0       # initialize counter
        li $t1, 10      # set the counter limit to 10
        la $t2, A       # load address of A to pointer $t2

        li $v0, 4
        la $a0, out_msg
        syscall         # print out_msg

        li $v0, 11      # syscode 11 for print_char
        la $a0, 10      # load ASCII code 10 ('\n') into $a0
        syscall         # print newline character

traverse_array:
        lw $t3, 0($t2)  # load word item at address $t2 with offset 0, to $t3
        bltz $t3, print_negative    # print *$t2 if negative
        j continue                  # don't print and continue otherwise

        print_negative:
            li $v0, 1
            move $a0, $t3
            syscall                # print *$t3

            li $v0, 11      # syscode 11 for print_char
            la $a0, 10      # load ASCII code 10 ('\n') into $a0
            syscall         # print newline character

        continue:
            addi $t0, $t0, 1       # counter++
            addi $t2, $t2, 4       # pointer += 4
            bne $t0, $t1, traverse_array   # while(counter != limit)

terminate:
        li $v0, 10
        syscall
