.text
.globl main

main:
    ori $8, $0, 0           # count = 0
    ori $11, $0, 0          # sum = 0
    ori $12, $0, 0          # neg = 0
    ori $13, $0, 0          # pos = 0
    lui $9, 0x1000          # point at SIZE
    lw $15, 0($9)           # get SIZE
    addiu $9, $9, 4         # point to first entry

loop:
    beq $8, $15, done       # exit loop if count >= SIZE

    lw $10, 0($9)           # get entry
    addu $11, $11, $10      # add to sum

    slti $14, $10, 0        # set $14 if entry is negative
    bne $14, $0, neg_label  # branch if negative
    addu $13, $13, $10      # positive: add to pos
    j ifend_label

neg_label:
    addu $12, $12, $10      # negative: add to neg

ifend_label:
    addiu $8, $8, 1         # increment count
    addiu $9, $9, 4         # point to next entry
    j loop

done:
    sll $0, $0, 0           # target for branch

.data
size: .word 4
array: .word 1, 2, -2, -1
