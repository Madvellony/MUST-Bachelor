.data
buffer: .space 11    
prompt: .asciiz "мөрийг оруулна уу:: "
reverse: .asciiz "Урвуулсан мөр: "
error_message: .asciiz "Error: Буфер хэтэрлээ\n"

.text
.globl main
main:
   
    li $v0, 4
    la $a0, prompt
    syscall

   
    li $v0, 8
    la $a0, buffer
    li $a1, 11    
    syscall

   
    la $t0, buffer
    li $t1, 10    

    count_characters:
        lb $t2, 0($t0)     
        beqz $t2, input_done   
        addi $t0, $t0, 1      
        addi $t1, $t1, -1     
        bnez $t1, count_characters  
       
        li $v0, 4
        la $a0, error_message
        syscall
        j end

    input_done:
       
        la $t0, buffer
        li $t1, 10    

        
        li $v0, 4
        la $a0, reverse
        syscall

    push_loop:
        lb $t2, 0($t0)
        beqz $t2, reverse_loop
        subu $sp, $sp, 1
        sb $t2, 0($sp)
        addiu $t0, $t0, 1
        j push_loop

    reverse_loop:
        addiu $t1, $t1, -1
        blez $t1, print_newline
        lb $a0, 0($sp)
        beqz $a0, print_newline  
        li $v0, 11               
        syscall
        addiu $sp, $sp, 1
        j reverse_loop

    print_newline:
        li $v0, 11        
        li $a0, '\n'      
        syscall

    end:
        # Exit
        li $v0, 10
        syscall
