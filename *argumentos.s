.data
	string1: .asciiz "Digite um número: "
	string2: .asciiz "Resultado: "
.text

main:
	la $a0, string1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $a1, $v0
	
	la $a0, string1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $a2, $v0
	
	la $a0, string2
	li $v0, 5
	syscall
	
	jal soma

	move $a0, $v0
	li $v0, 1
	syscall
	
	j exit 	
soma:
	addi $sp, $sp, -4
	sw $ra, 4($sp)
	
	add $v0, $a0, $a1
	
	lw $ra, 4($sp)
	
	jr $ra

exit:
	li $v0, 10
	syscall
