.data
	tab: .word 10, 10, -6, 20, 1, 1, 8, 800, -800, -2
	.eqv print, 1
	.eqv exit, 10
.text
	la s0, tab
	li s1, 10
	lw s2, 0(s0)
	
loop:
	lw s3, 0(s0)
	bge s2, s3, saut
	mv s2, s3
saut:
	addi s0, s0, 4
	addi s1, s1, -1
	beqz s1, fin
	j loop
fin:
	li a7, print
	mv a0, s2
	ecall
	
	li a7, exit
	ecall 