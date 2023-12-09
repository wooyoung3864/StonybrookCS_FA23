# 2. Write an algorithm and code to
#       (a) read an integer
#       (b) search for it in an array
#       (c) print "FOUND." or "NOT FOUND :-("

.data
    A: .word 10, 11, -4, 6, 1, 4, 42, -11, 0, 3
    in_prompt: .asciiz "Enter an integer: "
    found: .asciiz "FOUND."
    not_found: .asciiz "NOT FOUND :-("

.text
main:
    li $t0, 0       # int counter = 0
    li $t1, 10      # int limit = 0
    la $t2, A       # int *p = &A

    li $v0, 4
    la $a0, in_prompt
    syscall

    li $v0, 5
    syscall
    move $t3, $v0   # read integer and store it at $t3

traverse_array:
    lw $t4, 0($t2)  # load word item at address $t2 with offset 0, to $t4
    beq $t3, $t4, is_found  # (if $t2 == *$t4) is_found
    addi $t0, $t0, 1    # counter++
    addi $t2, $t2, 4    # pointer += 4
    bne $t0, $t1, traverse_array    # while(counter != limit)
    j is_not_found

is_found:
    la $a0, found
    j print_result

is_not_found:
    la $a0, not_found

print_result:
    li $v0, 4
    syscall         # print found

    li $v0, 11
    la $a0, 10
    syscall         # print newline character
    
terminate:
        li $v0, 10
        syscall

