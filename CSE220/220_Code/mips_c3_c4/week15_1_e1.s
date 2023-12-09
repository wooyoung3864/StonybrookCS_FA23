# Recursion (continued)
# Split a problem of size n into two subproblems of size k and size n-k.
# k for the base case, n-k for the recursive case
# split (n-k) into (n-k)' and k, and perform recursion again.
# Eventually, (n-k) also becomes size k, which can be evaluated as the base case.

# 1. Write and test a recursive function to compute the sum of each element of an int array.
#	@param
#		$a0: base address of A
#		$a1: size
#	@return
#		$v0: result

# 2. Write and test a recursive function to find the largest number in an array.
# 	@param
# 		$a0: base address of A
# 		$a1: size

.data
	prompt: .asciiz "\nThe sum is: "
	prompt2: .asciiz "\nThe largest element is: "
	array: .word 32, 40, -67, 28, 19, 31, 56, 8, 93, 57
	size: .word 10

.text
main:
	la $a0, array	# load pointer to array to $a0
	lw $a1, size	# load size of array to $a1

	jal array_sum	# function call

	move $t0, $v0	# move sum to $t0 for storage

	la $a0, prompt
	li $v0, 4
	syscall

	li $v0, 1
	move $a0, $t0	# move sum in $to to $a0 for printing
	syscall

	la $a0, array
	lw $a1, size

	jal array_max

	move $t0, $v0

	la $a0, prompt2
	li $v0, 4
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	j terminate

array_sum:
	addi $sp, $sp, -8	# allocate stack space for 2 registers: $t0 and $ra
	sw $t0, 4($sp)		# stack.push($t0)
	sw $ra, 0($sp)		# stack.push($ra)
	
	li $t1, 1		# base case: array of size 1
	bne $a1, $t1, else	# goto recursive case if index < size
	lw $v0, 0($a0)		# int curr = *$a0
	addi $sp, $sp, 8	# deallocate stack space
	jr $ra			# return base case
	j done
	else:	lw $t0, 0($a0)	# load the first element
		addi $a0, $a0, 4 # recursive case: increment array pointer by 4
		addi $a1, $a1, -1 # size--
		jal array_sum	# recursive call
		add $v0, $v0, $t0	# sum += array_sum(n-1)	
	done:
		lw $ra, 0($sp)	# stack.pop($ra)
		lw $t0, 4($sp)	# stack.pop($t0)
		addi $sp, $sp, 8 # deallocate stack space
			jr $ra		# return recursive case

array_max:
	addi $sp, $sp, -16	# allocate stack space for 4 registers: $ra, $t0, $a0, $a1
	sw $ra, 0($sp)		# stack.push($ra)
	sw $t0, 4($sp)		# stack.push($t0)
	sw $a0, 8($sp)		# stack.push($a0)
	sw $a1, 12($sp)		# stack.push($a1)

	li $t1, 1
	bne $a1, $t1, recur	# when N != 1
		#
		# base case: array of size 1
		#
	lw $v0, 0($a0)		# return the single (last) element
	j done2

	recur: lw $t0, 0($a0)   # load the first element
	addi $a0, $a0, 4	# pointer++
	addi $a1, $a1, -1	# size--
	jal array_max
	bgt $t0, $v0, swap_max
	j done2
	swap_max:
		move $v0, $t0
	done2: lw $a0, 12($sp)	# stack.pop($a0)
	      lw $a1, 8($sp)	# stack.pop($a1)
	      lw $t0, 4($sp)	# stack.pop($t0)
	      lw $ra, 0($sp) 	# stack.pop($ra)
	      addi $sp, $sp, 16	# deallocate stack space
	      jr $ra		# return from function

terminate:
	li $v0, 10
	syscall


