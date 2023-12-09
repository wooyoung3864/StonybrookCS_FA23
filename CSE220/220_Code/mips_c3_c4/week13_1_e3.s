# 3. (a) Write an algorithm and code to change every 'a' to 'w' in a given string
#    (b) Print the string before and after the change.

.data
        test_str: .asciiz "The man bit the dog. Again and again. What a nasty man."
        before_msg: .asciiz "Original string: "
        after_msg: .asciiz "Modified string: "
        a: .byte 'a'
        hash: .byte '#'

.text
main:
        li $v0, 4
        la $a0, before_msg
        syscall

        li $v0, 4
        la $a0, test_str
        syscall

        li $v0, 11
        li $a0, 10
        syscall

        la $t1, test_str       # char *p = &test_str[0]

        li $t5, 'a'
        li $t6, '#'

traverse_str:
        lb $t2, 0($t1)          # load byte at $t1 to $t2, with offset 0
        beq $t2, $t5, modify_char
        j continue

        modify_char:
            sb $t6, 0($t1)

        continue:
            addi $t1, $t1, 1       # p++
        bne $t2, $zero, traverse_str

print_result:
        li $v0, 4
        la $a0, after_msg
        syscall

        li $v0, 4
        la $a0, test_str
        syscall

        li $v0, 11
        li $a0, 10
        syscall

terminate:
        li $v0, 10
        syscall

