# 1. Write a program that does the following: 
#       a. Reads ten integers into an array
#       b. Prints out the elements of the array, one per line.
#       c. Sorts the integers in the array, without using another array.
#       d. Prints out the elements of the array, one per line.
#
#   The output of your program should include prompts and messages, and the code should include meaningful comments.

.data
        init_prompt: .asciiz "Enter ten integers, one followed by the Enter key. \n"
        input_prompt: .asciiz "Enter an integer: "
        print_input_prompt: .asciiz "\nInput array before sorting: \n"
        print_output_prompt: .asciiz "\nInput array after sorting: \n"

        array: .space 40        # allocate 40 bytes for the array (10 integers of 4 bytes, or 32 bits each)

.text
main:
    jal read_input

    la $a0, print_input_prompt
    li $v0, 4
    syscall             # print pre-sort prompt
    jal print_array     # print original array

    jal sort            # run sorting algorithm

    la $a0, print_output_prompt
    li $v0, 4
    syscall             # print post-sort prompt
    jal print_array     # print sorted array

    j terminate         # terminate execution

read_input:
    addi $sp, $sp, -12      # allocate space for 3 registers on the stack
    sw $t0, 8($sp)          # stack.push($t0)
    sw $t1, 4($sp)          # stack.push($t1)
    sw $t2, 0($sp)          # stack.push($t2)

    la $t0, array           # int *p = &array[0]
    li $t1, 0               # int counter = 0
    li $t2, 10              # int limit = 10
    
    la $a0, init_prompt
    li $v0, 4
    syscall                 # print initial prompt

    loop:
        la $a0, input_prompt
        li $v0, 4
        syscall             # print input prompt

        li $v0, 5
        syscall

        sb $v0, 0($t0)      # read each input into each index of the element

        addi $t0, $t0, 4    # p++ to point to next element
        addi $t1, $t1, 1    # counter++
    blt $t1, $t2, loop      # loop while counter < limit

    lw $t2, 0($sp)          # stack.pop($t2)
    lw $t1, 4($sp)          # stack.pop($t1)
    lw $t0, 8($sp)          # stack.pop($t0)
    addi $sp, $sp, 12       # deallocate stack space
    
    jr $ra                  # return to caller

print_array:
    addi $sp, $sp, -12      # allocate space for 3 registers on the stack
    sw $t0, 8($sp)          # stack.push($t0)
    sw $t1, 4($sp)          # stack.push($t1)
    sw $t2, 0($sp)          # stack.push($t2)

    la $t0, array           # int *p = &array[0]
    li $t1, 0               # int counter = 0
    li $t2, 10              # int limit = 10

    loop_2:
        li $v0, 1
        lb $a0, 0($t0)      # load each element into $a0 for printing
        syscall             # print each element

        li $v0, 11
        li $a0, 10
        syscall             # print newline character

        addi $t0, $t0, 4    # p += 4 to point to next element
        addi $t1, $t1, 1    # counter++
    blt $t1, $t2, loop_2      # loop while counter < limit

    lw $t2, 0($sp)          # stack.pop($t2)
    lw $t1, 4($sp)          # stack.pop($t1)
    lw $t0, 8($sp)          # stack.pop($t0)
    addi $sp, $sp, 12       # deallocate stack space
    
    jr $ra                  # return to caller

sort:       # bubble sort
    addi $sp, $sp, -28      # allocate space for 7 registers on the stack
    sw $s2, 24($sp)         # stack.push($s2)
    sw $s1, 20($sp)         # stack.push($s1)
    sw $s0, 16($sp)         # stack.push($s0)
    sw $t3, 12($sp)         # stack.push($t3)
    sw $t2, 8($sp)          # stack.push($t2)
    sw $t1, 4($sp)          # stack.push($t1)
    sw $t0, 0($sp)          # stack.push($t0)

    li $t0, 9               # int outer_limit = 9
    li $t1, 0               # int outer_count = 0

    li $t2, 10              # int inner_limit = 10

    la $s0, array           # int *p = &array[0]

    outer_loop:
        add $t3, $t1, 1     # inner_count = outer_count + 1
        inner_loop:
            
            lb $s1, 0($s0)       # *p
            lb $s2, 4($s0)       # *q = p + 1

            ble $s1, $s2, continue

            # if *q < *p, swap *q and *p
            sb $s1, 4($s0)
            sb $s2, 0($s0)

        continue:
            addi $s0, $s0, 4    # p++
            addi $t3, $t3, 1    # inner_count++
        blt $t3, $t2, inner_loop    # iterate while inner_count < inner_limit

        addi $t1, $t1, 1    # outer_count++
        la $s0, array       # reset p to beginning of array for next traversal of array
    blt $t1, $t0, outer_loop # iterate while outer_count < outer_limit

    lw $t0, 0($sp)          # stack.pop($t0)
    lw $t1, 4($sp)          # stack.pop($t1)
    lw $t2, 8($sp)          # stack.pop($t2)
    lw $t3, 12($sp)         # stack.pop($t3)
    lw $s0, 16($sp)         # stack.pop($s0)
    lw $s1, 20($sp)         # stack.pop($s1)
    lw $s2, 24($sp)         # stack.pop($s2)
    addi $sp, $sp, 28       # deallocate stack space

    jr $ra                  # return to caller

terminate:
        li $v0, 10
        syscall

