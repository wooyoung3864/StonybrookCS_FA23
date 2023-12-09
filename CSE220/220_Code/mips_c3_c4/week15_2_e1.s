# Write and test a recursive function to count how many times a given number appears in an array.
# 	@param
# 		$a0: base address of array
# 		$a1: size of array
# 		$a2: number to look for
# 	@return
# 		$v0: result


.data
	array: .word 1, 2, 2, 2, 5
	out_msg: .asciiz "\nNumber of occurrences of the number 2: "	

.text
main:
	la $a0, array
	li $a1, 5
	li $a2, 2	# load arguments for search

	jal search	# call search
	
	move $t0, $v0	# move search result to $t0

	la $a0, out_msg
	li $v0, 4
	syscall		# load and print output message

	move $a0, $t0
	li $v0, 1
	syscall		# load and print search result

	li $v0, 10	# exit
	syscall
	
search:
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $t0, 16($sp) # allocate stack space and store 5 registers

	li $t0, 1	# load 1 into $t0 for comparison
	beq $a1, $t0, base
	j recur

	base:
		lw $t0, 0($a0)
		beq $t0, $a2, one
		j zero

		one:
			li $v0, 1
			j done
		zero:
			li $v0, 0
			j done

	recur:
		addi $a0, $a0, 4
		addi $a1, $a1, -1
		jal search

		lw $t0, 0($a0)
		beq $t0, $a2, incr
		j done

		incr:
			addi $v0, $v0, 1

	done:
		lw $t0, 16($sp)
		lw $a2, 12($sp)
		lw $a1, 8($sp)
		lw $a0, 4($sp)
		lw $ra, 0($sp)
		addi $sp, $sp, 20  # restore registers and deallocate stack space
		jr $ra	# return

