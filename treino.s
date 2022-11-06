.data 
	saldoEh: .asciiz "O saldo da sua conta e: "
	salario: .asciiz "Entre com seu salario: " 
	divida: .asciiz "Entre com sua divida: "
    continuar: .asciiz "\nDigite 1 para continuar ou 0 para sair: "
.text

main: 
    li $t0, 0 # $t0 = 0
    li $s0, 0 # $s0 = 0
    li $s1, 0 # $s1 = 0

    la $a0, salario #carrega o endereáo de salario em a0
    li $v0, 4 #system call para imprimir a string
    syscall #chama o sistema para imprimir a string
    li $v0, 5 #system call para ler um inteiro
    syscall #chama a system call para ler um inteiro
    move $s0, $v0 #move o valor lido para s0
	
    #recebe a divida
    la $a0, divida #carrega o endereáo de divida em a0
    li $v0, 4 #system call para imprimir a string
    syscall #chama o sistema para imprimir a string
    li $v0, 5 #system call para ler um inteiro
    syscall #chama a system call para ler um inteiro
    move $s1, $v0 #move o valor lido para s1

    #chama a funá∆o para imprimir o saldo
    jal imprimeSaldo #chama a funá∆o imprimeSaldo
    
    la $a0, continuar #carrega o endereáo de continuar em a0
    li $v0, 4 #system call para imprimir a string
    syscall #chama o sistema para imprimir a string
    li $v0, 5 #system call para ler um inteiro
    syscall #chama a system call para ler um inteiro
    move $t0, $v0 #move o valor lido para t0

    beq $t0, $0, fim #se t0 for igual a 0, vai para fim
    j main #se n∆o, volta para o main

imprimeSaldo:
    addi $sp, $sp, -12 #desloca o ponteiro de pilha
    sw $ra, 0($sp) #salva o valor de $ra na pilha
    sw $s0, 4($sp) #salva o valor de $s0 na pilha
    sw $s1, 8($sp) #salva o valor de $s1 na pilha

    #calcula o saldo
    jal saldoDisponivel #chama a funá∆o saldoDisponivel

    #imprime o saldo
    la $a0, saldoEh #carrega o endereáo de saldoEh em a0
    li $v0, 4 #system call para imprimir a string
    syscall #chama o sistema para imprimir a string
    move $a0, $v1 #move o valor de v1 para a0  
    li $v0, 1 #system call para imprimir um inteiro
    syscall #chama o sistema para imprimir o inteiro

    #restaura os valores de $ra, $s0 e $s1
    lw $ra, 0($sp) #restaura o valor de $ra
    lw $s0, 4($sp) #restaura o valor de $s0
    lw $s1, 8($sp) #restaura o valor de $s1
    addi $sp, $sp, 12 #desloca o ponteiro de pilha
    jr $ra #retorna para o endereáo de retorno

saldoDisponivel:
    addi $sp, $sp, -12 #desloca o ponteiro de pilha
    sw $ra, 0($sp) #salva o valor de $ra na pilha
    sw $s0, 4($sp) #salva o valor de $s0 na pilha
    sw $s1, 8($sp) #salva o valor de $s1 na pilha

    li $s2, 0 #inicializa s2 com 0

    #soma saldo e salario
    jal somaSaldo #chama a funá∆o somaSaldo

    #subtrai divida do saldo
    jal subtraiSaldo #chama a funá∆o subtraiSaldo

    move $v1, $s2 #move o valor de s2 para v1

    #restaura os valores de $ra e $s0 e $s1
    lw $ra, 0($sp) #restaura o valor de $ra
    lw $s0, 4($sp) #restaura o valor de $s0
    lw $s1, 8($sp) #restaura o valor de $s1
    addi $sp, $sp, 12 #desloca o ponteiro de pilha
    jr $ra #retorna para o endereáo de retorno

somaSaldo:
    addi $sp, $sp, -12 #desloca o ponteiro de pilha
    sw $ra, 0($sp) #salva o valor de $ra na pilha
    sw $s0, 4($sp) #salva o valor de $s0 na pilha
    sw $s1, 8($sp) #salva o valor de $s1 na pilha

    add $s2, $s2, $s0 #soma o valor de s2 com o valor de s0

    #restaura os valores de $ra e $s0 e $s1
    lw $ra, 0($sp) #restaura o valor de $ra
    lw $s0, 4($sp) #restaura o valor de $s0
    lw $s1, 8($sp) #restaura o valor de $s1
    addi $sp, $sp, 12 #desloca o ponteiro de pilha
    jr $ra #retorna para o endereáo de retorno

subtraiSaldo:
    addi $sp, $sp, -12 #desloca o ponteiro de pilha
    sw $ra, 0($sp) #salva o valor de $ra na pilha
    sw $s0, 4($sp) #salva o valor de $s0 na pilha
    sw $s1, 8($sp) #salva o valor de $s1 na pilha

    sub $s2, $s2, $s1 #subtrai s1 de s2 e armazena em s2

    #restaura os valores de $ra e $s0 e $s1
    lw $ra, 0($sp) #restaura o valor de $ra
    lw $s0, 4($sp) #restaura o valor de $s0
    lw $s1, 8($sp) #restaura o valor de $s1
    addi $sp, $sp, 12 #desloca o ponteiro de pilha
    jr $ra #retorna para o endereáo de retorno

fim:
    li $v0, 10 #system call para encerrar o programa
    syscall #chama a system call para encerrar o programa