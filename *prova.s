.data
	v1: .word 5, 10, 15, 20, 25, 30, 35, 40
	v2: .word 0, 10, -15, 16, 20, 30, 40, 50
	v3: .word 0, 0, 0, 0, 0, 0, 0, 0
.text
main:
	li $t4, 8
	li $s2, 0
	li $s3, 1
	la $s4, v1
	la $s5, v2
	la $s6, v3
	
jaime: 
	sll $s6, $s2, 2
	add $s6, $s4, $s5
	beq $s3, $t4, sair
	addi $s3, $s3, 1
	j jaime
	
sair:
	li $v0, 1
	move $a0, $s6
	syscall
	
	li $v0, 10
	syscall
