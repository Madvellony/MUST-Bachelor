.globl main
main:

    la $a0, digits    
    li $a1, 10        
    jal sorting       
    la $t1, digits    
    li $t0, 0         

print:
    beq $t0, $a1, exit    
    lw $a0, 0($t1)        
    li $v0, 1            
    syscall
    li $v0, 4             
    la $a0, line          
    syscall 
    addi $t1, $t1, 4     
    addi $t0, $t0, 1     
    j print              

exit:
    li $v0, 10           
    syscall

sorting:
    li $t2, 1             
    sub $t3, $a1, 1       
loop2:
    beqz $t2, loop2_end   
    move $t4, $a0         
    li $t2, 0             
    li $t0, 0            

loop1:
    bge $t0, $t3, loop2  #
    lw $t5, 0($t4)        
    lw $t6, 4($t4)
    blt $t5, $t6, do_change  
    j skip_change

do_change:
    sw $t6, 0($t4)        
    sw $t5, 4($t4)
    li $t2, 1             
skip_change:
    addi $t4, $t4, 4      
    addi $t0, $t0, 1      
    j loop1               
loop2_end:
    jr $ra               
    
.data
digits: .word  14, 52, 2, 21, 77, 5, 8, 9, 3, 0  # Элементүүд
line: .asciiz "\n"                              
