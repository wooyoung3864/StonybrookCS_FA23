# 3. Write a MIPS assembly-language program that reads an integer N and prints an asterisk-pyramid of N lines. 
#    For example, if N is 4, then the output should be
#     *        
#    ***
#   *****     
#  ******* .

.data
        asterisk: .asciiz "*"
        space: .asciiz " "
        new_line: .asciiz "\n"
        prompt: .asciiz "\nEnter a positive integer n: "

.text
.globl main

main:
        li $t0, 1       # int i = 1

        la $a0, prompt
        li $v0, 4
        syscall         # print prompt

        li $v0, 5       # load syscode 5 (read integer) into $v0
        syscall         # read input
        move $t1, $v0   # int n = input

        la $a0, new_line
        li $v0, 4
        syscall         # print newline character

        move $t3, $t1   # int m = n
        addi $t3, $t3, -1 # m = m-1

        move $t4, $t1   # int k = n

outer_loop:
        li $t2, 1                       # int j = 1

        inner_loop:
            bgt $t2, $t3, print_ast     # if(j > m)
            j print_space

            print_ast: 
                la $a0, asterisk
                j continue

            print_space:
                la $a0, space

            continue:
                li $v0, 4
                syscall

                addi $t2, $t2, 1    # j++
        ble $t2, $t4, inner_loop    # while(j <= k)

        addi $t3, $t3, -1           # m--
        addi $t4, $t4, 1            # k++

        la $a0, new_line
        li $v0, 4               
        syscall                     # print newline character

        addi $t0, $t0, 1            #i++
        ble $t0, $t1, outer_loop    # while i <= n

        li $v0, 10
        syscall                     # terminate execution

