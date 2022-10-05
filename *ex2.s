.data



.text

main:
	addi $t0, $zero, 10
	addi $t1, $zero, 20
	addi $t2, $zero, 6

	addi $t0, $t0, 4
	sub $t1, $t1, $t2

	sub $t3, $t0, $t1
	
	li $v0, 1
	add $a0, $zero, $t3
	syscall
	
	li $v0, 10
	syscall
