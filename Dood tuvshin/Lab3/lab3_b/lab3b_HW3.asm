main:
	ori $7, $0, 160 #x
	ori $8, $0, 8   #y
	ori $9, $0, 40   #z
	mult $7, $8 #x*y
	mflo $10
	div $10, $9 #(x*y)/z
	mflo $11 #noogdvor
	mfhi $12 #uldegdel
	