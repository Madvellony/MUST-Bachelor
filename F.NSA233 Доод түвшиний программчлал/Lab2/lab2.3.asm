    .data
x1: .word 0xbf
x2: .word 0x3a
x3: .word 0x74
y:  .word 0
    
    .text
    .globl main
    
main:
    lw $t0, x1        
    lw $t1, x2        
    lw $t2, x3        
    
    and $t3, $t0, $t1 # $t3 = x1 & x2
    or  $t4, $t0, $t2 # $t4 = x1 & x3
    xor $t5, $t0, $t2 # $t5 = x1 ^ x3
    or  $t6, $t3, $t4 # $t6 = (x1 & x2) | (x1 & x3)
    or  $t7, $t6, $t5 # $t7 = (x1 & x2) | (x1 & x3) | (x1 ^ x3)
    
    sw $t7, y         
    
    li $v0, 1
    lw $a0, y
    syscall
    
    li $v0, 10
    syscall
