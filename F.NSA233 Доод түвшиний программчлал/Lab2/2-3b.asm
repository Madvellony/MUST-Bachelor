.text
.globl main

main:
	ori $3,$0,0xbf
	ori $4,$0,0x3a
	ori $5,$0,0x74
	or $6,$3,$4
	and $7,$6,$5
	or $8,$3,$7
	and$8,$8,$5
    li $v0, 10
    syscall	 