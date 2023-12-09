.data
    InMsg:    .asciiz "\n\nEnter a number: "
    OutMsg:   .asciiz "\nThe sum is: "

.text
main:   la $a0, InMsg       # put address of InMsg in $a0
        li $v0, 4           # put code for print string in $v0
        syscall             # execute print statement

        li $t0, 0           # sum = 0
        li $t1, 1           # counter = 1
        li $v0, 5           # load code for "read integer"
        syscall             # read integer N
        move $t2, $v0       # move N+1 into limit register

        la $a0, OutMsg      # put address of OutMsg in $a0
        li $v0, 4           # put code for print string in $v0
        syscall             # execute print statement

again:  add $t0, $t0, $t1   # sum += counter
        addi $t1, $t1, 1    # increment counter by 1
        ble $t1, $t2, again # while counter <= N

        li $v0, 1  
        move $a0, $t0       # prepare argument (Sum)
        syscall             # will print integer in $a0
        li $v0, 10          # load code for "stop"
        syscall             # end execution


