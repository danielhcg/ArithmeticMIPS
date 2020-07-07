#Coditionals using slt

.data
	
	#title message
	message1: .asciiz "\n\nThis program lets you know if you are old enough to vote and drive.\n"
	
	#user prompt to enter data
	message2: .asciiz "Enter your age: "
	
	#output messages after data is processed
	message3: .asciiz "You are old enough to vote."
	message4: .asciiz "You are not old enough to vote."
	
	message5: .asciiz "You are old enough to drive."
	message6: .asciiz "You are not old enough to drive."
	
.text
	
	main: 
	
		#display program title
		li $v0, 4
		la $a0, message1
		syscall
	
		#Getting user age
		#Prompt user to enter age
		li $v0, 4
		la $a0, message2
		syscall
		
		#read user input
		li $v0, 5
		syscall
		
		#move value to t0 register
		move $t0, $v0
	
		#'declaring' minimum age to vote
		addi $t1, $zero, 18
		#'declaring' minimum age to drive
		addi $t2, $zero, 16
	
		slt $s0, $t0, $t1  #if t0 < t1, s0 = 1; else s0 = 0
		slt $s1, $t0, $t2  #if t0 < t2, s1 = 1; else s2 = 0

		#branch statements for driving age
		bne $s1, $zero, printMessage6 #driving
		beq $s1, $zero, printMessage5 #driving
		beq $t0, $t2, printMessage5 #driving
		
		#branch statements for voting age
		bne $s0, $zero, printMessage4 #voting
		beq $s0, $zero, printMessage3 #voting
		beq $t0, $t1, printMessage3 #voting
		
		#For some reason, only 1 slt executes
		
	#end of main
	li $v0, 10
	syscall
	
	#labels that display output messages after data is processed
	printMessage4:
		li $v0, 4
		la $a0, message4
		syscall
	jr $ra
		
	printMessage3:
		li $v0, 4
		la $a0, message3
		syscall
	jr $ra
	
	printMessage5: 
		li $v0, 4
		la $a0, message5
		syscall
	jr $ra
	
	printMessage6:
		li $v0, 4
		la $a0, message6
		syscall
	jr $ra 
		
		