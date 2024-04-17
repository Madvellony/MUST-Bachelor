main:
	ori $8, $0, 12
	ori $9, $0, 5
	mult $9, $8
	mflo $9
	addiu $9, $9, -74