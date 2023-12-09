# 2. Write and test a recursive function to print a string in reverse.
# 	@param
# 		$a0: base address of string

.data
	string: .asciiz "Hello World!"
	prompt: .asciiz "The string in reverse order: "

.text
main:
	la $a0, prompt
	li $v0, 4
	syscall		# load and print output prompt

	la $a0, string		# char *p = string
	jal reverse_string	# recursive function to print the string in reverse order; takes in *p as an argument

	j terminate		# terminate execution

reverse_string:
	addi $sp, $sp, -12	# allocate stack space for 3 registers
	sw $ra, 0($sp)		# stack.push($ra)
	sw $a0, 4($sp)		# stack.push($a0)
	sw $t0, 8($sp)		# stack.push($t0)

	lb $t0, 0($a0)		# char curr = *p
	beq $t0, $0, done	# if (!curr) return
	
	recur:			# recursive case
		addi $a0, $a0, 1
		jal reverse_string	# recursive call: reverse_string(p+1)
		
		li $v0, 11
		move $a0, $t0
		syscall		# load and print curr

	done:
		lw $t0, 8($sp)	# stack.pop($t0)
		lw $a0, 4($sp)	# stack.pop($a0)
		lw $ra, 0($sp)	# stack.pop($ra)
		addi $sp, $sp, 12 # deallocate stack space
		jr $ra		# return

terminate:
	li $v0, 10
	syscall


