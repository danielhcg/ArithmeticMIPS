#Budget Analysis
#Design a program that asks the user to enter the amount that he or she 
#has budgeted for a month. A loop should then prompt the user to enter 
#each of his or her expenses for the month, and keep a running total. 
#When the loop finishes, the program should display the amount that the 
#user is over or under budget.


#need to display iteration number in the loop


.data

	programTitle:   .asciiz "BUDGET PROGRAM---------------\n"
	monthBudgPmpt:  .asciiz "Enter monthly budget: $"
	expensePrompt:  .asciiz "Enter number of monthly expenses: "
	expensePrompt2: .asciiz "Enter expense "
	totalMonthMsg:  .asciiz "Total monthly expenses: $"
	overBudgMsg:    .asciiz "\nYou are over budget by $"
	underBudgMsg:   .asciiz "\nYou are under budget by $"
	exactBudgMsg:   .asciiz "\nYou are exactly at your monthly budget."
	
	doneMessage:    .asciiz "\nDone!"
	newLine:        .asciiz "\n"
	colon:          .asciiz ": $"
	
	runningTotal:   .float 0.0
	zeroAsFloat:    .float 0.0

.text

	main:
	
		#display title of program 
		li $v0, 4
		la $a0, programTitle
		syscall
		
		#prompt user to enter total monthly budget amount
		li $v0, 4
		la $a0, monthBudgPmpt
		syscall
		
		#read total monthly budget, stored in f0
		li $v0, 6
		syscall
		
		#move user input to register f4
		mov.s $f4, $f0
		
		#Prompting user for number of monthly expenses
		li $v0, 4
		la $a0, expensePrompt
		syscall
		
		#Reading number of expenses
		li $v0, 5  #code to read integer: 5
		syscall
		#Storing result in $t1
		move $t1, $v0
		
		
		#'declaring' i
		addi $t0, $zero, 1
		
		#declaring register to store running total 
		addi $t2, $zero, 0
		
		#loading runningTotal and zeroAsFloat into registers
		lwc1 $f2, runningTotal
		lwc1 $f3, zeroAsFloat
		
		while:
		
			bgt $t0, $t1, exit
			
				#prompting user to enter expense iteration
				li $v0, 4
				la $a0, expensePrompt2
				syscall
				
				#Display iteration number
				li $v0, 1
				add $a0, $t0, 0
				syscall
				
				#displaying colon
				li $v0, 4
				la $a0, colon
				syscall
				
				#reading user input float, stored in f0
				li $v0, 6
				syscall 
				
				#adding user input to running total
				add.s $f3, $f0, $f3
				
				
			#incrementing counter
			addi $t0, $t0, 1  #i++
			
			j while  #jumpt back to while

		
		exit: 
			#Display output message 1
			li $v0, 4
			la $a0, totalMonthMsg
			syscall
			
			#displaying running total
			li $v0, 2
			add.s $f12, $f2, $f3
			syscall
			
			#testing equality of user input monthly budget with running total 
			c.eq.s $f4, $f3
			bc1t atBudget
			
			#testing if under monthly budget
			c.lt.s $f3, $f4
			bc1t underBudget
			
			#testing if over monthly budget
			c.lt.s $f4, $f3
			bc1t overBudget
			
			#displaying exit message
			li $v0, 4
			la $a0, doneMessage
			syscall
	
	li $v0, 10
	syscall
	
	atBudget: 
		li $v0, 4
		la $a0, exactBudgMsg
		syscall
	li $v0, 10
	syscall
		
	underBudget:
		li $v0, 4
		la $a0, underBudgMsg
		syscall 
		
		li $v0, 2
		sub.s $f12, $f4, $f3
		syscall
	li $v0, 10
	syscall
	
		
		
	overBudget:
		li $v0, 4
		la $a0, overBudgMsg
		syscall
		
		li $v0, 2
		sub.s $f12, $f3, $f4
		syscall
	li $v0, 10
	syscall
	
	
	
