.data
d:	.dword 0x0123456789ABCDEF
.text
	la s0, d ## so = 0x0123456789ABCDEF
	## ld 64 bits
	ld s1, 0(s0) ## s1 = 0x0123456789ABCDEF
	## lb 8 bits
	lb s2, 0(s0) ## s2 = 0xFFFFFFFFFFFFFFEF
	## 01 7
	## 23 6
	## 45 5
	## 67 4
	## 89 3
	## AB 2
	## CD 1*
	## EF 0
	lb s3, 1(s0) ## s3 = 0xFFFFFFFFFFFFFFCD
	## 01 7
	## 23 6
	## 45 5
	## 67 4
	## 89 3
	## AB 2*
	## CD 1
	## EF 0
	lbu s4, 2(s0) ## s4 = 0x00000000000000AB
	## lw 32 bits
	lw s5, 0(s0) ## s5 = 0xFFFFFFFF89ABCDEF
	## lhu 16 bits
	## 01 7
	## 23 6
	## 45 5
	## 67 4*
	## 89 3
	## AB 2
	## CD 1
	## EF 0
	lhu s6, 4(s0) ## s6 = 0x0000000000004567
	lwu s7, 2(s0) ## s7 = Error - Load address not aligned to word boundary
	## Puis que lw est de 32 bits il n'est pas possible de prendre les bits à partir de 2, car le nombre est séparé
	## en deux nombre 0x01234567 et 0x89ABCDEF à la position 2 nous enpiètons sur les deux nombre : 0x4567 du premier et 0x89AB du deuxième
	## lwu s7, 4(s0) foncionerait car nous aurions le premier 32 bits
	
	