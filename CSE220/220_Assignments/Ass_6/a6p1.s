# 1. Write a MIPS assembly-language program that does the following:
#   (a) Reads an integer n
#   (b) Reads n integers, one at a time.
#   (c) Computes the sum of the positive integers and the sum of the negative integers.
#   (d) Prints the results.

.data
        Init_prompt: .asciiz "\nEnter number of items to enter: "
        Read_prompt: .asciiz "\nEnter an integer: "

        Out_pos_sum: .asciiz "\nThe sum of the positive integers is: "
        Out_neg_sum: .asciiz "\nThe sum of the negative integers is: "

        NewLine: .asciiz "\n"

.text
main:
        li $t0, 0               # int pos_sum = 0
        li $t1, 0               # int neg_sum = 0
        li $t2, 1               # int counter = 1

        la $a0, Init_prompt     # load Init_prompt to $a0
        li $v0, 4               # load syscode 4 (print string) to $v0
        syscall                 # execute print statement

        li $v0, 5               # load syscode 5 (read integer) to $v0
        syscall                 # execute read statement
        move $t3, $v0           # initialize int n with user input

        blez $t3, continue       # do not read any inputs if n <= 0

again:
        la $a0, Read_prompt     # load Read_prompt to $a0
        li $v0, 4               # load syscode 4 (print string) to $v0
        syscall                 # execute print statement

        li $v0, 5               # load syscode 5 (read integer) to $v0
        syscall                 # execute read statement
        move $t4, $v0           # initialize int input with user input

        bltz $t4, add_neg       # if (input < 0) neg_sum += input
        bgez $t4, add_pos       # if (input >= 0) pos_sum += input

        j continue 

add_neg:
        add $t1, $t1, $t4       # neg_sum += input
        j increment

add_pos:
        add $t0, $t0, $t4       # pos_sum += input
        j increment

increment:
        addi $t2, $t2, 1        # add immediate 1 to counter (counter++)
        ble $t2, $t3, again     # branch less than or equal counter, n, again

continue:
        la $a0, Out_pos_sum     # load Out_pos_sum to $a0
        li $v0, 4               # load syscode 4 (print string) to $v0
        syscall                 # execute print statement

        li $v0, 1               # load syscode 1 (print integer) to $v0
        move $a0, $t0           # move pos_sum to $a0 for output
        syscall                 # execute print statement

        la $a0, Out_neg_sum     # load Out_neg_sum to $a0
        li $v0, 4               # load syscode 4 (print string) to $v0
        syscall                 # execute print statement

        li $v0, 1               # load syscode 1 (print integer) to $v0
        move $a0, $t1           # move neg_sum to $a0 for output
        syscall                 # execute print statement

        la $a0, NewLine         # load NewLine to $a0
        li $v0, 4               # load "print string" code to $v0
        syscall                 # execute print statement

        li $v0, 10              # load syscode 10 (terminate execution) to $v0
        syscall                 # terminate execution

