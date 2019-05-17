# Author: Danielle Fernandez
# Created in MIPS
# This program prompts for user input to enter the 
# multiplicand and multiplier and displays the equation
# with the answer.

		.data
candPrompt:	.asciiz	"Enter the multipliand: "
plierPrompt:	.asciiz "Enter the multiplier: "
output:		.space 50
asterick:	.asciiz " * "
equalSign:	.asciiz " = "

		.text
		.globl main
		
main:
	la $a0, candPrompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0 #multiplicand in t0
	
	la $a0, plierPrompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $a1, $v0 #multiplier in a1
	
	move $a0, $t0 #multiplicand in a0
	
	li $t1, 1
	
	j multiply
	
multiply:
	beq $a0, $t1, exit
	
	add $v0, $v0, $a1
	addi $a0, $a0, -1
	
	
	j multiply
	
exit:
	move $t2, $v0 #result in v2
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, asterick
	li $v0, 4
	syscall
	
	move $a0, $a1
	li $v0, 1
	syscall
	
	la $a0, equalSign
	li $v0, 4
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
