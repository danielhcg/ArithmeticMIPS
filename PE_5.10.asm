#Largest and Smallest
#Design a program with a loop that lets the user enter a series of numbers. 
#The user should enter ?99 to signal the end of the series. After all the 
#numbers have been entered, the program should display the largest and smallest 
#numbers entered.

.data
	programTitle: .asciiz "Largest and Smallest------\n"
	userPrompt: .asciiz "Enter a number: "
	largeOutput: .asciiz "\nLargest number: "
	smallOutput: .asciiz "\nSmallest number: "
	doneMessage: .asciiz "Done!"
	sentinal: .word -99
	incrementor: .word 0
.text
	main:
	
		lw $t1, incrementor
		lw $t2, sentinal
	
		li $v0, 4
		la $a0, programTitle
		syscall
		

			
		#prompt user to enter input
		jal promptUser
		
		#read user input
		li $v0, 5 #code to read input
		syscall
		
		#store result in $t3
		move $t3, $v0
			
		while:
			#branch to exit if user input equals -99
			beq $t3, $t2, exit
				#prompt user to enter input
				jal promptUser
				
				#read user input
				li $v0, 5 #code to read an integer: 5
				syscall
				
				#move input to $t4
				move $t4, $v0
				
					while2:
						bgt $t4, $t3, exit2
					exit2: 
						add $t5, $t4, $zero
				
				#clear $t3
				mul $t3, $t3, $zero
				
				#move user input to $t3
				move $t3, $t4
				
				#jump back to begining of while
				j while
			 
		exit: 
			jal displayBig
			
			li $v0, 1
			add $a0, $zero, $t5
			syscall
			
			jal displaySmall
		
	li $v0, 10
	syscall
	
	promptUser: 
		li $v0, 4
		la $a0, userPrompt
		syscall
		
		jr $ra
		
	displayBig: 
		li $v0, 4
		la $a0, largeOutput
		syscall
		
		jr $ra
		
	displaySmall: 
		li $v0, 4
		la $a0, smallOutput
		syscall
		
		jr $ra

