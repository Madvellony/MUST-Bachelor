.text
.globl main

main:
	ori $3,$0,0xbf
	ori $4,$0,0x3a
	ori $5,$0,0x74
	and $6,$3,$4
	or $7,$6,$4
	and $7,$7,$5
	li $v0, 10
    syscall