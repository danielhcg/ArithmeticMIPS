#Division with overflow

.data
	
	newLine : .asciiz "\n"
	rmdr    : .asciiz " remainder "
	problem1: .asciiz "26   / 4   = "
	problem2: .asciiz "296  / 13  = "
	problem3: .asciiz "463  / 89  = "
	problem4: .asciiz "9653 / 425 = "

.text

	#dividing 2 numbers 26 / 4 ---------------------------------------
	
	#displaying problem
	li $v0, 4            #system signal for string printing: 4
	la $a0, problem1
	syscall              #execute
	
	#storing 2 values in registers to divide 
	addi $t0, $zero, 26  #'declaring' variables
	addi $t1, $zero, 4   #'declaring' variables
	
	#using div to divide
	div $t0, $t1         #t0(26) / t1(4) stored in lo
	
	mflo $s0             #quotient
	mfhi $s1             #remainder
	
	#display quotient
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	
	#display remainder message
	li $v0, 4
	la $a0, rmdr
	syscall
	
	#display remainder integer
	li $v0, 1
	add $a0, $zero, $s1
	syscall
	
	#moving output to new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	#dividing 2 numbers 296 / 13--------------------------------------
	
	#display problem
	li $v0, 4
	la $a0, problem2
	syscall
	
	#storing 2 values in registers to divide
	addi $t0, $zero, 296
	addi $t1, $zero, 13
	
	#divide
	div $t0, $t1
	
	mflo $s0  #move quotient to register s0
	mfhi $s1  #move remainder to register s1
	
	#display quotient 
	li $v0, 1
	add $a0, $zero, $s0
	syscall 
	
	#display remainder message
	li $v0, 4
	la $a0, rmdr
	syscall 
	
	#display remainder value
	li $v0, 1
	add $a0, $zero, $s1
	syscall
	
	#move output to new line
	li $v0, 4
	la $a0, newLine
	syscall 
	
	#dividing 2 numbers 463 / 89--------------------------------------
	
	#displaying problem message
	li $v0, 4
	la $a0, problem3
	syscall 
	
	#storing 2 values in t registers to divide
	addi $t0, $zero, 463
	addi $t1, $zero, 89
	
	#divide
	div $t0, $t1
	
	mflo $s0  #move quotient from lo to s register
	mfhi $s1  #move remainder from hi to s register
	
	#display quotient value
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	
	#display remainder message
	li $v0, 4
	la $a0, rmdr
	syscall 
	
	#display remainder value
	li $v0, 1
	add $a0, $zero, $s1
	syscall 
	
	#move output to new line 
	li $v0, 4
	la $a0, newLine
	syscall
	
	#dividing 2 numbers 9653/425--------------------------------------
	
	#displaying problem message
	li $v0, 4
	la $a0, problem4
	syscall 
	
	#storing 2 values into t registers to divide
	addi $t0, $zero, 9653
	addi $t1, $zero, 425
	
	#divide
	div $t0, $t1
	
	mflo $s0  #moving quotient from lo to s0 register
	mfhi $s1  #moving remainder from hi to s1 register
	
	#displaying quotient value
	li $v0, 1
	add $a0, $zero, $s0
	syscall  
	
	#displaying remainder message
	li $v0, 4
	la $a0, rmdr
	syscall 
	
	#disyplaying remainder value 
	li $v0, 1
	add $a0, $zero, $s1
	syscall 
	
	#moving output to next line
	li $v0, 4
	la $a0, newLine
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
	

	