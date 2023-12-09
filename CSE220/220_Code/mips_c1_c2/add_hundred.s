.data                               #assembler directives start with a .
                                    # .data field is for data that are not instructions.

.text
main:   li $t0, 0                   # sum = 0
        li $t1, 1                   # counter = 1
        li $v0, 5                   # load code for "read integer"
        syscall                     # will read integer (N)
        move $t2, $v0 
        
again:  add $t0, $t0, $t1
        addi $t1, $t1, 1
        ble $t1, $t2, again

        li $v0, 1                   # load code for "print integer"
        move $a0, $t0               # prepare argument (Sum)
        syscall                     # will print integer in $a0
        li $v0 10                   # load code for "stop"
        syscall                     # end execution