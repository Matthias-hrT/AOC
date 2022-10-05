.data

string1: .asciiz "Add: "
string2: .asciiz " Sub: "

.text

main:
	li $t0, 5
	sw $t0, 40($sp)
	
	li $t1, 20
	sw $t1, 160($sp)
	
	add $t3, $t0, $t1
	sw $t3, 400($sp)
	
	lw $t2, 40($sp)
	lw $t4, 160($sp)
	
	sub $t5, $t2, $t4
	sw $t5, 360($sp)
	
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 1
	lw $a0, 400($sp)
	syscall
	
	li $v0, 4
	la $a0, string2
	syscall
	
	li $v0, 1	
	lw $a0, 360($sp)
	syscall

	li $v0, 10
	syscall
