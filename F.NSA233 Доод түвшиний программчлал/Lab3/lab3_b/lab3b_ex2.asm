main:
	ori $8, $0, 8
	ori $9, $0, 36
	addu $10, $9, $8
	subu $11, $9, $8
	div $10, $11
	mflo $10
	mfhi $11