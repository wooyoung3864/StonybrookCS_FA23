# 3. Write and test a recursive function that goes through a string and replaces instances of a given character 
#    with instances of another character.
# 	@param
# 		$a0: base address of string
# 		$a1: character to be replaced
# 		$a2: replacing character

.data
	pre_mod: .asciiz "\nOriginal string: "
	post_mod: .asciiz "\nModified string: "
	string: .asciiz "Luck Lock Lick"
	operand: .byte 'L'
	operator: .byte 'S'

.text
main:
	la $a0, pre_mod
	li $v0, 4
	syscall			# load and print pre-mod message

	la $a0, string		# *p = string; args[0]
	li $v0, 4
	syscall

	la $a1, operand		# char *q = &operand; args[1]
	lb $a1, 0($a1)		# *q = operand
	la $a2, operator	# char *r = &operator; args[2]
	lb $a2, 0($a2)		# *r = operator
	jal replace		# call recursive function to modify certain characters

	la $a0, post_mod	
	li $v0, 4
	syscall			# load and print post-mod message

	la $a0, string
	li $v0, 4
	syscall			# load and print modified string

	j terminate		# terminate execution

replace:
	addi $sp, $sp, -20	# allocate stack space for 5 registers: $ra, $a0~2, $t0; 
				# sp = malloc(sizeof(.word) * 5)
	sw $ra, 0($sp)		# stack.push($ra)
	sw $a0, 4($sp)		# stack.push($a0)
	sw $a1, 8($sp)		# stack.push($a1)
	sw $a2, 12($sp)		# stack.push($a2)
	sw $t0, 16($sp)		# stack.push($t0)

	lb $t0, 0($a0)		# char curr = *p

	beq $t0, $0, done	# if(!curr) return
	beq $t0, $a1, swap	# if(curr == operand) jump to swap
	j recur			# else jump to recursive case

	swap:
		sb $a2, 0($a0)  # *p = operator


	recur:			# recursive case
		addi $a0, $a0, 1 # p+1

		jal replace	# replace(p+1)	

	done:
		lw $t0, 16($sp)	# stack.pop($t0)
		lw $a2, 12($sp)	# stack.pop($a2)
		lw $a1, 8($sp)  # stack.pop($a1)
		lw $a0, 4($sp)  # stack.pop($a0)
		lw $ra, 0($sp)	# stack.pop($ra)
		addi $sp, $sp, 20 # deallocate stack space; free($sp)
		jr $ra		# return

terminate:			# terminate execution
	li $v0, 10
	syscall


