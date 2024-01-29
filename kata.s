.data
	n1:	.word 0		# premier nombre (32 bits signé)
	n2:	.word 0		# second nombre (32 bits signé)

	.eqv readint, 5
	.eqv printint, 1
	.eqv printchar, 11
	.eqv exit, 10

.text
	li a7, readint
	ecall
	sw a0, n1, t0
	
	ecall
	sw a0, n2, t0
	
	li a7, printint
	lw a0, n1
	ecall
	
	li a7, printchar
	li a0, '\n'
	ecall
	
	li a7, printint
	lw a0, n2
	ecall
	
	li a7, exit
	ecall