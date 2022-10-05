.data
	string1: .asciiz "Digite um numero: "
	string2: .asciiz "Resultado: "
.text
main:
	la $a0, string1 
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $a0, $v0

	jal Fat
	
	move $t0, $v0
	
	la $a0, string2
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
Fat:
	addi $sp, $sp, -8
	sw $a0, 4($sp)
	sw $ra, 8($sp)
	
	slti $t0, $a0, 1
	beq $t0, $zero, L1
	
	li $v0, 1
	addi $sp, $sp, 8
	jr $ra
	
L1:
	addi $a0, $a0, -1
	jal Fat
	
	lw $a0, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 8
	
	mul $v0, $v0, $a0
	
	jr $ra
