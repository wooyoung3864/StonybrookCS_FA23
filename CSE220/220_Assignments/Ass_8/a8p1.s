# 1. Write a MIPS assembly-language function that divides two positive numbers and returns the quotient and remainder.
# 	a. The dividend and divisor should be passed in $a0 and $a1.
# 	b. The quotient and remainder should be returned in $v0 and $v1.
# 	c. Other than result registers, any registers whose contents are modified should have contents saved and restored appropriately.
#
# 	Write a "main" that appropriately tests the function.
#
# 	Be sure to include meaningful comments in your code.

.data
	prompt: .asciiz "\nEnter a positive dividend and divisor, each followed by the Enter key: \n"
	out_quotient: .asciiz "The quotient is: "
	out_remainder: .asciiz "The remainder is: "

.text
main:
	la $a0, prompt
	li $v0, 4
	syscall		# load and print input prompt

	li $v0, 5
	syscall		# read input into $v0
	move $a0, $v0	# move input (dividend) to $a0 to pass as an argument for divide

	li $v0, 5
	syscall		# read input into $v0
	move $a1, $v0  	# move input (divisor) to $a1 to pass as an argument for divide

	jal divide	# jump and link to divide function

	move $t0, $v0	# move return value in $v0 (quotient) to $t0 for temporary storage
	move $t1, $v1	# move return value in $v1 (remainder) to $t1 for temporary storage

	la $a0, out_quotient
	li $v0, 4
	syscall		# load and print output message for quotient

	li $v0, 1
	move $a0, $t0
	syscall		# move quotient stored in $t0 to $a0 and print

	li $v0, 11
	li $a0, 10
	syscall		# load and print newline character

	la $a0, out_remainder
	li $v0, 4
	syscall		# load and print output message for remainder

	li $v0, 1
	move $a0, $t1	# move remainder stored in $t1 to $a0 and print
	syscall

	li $v0, 11
	li $a0, 10
	syscall		# load and print newline character

	j terminate	# terminate execution

divide:
	addi $sp, $sp, -12	# allocate stack space for 3 registers
	sw $a0, 8($sp)		# stack.push($a0)
	sw $a1, 4($sp)		# stack.push($a1)
	sw $ra, 0($sp)		# stack.push($ra)
	
	move $s0, $a0		# save dividend in $s0, the scope of the entire function
	addi $s2, $s2, 0	# int quotient = 0

	bge $a0, $a1, else
	li $v0, 0
	move $v1, $a0		# base case: if dividend < divisor, return 0 as the quotient and dividend as the remainder

	addi $sp, $sp, 12	# deallocate stack space
	jr $ra			# return base case

	else:			# if dividend >= divisor, proceed to recursive case
		addi $s2, $s2, 1	# quotient++
		sub $s0, $s0, $a1	# dividend = dividend - divisor
		move $a0, $s0
		jal divide		# recursive call: divide (dividend - divisor, divisor)

		lw $ra, 0($sp)	# stack.pop($ra)
		lw $a1, 4($sp)	# stack.pop($a1)
		lw $a0, 8($sp)	# stack.pop($a0)
		addi $sp, $sp, 12 # deallocate stack space
		move $v0, $s2	# move quotient to return register
		move $v1, $s0	# move remainder to return register
	
		jr $ra			# return recursive case

terminate:
	li $v0, 10
	syscall


