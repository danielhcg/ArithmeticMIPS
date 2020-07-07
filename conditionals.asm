#conditional programming

.data  #for data

	mornMessage: .asciiz "Good morning."
	dayMessage: .asciiz "Good day." 
	eveningMessage: .asciiz "Good evening."
	message3: .asciiz "\nHello, the current hour in military time rounded to the nearest 4th hour: "

.text  #for instructions

	main: 
	
		#Displaying message3
		li $v0, 4
		la $a0, message3
		syscall
		
		#getting hour from user
		li $v0, 5
		syscall
		move $t0, $v0
	
		#'declaring' variables
		addi $t1, $zero, 0000
		addi $t2, $zero, 0400
		addi $t3, $zero, 0800
		addi $t4, $zero, 1200
		addi $t5, $zero, 1600
		addi $t6, $zero, 2000
		addi $t7, $zero, 2400
		
		#we want to compare values in t0 t1-t7
		beq $t0, $t1, mornMessageDisplay
		beq $t0, $t2, mornMessageDisplay
		beq $t0, $t3, mornMessageDisplay
		beq $t0, $t4, dayMessage4
		beq $t0, $t5, dayMessage5
		beq $t0, $t6, eveningMessage6
		beq $t0, $t7, eveningMessage7
		

	#closing statement for main
	li $v0, 10
	syscall
	
	mornMessageDisplay: 
		li $v0, 4
		la $a0, mornMessage
		syscall
	jr $ra
	
	dayMessage4:
		li $v0, 4
		la $a0, dayMessage
		syscall
	jr $ra
	dayMessage5:
		li $v0, 4
		la $a0, dayMessage
		syscall
	jr $ra
	
	eveningMessage6:
		li $v0, 4
		la $a0, eveningMessage
		syscall
	jr $ra
	eveningMessage7:
		li $v0, 4
		la $a0, eveningMessage
		syscall
	jr $ra
	