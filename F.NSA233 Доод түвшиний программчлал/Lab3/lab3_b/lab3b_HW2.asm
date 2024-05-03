main:
	ori $7, $0, 160 #x
	ori $8, $0, 8   #y
	ori $9, $0, 40   #z
	ori $10, $0, 3
	ori $11, $0, 7
	ori $12, $0, 2
	ori $13, $0, 8
	mult $10, $7
	mflo $14
	addu $14, $14, $11 #3x+7
	mult $7, $12
	mflo $15
	addu $15, $15, $13 #2x+8
	div $14, $15
	mflo $16
	mfhi $17
	
	