.data




.text

main:
	addi $t0, $zero, 15
	addi $t1, $zero, 30
	add $t3, $t0, $t1
	
	#chamada de sistema para imprimir resultado
	li $v0, 1
	add $a0, $zero, $t3
	syscall
	
	#chamada de sistema para sair do programa 
	li $v0, 10
	syscall
