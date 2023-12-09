#  Recursive factorial in MIPS assembly
#  	@param
# 		$a0: int x
# 	@return
#		$v0: x!

.text
main:
	li $a0, 5
	jal factorial
	
	move $a0, $v0
	li $v0, 1
	syscall

	li $v0, 10
	syscall

factorial:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $t0, 8($sp)

	li $t0, 1
	beq $a0, $t0, base
	j recur

	base:
		li $v0, 1
		j done

	recur:
		move $t0, $a0
		addi $a0, $a0, -1
		jal factorial
		mul $v0, $v0, $t0

	done:
		lw $t0, 8($sp)
		lw $a0, 4($sp)
		lw $ra, 0($sp)
		addi $sp, $sp, 12
		jr $ra


