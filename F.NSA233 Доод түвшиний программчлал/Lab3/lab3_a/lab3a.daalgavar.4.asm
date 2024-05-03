.text
.globl main
main:
	ori $8, $0, 0x45
	ori $9, $0, 0x01
	ori $10, $0, 0x21
	ori $11, $0, 0x4
	addu $12, $9, $8
	addu $12, $12, $10
	subu $12, $12, $11
