# 2. Write a MIPS assembly-language function that counts the number of times a given number appears in an array.
#	@param
# 		$a0: base address of the array
# 		$a1: length of the array
# 		$a2: the number to be searched
# 	@return
# 		$v0: result of the search, i.e., number of occurrences of the given number in the array

.data
	array: .word 1, 2, 2, 2, 4, 2, 5, 2, 6
	out_msg: .asciiz "\nThe number of occurrences of the number 2 in the array is: " # result must be 5

.text
main:
	la $a0, out_msg
	li $v0, 4
	syscall

	la $a0, array
	li $a1, 9
	li $a2, 2
	jal num_occurrences	# call function

	move $a0, $v0
	li $v0, 1
	syscall			# load and print number of occurrences returned by the function

	li $v0, 11
	li $a0, 10
	syscall			# printf("%c", '\n');

	li $v0, 10
	syscall

num_occurrences:
	addi $sp, $sp, -20	# allocate space for 5 registers
	sw $ra, 0($sp)		# stack.push($ra)
	sw $a0, 4($sp)		# stack.push($a0)
	sw $a1, 8($sp)		# stack.push($a1)
	sw $a2, 12($sp)		# stack.push($a2)
	sw $t0, 16($sp)		# stack.push($t0)

	li $t0, 1		# load 1 into $t0 for comparison
	beq $a1, $t0, base	# if length == 1, jump to base case
	j recur			# else, jump to recursive case

	base:
		lw $t0, 0($a0)	# dereference pointer and store in $t0
		beq $t0, $a2, one
		j zero
		one:
			li $v0, 1 # return 1 if *array == num
			j done
		zero:
			li $v0, 0 # else return 0
			j done

	recur:
		addi $a0, $a0, 4 # pointer + 4
		addi $a1, $a1, -1 # length - 1
		jal num_occurrences # recursive call
		lw $t0, 0($a0)      # dereference next character
		beq $t0, $a2, incr  # increment count if *array == num
		j done
		
	incr:
			addi $v0, $v0, 1  # count += 1

	done:
		lw $t0, 16($sp)
		lw $a2, 12($sp)
		lw $a1, 8($sp)
		lw $a0, 4($sp)
		lw $ra, 0($sp) # pop registers from stack
		addi $sp, $sp, 20 # deallocate stack space
		jr $ra # return


