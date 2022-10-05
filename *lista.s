.data

.text
	main:
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 5
		syscall 
		move $t1, $v0

	Multi:
		beq $t1, $zero, Sair
		addi $t1, $t1, -1
		add $s1, $s1, $t0
		
		j Multi

	Sair:
		li $v0, 1
		move $a0, $s0
		syscall		
		
		li $v0, 10
		syscall 
