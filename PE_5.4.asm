#Sum of Numbers
#Design a program with a loop that asks the user to enter a series of 
#positive numbers. The user should enter a negative number to signal 
#the end of the series. After all the positive numbers have been 
#entered, the program should display their sum.

.data

	#title, input, and output messages
	programTitle: .asciiz "Sum of Numbers-----------\n"
	directions1:  .asciiz "Enter a series of positive numbers.\n"
	directions2:  .asciiz "When you are done, enter a negative number.\n"
	userPrompt:  .asciiz "Enter a number "
	sumOfNums:    .asciiz "The sum of the numbers you entered is "
	colon:        .asciiz ": "
	
	#'declaring' variables in RAM to process data
	userNumber:   .word 0
	runningTotal: .word 0
	incrementor:  .word 1
	
.text

	main: 
	
		#loading variables 'declared' in RAM to processor registers
		lw $t0, userNumber
		lw $t1, runningTotal
		lw $t2, incrementor
		
		#calling module to display title message
		jal beginMessage
		
		#while loop to process data and display userPrompt each iteration
		while: 
		
			#display user prompt
			li $v0, 4
			la $a0, userPrompt
			syscall
			
			#display the iteration number
			li $v0, 1
			add $a0, $zero, $t2
			syscall
			
			#increment iteration number i++
			addi $t2, $t2, 1
			
			#display a colon
			li $v0, 4
			la $a0, colon
			syscall
			
			#get user number, stored in $v0
			li $v0, 5 #code to read an integer: 5
			syscall 
			
			#move user's number to $t0
			move $t0, $v0
			
			blt $t0, 0, exit #branch to exit if user input is negative
			
			#add user's number to running total
			add $t1, $t0, $t1
			
			j while  #jump back to begining of while loop
		
		#code to execute when sentinal is entered	
		exit: 
			
			#displaying output message
			li $v0, 4
			la $a0, sumOfNums
			syscall
			
			#displaying running total
			li $v0, 1 #code to display an integer: 1
			add $a0, $zero, $t1
			syscall
	
	#closing statement of main
	li $v0, 10
	syscall
	
	#module to diplay program title and user prompt
	beginMessage:
	
		#display title of program
		li $v0, 4
		la $a0, programTitle
		syscall
		
		#instructing user to enter a series of positive numbers
		li $v0, 4
		la $a0, directions1
		syscall
		
		#telling the user that when they are done, to enter a negative num
		li $v0, 4
		la $a0, directions2
		syscall
	
	#closing statement of beginMessage module
	jr $ra
	
	
	
	