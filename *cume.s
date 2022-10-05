.data 
string: .asciiz "No alto daquele cume
Plantei uma roseira
O vento no cume bate
A rosa no cume cheira

Quando vem a chuva fina
Salpicos no cume caem
Formigas no cume entram
Abelhas do cume saem

Quando cai a chuva grossa
A água do cume desce
O barro do cume escorre
O mato no cume cresce

Então, quando cessa a chuva
No cume volta a alegria
Pois torna a brilhar de novo
O Sol que no cume ardia"

.text

main:
	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 10
	syscall
