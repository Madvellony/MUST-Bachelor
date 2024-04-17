main:
	ori $7, $0, 160 #x
	ori $8, $0, 8   #y
	ori $9, $0, 40   #z
	ori $14, $0, 3
	ori $15, $0, 5
	ori $16, $0, 12
	mult $7, $7 #x*x
	mflo $10
	mult $10, $14 #
	mflo $11 	    #3x^2
	multu  $7, $15 
	mflo $12 	    #5x
	addu $12, $11, $12 #3x^2-5x
	subu $13, $12, $16 #3x^2-5x-12