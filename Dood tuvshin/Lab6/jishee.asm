##### Count the characters in a string
#H## Registers: $8 -- count $9 -- pointer to the char
## $10 -- the char (in low order byte)
.text
.globl main
main:
    ori $8, $0, 0         # count = 0
    lui $9, 0x1000        # point at first char
loop:
    lbu $10, 0($9)        # get the char
    beq $10, $0, done     # exit loop if char = null
    addiu $8, $8, 1       # count++
    addiu $9, $9, 1       # point at the next char
    j loop
done:
    # Print the count
    li $v0, 1             # syscall for print integer
    move $a0, $8          # load the count into $a0
    syscall               # print the count
    
    # Print the string
    li $v0, 4             # syscall for print string
    la $a0, string        # load the address of the string into $a0
    syscall               # print the string
    
    # Exit program
    li $v0, 10            # syscall for exit
    syscall

.data
string: .asciiz "Time is the ghost of space."
