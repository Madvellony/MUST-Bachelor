	.text
	.globl main

init: 
	ori $10, 50, 0    
	ori $8, $0, 0     

test: 
	sltiu $9, $8, 10  
	beq $9, $0, endLp 

	sll $0, $0, 0     

	addu $10, $10, $8 
	addiu $8, $8, 1   

	j test

	sll $0, $0, 0     

endLp: 
	sll $0, $0, 0     
