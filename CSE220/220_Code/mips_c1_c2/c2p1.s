# 1. Write an algorithm for the following problem: 
#   - Read ten integers, one at a time, and print the largest.
# 2. Write code for the algorithm. Include appropriate input and output messages.
#   (A) First, assume all numbers are positive
#   (B) Modify algorithm and code to work for both positive and negative numbers

.data
        InMsg: .asciiz "\n\nEnter an integer: "
        OutMsg: .asciiz "\nThe largest is: "

.text
main:
        la $a0, InMsg           # load address of InMsg to $a0
        li $v0, 4               # load immediate constant 4 (code for "print string") to $v0
        syscall                 # execute print statement

        li $v0, 5               # load code for "read integer"
        syscall                 # read integer n to $v0
        move $t0, $v0           # set max to first n

        li $t1, 1               # int counter = 1
        li $t2, 10              # int limit = 10
again:
        la $a0, InMsg           # load address of InMsg to $a0
        li $v0, 4               # load immediate constant 4 (code for "print string") to $v0
        syscall                 # execute print statement

        li $v0, 5               # load code for "read integer"
        syscall                 # read integer n to $v0

        bge $t0, $v0, not_greater # if(max >= n) goto not_greater

        move $t0, $v0           # max = $v0; take in new value of max after printing out previous value

not_greater:
        la $a0, OutMsg          # load address of OutMsg to $a0
        li $v0, 4               # load immediate constant 4 (code for "print string") to $v0
        syscall                 # print(outmsg)

        li $v0, 1               # load immediate constant 1 (code for "print integer") to $v0
        move $a0, $t0           # prepare argument (max)
        syscall                 # print(max)

        addi $t1, $t1, 1        # counter++
        ble $t1, $t2, again     # while counter <= 10

        li $v0, 10              # load immediate constant 10 (code for "stop")
        syscall                 # end execution
