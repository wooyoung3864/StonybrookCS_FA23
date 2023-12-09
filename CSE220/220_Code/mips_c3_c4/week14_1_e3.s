# 3. Function find_max
#       - arguments: $a0, address of array
#                    $a1, size of array
#       - result:    $v0, largest number in array
#    main: call find_max & print result.

.data
        array: .word 7, 3, 8, -9, 4, 6, -13, 2, 1, 5
        output_prompt: .asciiz "\nThe largest number in the array is: "

.text
        main:
                la $a0, output_prompt
                li $v0, 4
                syscall

                la $a0, array      # arg 0: pointer to beginning of array
                li $a1, 10         # arg 1: size of array
                jal find_max   
                move $t0, $v0

                li $v0, 1
                move $a0, $t0
                syscall

                li $v0, 11
                li $a0, 10
                syscall

                j terminate

        find_max:
                addi $sp, $sp, -12
                sw $t0, 8($sp)
                sw $t1, 4($sp)
                sw $t2, 0($sp)

                li $t0, 1           # int counter = 1
                lb $v0, 0($a0)      # set initial value of max to first element in array

                loop:
                    lb $t1, 0($a0)      # int curr = *pointer
                    bgt $t1, $v0, update_max
                    j continue

                    update_max:
                        move $v0, $t1

                    continue:
                        addi $a0, $a0, 4    # pointer += 4
                        addi $t0, $t0, 1    # counter++
                ble $t0, $a1, loop      # loop while counter <= size
    
                lw $t2, 0($sp)
                lw $t1, 4($sp)
                lw $t0, 8($sp)
                addi $sp, $sp, 12

                jr $ra
        
        terminate:
                li $v0, 10
                syscall

