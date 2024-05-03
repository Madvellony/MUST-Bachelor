.text
.globl main

main:
	ori $3,$0,0xbf
	ori $4,$0,0x3a
	ori $5,$0,0x74
	xor $6,$3,$5
	or $7,$4,$5
	nor $7,$7,$zero
	or $8,$7,$6
	li $v0, 10
    syscall