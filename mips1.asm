.data
input: .asciiz "enter value to check divisibility with 6\n"
yes: .asciiz "the number is divisible by 6.\n"
no: .asciiz "the number is not divisible by 6.\n"

.text
Main:
la $a0, input
li $v0, 4
syscall
li $v0, 5
syscall
move $a0, $v0
jal div6
li $v0, 10
syscall

div6:
addi $sp, $sp, -4
sw $ra, 0($sp)
li $t0, 3
div $a0, $t0
mfhi $t0
bne $t0, $zero, else
jal div2
beq $v0, 0, else
la $a0, yes
li $v0, 4
syscall
j exit
else:
la $a0, no
li $v0, 4
syscall
exit:
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

div2:
li $t0, 2
div $a0, $t0
mfhi $t0
beq $t0, $zero, return1
li $v0, 0
j exitif
return1:
li $v0, 1
exitif:
jr $ra  
