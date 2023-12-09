# Recursive MIPS assembly program to print all the negative numbers in a 10-element int array
# 	@param
#		$a0: base address of array
# 		$a1: size of array

.data
	array: .word 1, 2, -2, -34, 5, 6, -6, -94, 78, -49
.text
main:
	la $a0, array
	li $a1, 10
	jal print_neg

	li $v0, 10
	syscall

print_neg:
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $t0, 12($sp)
	sw $t1, 16($sp)

	beq $a1, $0, done
	
	lw $t0, 0($a0)
	blt $t0, $0, print
	j recur

	print:
		move $t1, $a0
		move $a0, $t0
		
		li $v0, 1
		syscall

		li $v0, 11
		li $a0, 32
		syscall

		move $a0, $t1
	
	recur:
		addi $a0, $a0, 4
		addi $a1, $a1, -1
		jal print_neg

	done:
		lw $t1, 16($sp)
		lw $t0, 12($sp)
		lw $a1, 8($sp)
		lw $a0, 4($sp)
		lw $ra, 0($sp)
		addi $sp, $sp, 20
		jr $ra


