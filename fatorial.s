.data
    resultado: .asciiz "Resultado: "
.text
main:
    addi $s0, $zero, 7
    addi $v1, $zero, 1 
    addi $s2, $zero, 1
    addi $s3, $zero, 0
    addi $t0, $zero, 0

    jal calculaFatorial
    
    la $a0, resultado
    li $v0, 4
    syscall

    move $a0, $v1
    li $v0, 1
    syscall
    
    li $v0, 10
    syscall

calculaFatorial:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $v1, 4($sp)

    beq $s2, $s0, fim
    addi $t0, $s2, 1
    j loop

loop:
    beq   $t0, $zero, adiciona
    add   $s3, $s3, $v1
    addi $t0, $t0 , -1
    j     loop

adiciona:
    add $v1, $zero, $s3
    sub $s3, $s3, $v1
    addi $s2, $s2, 1
    j calculaFatorial

fim:
    lw $ra, 0($sp)
    lw $v1, 4($sp)
    addi $sp, $sp, 8
    jr $ra
