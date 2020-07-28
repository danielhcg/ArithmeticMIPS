#Pennies for Pay
#Design a program that calculates the amount of money a person would earn over 
#a period of time if his or her salary is one penny the first day, two pennies 
#the second day, and continues to double each day. The program should ask the 
#user for the number of days. Display a table showing what the salary was for 
#each day, and then show the total pay at the end of the period. The output should 
#be displayed in a dollar amount, not the number of pennies.

.data
	
	#program title
	programTitle: .asciiz "Pennies for Pay------\n"
	
	#integers and float to be used in calculations 
	incrementor:       .word 1
	doubleIncrementor: .float 2
	pennyStartValue:   .float 0.01
	zeroAsFloat:       .float 0.0
	runningTotal:      .float 0.0
	
	#output messages
	dayMessage:   .asciiz "Day "
	totalMessage: .asciiz "Total: $"
	
	#input messages
	userPrompt: .asciiz "Enter number of days: "
	
	#cosmetic strings
	colon:   .asciiz ": $"
	newLine: .asciiz "\n"

.text

	main: 
	
		#load RAM values into processor registers
		lw   $t1, incrementor          # 1
		lwc1 $f2, doubleIncrementor    # used to increment penny value each iteration
		lwc1 $f3, pennyStartValue      # stores user inputted number of days
		lwc1 $f4, zeroAsFloat          # 0.0
		lwc1 $f5, runningTotal         # stores running total of penny values
	
		#display title
		li $v0, 4
		la $a0, programTitle
		syscall
		
		#prompt user to enter number of number of days 
		li $v0, 4
		la $a0, userPrompt
		syscall
		
		#read user input 
		li $v0, 5  #user input stored in $v0
		syscall
		
		#move user input to register $t2
		move $t2, $v0
		
		#while loop 
		while: 
		
			#branch to exit when incrementor is larger than user input
			bgt $t1, $t2, exit
			
				#body of loop
				
				#display iteration day message
				jal displayDay
				
				#display iteration number
				li $v0, 1
				add $a0, $t1, $zero
				syscall
				
				#display a colon
				jal displayColon
				
				#display penny value for that day 
				li $v0, 2  #code to display a float
				add.s $f12, $f3, $f4
				syscall
				
				#display a new line
				jal displayNewLine
				
				#add current iteration penny value to running total
				add.s $f5, $f5, $f3
				
				#multiply amount
				mul.s $f3, $f3, $f2
				
				
			#increase the incrementor
			addi $t1, $t1, 1  #step is 1
		
			#jump back to begining of while
			j while 
		
		exit: 
		
			#display total message
			li $v0, 4
			la $a0, totalMessage
			syscall
			
			#display total amount
			li $v0, 2
			add.s $f12, $f4, $f5
			syscall
	
	#main closing statement
	li $v0, 10
	syscall
	
	#function to display day message
	displayDay:
		li $v0, 4
		la $a0, dayMessage
		syscall
		
		jr $ra 
	
	#function to display a new line
	displayNewLine: 
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra
		
	#function to display a colon
	displayColon:
		li $v0, 4
		la $a0, colon
		syscall
		
		jr $ra



