.data
bott01: .string " bottles of beer on the wall, "
bott02:	.string " bottles of beer.\nTake one down and pass it around, "
bott03: .string " bottles of beer on the wall.\n\n"

bottend01: .string "1 bottle of beer on the wall.\n\n1 bottle of beer on the wall, 1 bottle of beer.\n"
bottend02: .string "Take one down and pass it around, no more bottles of beer on the wall.\n\nNo more "
bottend03: .string "bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some"
bottend04: .string " more, 99 bottles of beer on the wall.\n"

.eqv writeint, 1
.eqv writestring, 4
.eqv exit, 10

.text
###################
	li t0, 99
	li t1, 1
	
loop:
	li a7, writeint
	mv a0, t0
	ecall
	
	li a7, writestring
	la a0, bott01
	ecall
	
	li a7, writeint
	mv a0, t0
	ecall
	
	li a7, writestring
	la a0, bott02
	ecall
	
	addi t0, t0, -1
	
	beq t0, t1, end
	
	li a7, writeint
	mv a0, t0
	ecall
	
	li a7, writestring
	la a0, bott03
	ecall
	
	j loop
	
end:
	li a7, writestring
	la a0, bottend01
	ecall
	
	la a0, bottend02
	ecall
	
	la a0, bottend03
	ecall
	
	la a0, bottend04
	ecall
	
	li a7, exit
	ecall
	