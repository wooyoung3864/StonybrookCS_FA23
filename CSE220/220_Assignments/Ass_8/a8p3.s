# 3. Write a MIPS assemly-language version of the strcmp function in C.
# 	@param
# 		$a0: base address of the first string (char* s1)
# 		$a1: base address of the second string (char* s2)
# 	@return
# 		$v0: lexicographical comparison of the two strings;
# 			s1 > s2 -> 1
# 			s1 == s2 -> 0
# 			s1 < s2 -> -1

.data
	s1: .asciiz "Hello"
	s2: .asciiz "Hellong"

	out_msg: .asciiz "\nLexicographical comparison of the two strings: "

.text
main:
	la $a0, s1
	la $a1, s2	# load s1 and s2 into argument registers for strcmp
	
	jal strcmp	# call strcmp

	move $t0, $v0	# store return value of strcmp in $t0

	li $v0, 4
	la $a0, out_msg
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 10
	syscall

strcmp:
	addi $sp, $sp, -16
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $t0, 8($sp)
	sw $t1, 12($sp)		# allocate stack space and store 4 registers

	loop:
		lb $t0, 0($a0)
		lb $t1, 0($a1)	# dereference s1 and s2
		
		bgt $t0, $t1, one
		blt $t0, $t1, neg_one

		bne $t0, $0, incr_s1
		bne $t1, $0, incr_s2

		equals: li $v0, 0
			j done

		incr_s1:
			addi $a0, $a0, 1
			bne $t1, 0, incr_s2
			j loop
		incr_s2:
			addi $a1, $a1, 1
			j loop
		one:
			li $v0, 1
			j done
		neg_one:
			li $v0, -1
			j done
	
	done:	lw $t1, 12($sp)
		lw $t0, 8($sp)
		lw $a1, 4($sp)
		lw $a0, 0($sp)
		addi $sp, $sp, 16	# load 4 registers and deallocate stack space
		jr $ra			# return

	
