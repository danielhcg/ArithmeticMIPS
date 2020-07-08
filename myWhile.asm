.data
	
	programTitle: .asciiz "The program reads 10 run times\n"
	runTimePrompt: .asciiz "Please enter time "
	colon: .asciiz ": "
	runTimeExitMessage: "\nYou have finished entering 10 run times.\n"

.text
	
	#main method
	main:
				
		#Displays program title
		li $v0, 4
		la $a0, programTitle
		syscall
		
		#'declaring' incrementor for 
		addi $t1, $zero, 1
		
		
		#while loop to read 10 doubles
		while:
			#test condtion
			bgt $t1, 10, exit  #while t1 < 10, iterate. else, move to exit
			
			#calling displayPrompt function to display prompt
			jal displayPrompt
			
			#printing t1 incrementor
			li $v0, 1
			add $a0, $t1, $zero
			syscall
			
			#calling print colon function
			jal printColon
			
			#reading user input
			li $v0, 7  #system signal for reading double: 7
			syscall
			
			#add running total of doubles
			add.d $f12, $f0, $f10
			
			addi $t1, $t1, 1  #i++, incrementing the incrementor
			
			j while  #jumps back to begining of loop if condtion is true
		
		exit:
			#displays run times loop exit message
			li $v0, 4
			la $a0, runTimeExitMessage
			syscall
			
		
	#end of program, ending statement
	li $v0, 10
	syscall
	
	#function that displays user prompt
	displayPrompt:
	
		#displays user prompt
		li $v0, 4
		la $a0, runTimePrompt
		syscall
			
	#closing function statement
	jr $ra
	
	#function to print colon
	printColon:
		
		li $v0, 4
		la $a0, colon
		syscall
		
	#closing function statement
	jr $ra