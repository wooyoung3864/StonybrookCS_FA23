# Write a program to: 
# (i) read a number,
# (ii) print EVEN or ODD, according to its parity

.data
        prompt: .asciiz "Enter a number: "
        even: .asciiz "\nEVEN\n"
        odd: .asciiz "\nODD\n"

.text
main:
        la $a0, prompt
        li $v0, 4
        syscall

        li $v0, 5
        syscall
        move $t0, $v0      # store input in #t0

        andi $t1, $t0, 1
        beq $t1, $zero, is_even

is_odd:
        la $a0, odd
        j print_result

is_even:
        la $a0, even
        
print_result:
        li $v0, 4
        syscall
        
terminate:
        li $v0, 10
        syscall