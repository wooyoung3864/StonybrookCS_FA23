# Recursive MIPS program to print the presence of a given number in an int array
# args: $a0- int* arr, $a1- int size, $a2- int search

.data
	found_txt: .asciiz "FOUND.\n"
	nfound_txt: .asciiz "NOT FOUND :-(\n"

	array: .word 1, 2, 3, 4, 5

.text
main:
	la $a0, array
	li $a1, 5
	li $a2, 2
	jal found

	li $a1, 5
	li $a2, 6
	jal found

	li $v0, 10
	syscall

found:
	addi $sp, $sp, -24
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $t0, 16($sp)
	sw $t1, 20($sp)
	
	beqz $a1, print_nfound		# base case

	lw $t0, 0($a0)
	beq $t0, $a2, print_found  # if target element exists in array (or recursive sub-arrays)
	
	j recur

	print_found:
		move $t1, $a0
		
		la $a0, found_txt
		li $v0, 4
		syscall
		
		move $a0, $t1
		j done
	
	print_nfound:
		move $t1, $a0
		
		la $a0, nfound_txt
		li $v0, 4
		syscall
			
		move $a0, $t1
		j done
	
	recur:
		addi $a0, $a0, 4
		addi $a1, $a1, -1
		jal found

	done:
		lw $t1, 20($sp)
		lw $t0, 16($sp)
		lw $a2, 12($sp)
		lw $a1, 8($sp)
		lw $a0, 4($sp)
		lw $ra, 0($sp)
		addi $sp, $sp, 24
		jr $ra
