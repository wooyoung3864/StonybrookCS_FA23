# 2. Write a MIPS assembly-language program that does the following:
#       (a) Reads two integers, a dividend and divisor.
#       (b) Divides the two using only repeated subtraction.
#       (c) Prints the quotient and remainder from the division.

.data
        In_dividend: .asciiz "\nEnter dividend: "
        In_divisor: .asciiz "\nEnter divisor: "

        Out_quotient: .asciiz "\nThe quotient is: "
        Out_remainder: .asciiz "\nThe remainder is: "

        Div_by_zero: .asciiz "\nError: division by zero!"

        New_line: .asciiz "\n"

.text
main:
        la $a0, In_dividend
        li $v0, 4
        syscall                 # print In_dividend
        li $v0, 5
        syscall                 # read dividend
        move $t0, $v0           # store dividend in $t0

        la $a0, In_divisor
        li $v0, 4
        syscall                 # print In_divisor
        li $v0, 5               
        syscall                 # read divisor
        move $t1, $v0           # store divisor in $t1

        li $t3, 0               # int counter = 0 in $t3

        li $t4, 0               # dividend_sign = 0 (positive by default)
        li $t5, 0               # divisor_sign = 0 (positive by default)

        beq $t1, $zero, div_by_zero    # handle division by zero
        beq $t0, $zero, result  # print 0 and 0 if dividend is zero

        bltz $t0, flip_dividend    # flip sign of dividend if it is negative
        bltz $t1, flip_divisor      # flip sign of divisor if it is negative
        blt $t0, $t1, blt_dividend_divisor  # if dividend < divisor, send to special case

        j default               # jump to default case if both inputs are positive

div_by_zero:
        la $a0, Div_by_zero
        li $v0, 4
        syscall

        j exit 

flip_dividend:
        sub $t0, $zero, $t0       # dividend = 0 - dividend
        li $t4, 1               # dividend_sign = 1 if negative, 0 if positive
        bltz $t1, flip_divisor      # flip sign of divisor if it is negative
        blt $t0, $t1, blt_dividend_divisor  # if dividend < divisor, send to special case
        j default               # jump to default case otherwise

flip_divisor:
        sub $t1, $zero, $t1       # divisor = 0 - divisor
        li $t5, 1               # divisor_sign = 1 if negative, 0 if positive
        blt $t0, $t1, blt_dividend_divisor  # if dividend < divisor, send to special case

default:
        sub $t0, $t0, $t1       # dividend -= divisor
        addi $t3, $t3, 1        # counter++
        bge $t0, $t1, default   # while (dividend >= divisor)
        j result

blt_dividend_divisor:
        li $t3, 0               # set quotient to 0
        blez $t4, print_result  # if dividend is positive, results will be positive
        bgtz $t4, flip_both     # if dividend is negative, make remainder negative

result:
    bgtz $t5, flip_quotient     # if divisor is negative, make quotient negative
    bgtz $t4, flip_both         # if dividend is negative, make both quotient and remainder negative

    j print_result              # jump to print if dividend and divisor are positive

flip_quotient:
    bgtz $t4, print_result      # if both dividend and divisor are negative, results will be positive
    sub $t3, $zero, $t3           # quotient = 0 - quotient
    j print_result

flip_both:
    sub $t3, $zero, $t3           # quotient = 0 - quotient
    sub $t0, $zero, $t0           # remainder = 0 - remainder

print_result:
        la $a0, Out_quotient
        li $v0, 4
        syscall             # print Out_quotient
        li $v0, 1
        move $a0, $t3
        syscall             # print quotient

        la $a0, Out_remainder
        li $v0, 4
        syscall             # print Out_remainder
        li $v0, 1
        move $a0, $t0
        syscall             # print remainder

exit:
        la $a0, New_line     
        li $v0, 4
        syscall             # print newline character    

        li $v0, 10              # load syscode 10 (terminate execution) to $v0
        syscall                 # terminate execution

