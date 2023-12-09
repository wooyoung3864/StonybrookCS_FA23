# 2. Write a MIPS assembly-language program that does the following:
#       a. Reads an entire character string in one go
#       b. Prints the string out in reverse order.
#    Be sure to include MEANINGFUL commments in your code.

.data
        prompt: .asciiz "Please enter a string: "
        out_msg: .asciiz "\nThe reversed string is: "

        MAX_LENGTH: .word 100  # #define MAX_LENGTH 100

        buffer: .space 102     # allocate 102 bytes for 102 chars; 1 byte for each char; 102 including the newline character & null terminator
.text
main:
        jal read_string

        jal input_length
        
        move $a0, $v0       # move pointer returned by input_length to $a0, as it will be used as an input argument for print_reverse_string
        move $a1, $v1       # move index returned by input_length to $a1, for the same reason as above
        jal print_reverse_string

        j terminate

read_string:
        addi $sp, $sp, -12  # allocate space for 3 registers on the stack
        sw $t0, 8($sp)      # stack.push($t0)
        sw $t1, 4($sp)      # stack.push($t1)
        sw $t2, 0($sp)      # stack.push($t2)

        li $v0, 4
        la $a0, prompt
        syscall             # load & print input prompt

        la $a0, buffer      # provide address of buffer as an input argument for "read string"
        lw $a1, MAX_LENGTH  # provide MAX_LENGTH as an input argument for "read string"
        li $v0, 8           # load immediate syscode 8, for "read string"
        syscall             # read string

        lw $t2, 0($sp)      # stack.pop($t2)
        lw $t1, 4($sp)      # stack.pop($t1)
        lw $t0, 8($sp)      # stack.pop($t0)
        addi $sp, $sp, 12   # deallocate stack space

        jr $ra              # return to caller (main)

# @return
#   $v0: a pointer to the null character in the string
#   $v1: the index of the null character in the string
# Initializes a pointer and an index at the beginning of the array,
# and increments the pointer and index until the null terminator is reached.
input_length:
        addi $sp, $sp, -12  # allocate space for 3 registers on the stack
        sw $t0, 8($sp)      # stack.push($t0)
        sw $t1, 4($sp)      # stack.push($t1)
        sw $t2, 0($sp)      # stack.push($t2)

        la $t0, buffer      # initialize a pointer to the beginning of the string
        li $t1, 0           # int index = 0;

        traverse_str:
            lb $t2, 0($t0)  # dereference a character at the index denoted by $t0
            addi $t0, $t0, 1  # pointer++
            addi $t1, $t1, 1  # index++
        bnez $t2, traverse_str # continue looping while char at index != '\0'

        move $v0, $t0       # move pointer to $v0
        move $v1, $t1       # move index to $v1

        lw $t2, 0($sp)      # stack.pop($t2)
        lw $t1, 4($sp)      # stack.pop($t1)
        lw $t0, 8($sp)      # stack.pop($t0)
        addi $sp, $sp, 12   # deallocate stack space

        jr $ra              # return to caller (main)

#  @param
#       $a0: a pointer to the null character in the string
#       #a1: the index of the null character in the string
# Takes in the aforementioned pointer and index, updated by input_length, as arguments, 
# and shifts them to the last non-null character (i.e., third-last character).
# Prints a character denoted by the pointer, and then decrements the pointer and index until the index becomes 0.
#
#   Buffer contents after reading a string "Hello World":
#   H e l l o  W o r l d \n \0
#   To reverse the string, begin at the third-last element and traverse the buffer until index 0.
#   
#   Result: d l r o W  o l l e H
print_reverse_string:
        addi $sp, $sp, -12  # allocate space for 3 registers on the stack
        sw $t0, 8($sp)      # stack.push($t0)
        sw $t1, 4($sp)      # stack.push($t1)
        sw $t2, 0($sp)      # stack.push($t2)

        move $t0, $a0       # move pointer from $a0 to $t0, as it will be modified within this function
        move $t1, $a1       # move index from $a1 to $t1, for the same reason

        addi $t0, $t0, -2   # decrement pointer by 2, to exclude the newline and null character at the end
        addi $t1, $t1, -2   # decrement index by 2, for the same reason

        li $v0, 4
        la $a0, out_msg
        syscall             # load & print output message

        traverse_str2:
            lb $t2, 0($t0)  # dereference a character denoted by the pointer
            beqz $t2, terminate  # exit if the character is null

            li $v0, 11
            move $a0, $t2
            syscall         # print the character

            addi $t0, $t0, -1       # pointer--
            addi $t1, $t1, -1       # index--
        bgez $t1, traverse_str2     # continue looping while index >= 0

        li $v0, 11
        li $a0, 10
        syscall             # load & print newline character

        lw $t2, 0($sp)      # stack.pop($t2)
        lw $t1, 4($sp)      # stack.pop($t1)
        lw $t0, 8($sp)      # stack.pop($t0)
        addi $sp, $sp, 12   # deallocate stack space

        jr $ra              # return to caller (main)

terminate:                  # terminate execution
        li $v0, 10
        syscall

