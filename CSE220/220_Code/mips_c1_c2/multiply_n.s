# 1. Write an algorithm and code for the multiplication of two numbers by repeated addiiton.
#       E.g. 4 * 3 = 4 + 4 + 4
#    - Read two numbers, multiply, print the result.

.data
        Prompt: .asciiz "\nEnter two integers to multiply, one followed by the enter key: \n"
        OutMsg: .asciiz "\nThe product is: "
        NewLine: .asciiz "\n"
.text
main:
        li $t0, 0           # initialize sum (product by addition) to 0
        li $t1, 1           # initialize counter to 1

        la $a0, Prompt      # load Prompt to argument register $a0
        li $v0, 4           # load "print string" code to return value register $v0
        syscall             # execute print statement

        li $v0, 5           # load "read integer" code to $v0
        syscall             # read integer m to $v0
        move $t2, $v0       # load m to sum register $t2

        li $v0, 5           # load "read integer" code to $v0
        syscall             # read integer n to $v0
        move $t3, $v0       # load n to limit register $t3

        la $a0, OutMsg      # load OutMsg to $a0
        li $v0, 4           # load "print string" code to $v0
        syscall             # execute print statement

        beq $t2, $t0, continue  
        beq $t3, $t0, continue  # if m or n == 0, jump to continue

        bltz $t2, default     # if m < 0, jump to default
        bltz $t3, n_neg     # if n < 0, jump to n_neg

default:                    # default case: m can be either pos or neg, n must be pos
        bltz $t3, both_neg  # if both m and n are neg, send it to both_neg for processing
        add $t0, $t0, $t2   # sum += m
        addi $t1, $t1, 1    # counter++
        ble $t1, $t3, default # while counter <= n
        j continue          # jump to continue

n_neg:      # case if n is negative; make n positive and send it to default
        bltz $t2, both_neg  # if both m and n are neg, send it to both_neg for processing
        add $t0, $t0, $t3   # sum += n
        addi $t1, $t1, 1    # counter++
        ble  $t1, $t2, n_neg # while counter <= m
        j continue          # jump to continue

both_neg:
        li $t4, -1          # load temp variable -1 to $t4
        mul $t2, $t2, $t4   # multiply m by (-1) to make it positive
        mul $t3, $t3, $t4   # multiply n by (-1) to make it positive
        j default           # process m and n and send it to the default case

continue:   # print result and terminate execution
        li $v0, 1           # load "print integer" code to $v0
        move $a0, $t0       # load sum to $a0
        syscall             # execute print statement

        la $a0, NewLine   # load NewJeans to $a0
        li $v0, 4           # load "print string" code to $v0
        syscall             # execute print statement

        li $v0, 10          # load "stop" code
        syscall             # terminate execution

