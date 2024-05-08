.globl  main
main:  
    li $v0, 4
    la $a0, prompt_a
    syscall
   
    li $v0, 5
    syscall
    move $t0, $v0
    sw $t0, a
   
    li $v0, 4
    la $a0, prompt_b
    syscall
   
    li $v0, 5
    syscall
    move $t0, $v0
    sw $t0, bb
   
    li $v0, 4
    la $a0, prompt_c
    syscall
   
    li $v0, 5
    syscall
    move $t0, $v0
    sw $t0, cc
   
    lw      $t0,a
    lw      $t1,bb
    li      $t2, 3
    mul     $t0,$t0,$t1
    mul     $t0,$t2,$t0
    subu    $sp,$sp,4
    sw      $t0,($sp)

    lw      $t0,bb
    lw      $t1, cc
    li      $t2,-2
    mul     $t0,$t0,$t1
    mul     $t0, $t0, $t2
    subu    $sp,$sp,4
    sw      $t0,($sp)

    lw      $t0,a
    li      $t1,-5
    mul     $t0,$t0,$t1
    subu    $sp,$sp,4
    sw      $t0,($sp)

    lw      $t0,a
    lw      $t1,cc
    li      $t2,20
    mul     $t0, $t0, $t1
    mul     $t0, $t0, $t2
    subu    $sp,$sp,4
    sw      $t0,($sp)

    li      $t1,-16
    lw      $t0,($sp)
    addu    $sp,$sp,4
    addu    $t1,$t1,$t0
    lw      $t0,($sp)
    addu    $sp,$sp,4
    addu    $t1,$t1,$t0

    lw      $t0,($sp)
    addu    $sp,$sp,4
    addu    $t1,$t1,$t0

    lw      $t0,($sp)
    addu    $sp,$sp,4
    addu    $t1,$t1,$t0

done:   li      $v0,1
        move    $a0,$t1
        syscall
        li      $v0,10
        syscall  

.data
a:  .word 0
bb: .word 0
cc: .word 0
prompt_a: .asciiz "a-гийн утгыг оруулна уу: "
prompt_b: .asciiz "b-гийн утгыг оруулна уу "
prompt_c: .asciiz "c-гийн утгыг оруулна уу: "
