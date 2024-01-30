.data
	.eqv read, 8
	.eqv write, 11
	.eqv exit, 10
	.eqv maxchar, 100
	buffer: .space maxchar

.text
	la s0, buffer

	li a7, read
	mv a0, s0
	li a1, maxchar
	ecall
	
	mv s1, s0
	
loop:
	lbu s2, 0(s1)
	beqz s2, printloop
	addi s1, s1, 1
	j loop
	
printloop: 
	blt  s1, s0, end
	li a7, write
	lbu a0, 0(s1)
	ecall
	addi s1, s1, -1
	j printloop
	
end:
	li a7, exit
	ecall