## 0x67+(-0x23)
main:
	ori $8, $0, 0x67
	ori $9, $0, 0x23
	nor $9, $9, $0
	addiu $9, $9, 1
	addu $10, $9, $8