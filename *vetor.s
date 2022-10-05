.data 
    bvindo: .asciiz "Seja bem vindo!
    por favor entre com um valor inteiro para pesquisar no vetor
    
    "
    resultado: .asciiz "Elemento encontrado"
    vetor: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, -100
.text   
    main: 
        li $v0, 4
        la $a0, bvindo
        syscall

        li $v0, 5
        move $t0, $v0
        syscall
    
        addi $t6, $zero, -100
        li $s2, 0
        
        while:
            beq $s2, $t6, else
            j if
            srl $s1, $s2, 4
            add $s2, $zero, $s1

        if:
            bne $s2, $t0, while
            li $v0, 4
            la $a0, resultado
            syscall
            j sair

        else:
            li $v0, 4
            la $a0, resultado
            syscall
            j sair

        sair:
            li $v0, 10
            syscall
