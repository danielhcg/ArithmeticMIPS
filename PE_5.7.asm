#Average Rainfall

#Design a program that uses nested loops to collect data and calculate 
#the average rainfall over a period of years. The program should first 
#ask for the number of years. The outer loop will iterate once for each 
#year. The inner loop will iterate twelve times, once for each month. 
#Each iteration of the inner loop will ask the user for the inches of 
#rainfall for that month. After all iterations, the program should 
#display the number of months, the total inches of rainfall, and the 
#average rainfall per month for the entire period.

.data
    
	programTitle: .asciiz "Average Rainfall----------\n"
	yearsPrompt:  .asciiz "Number of years: "
	
	outerIncrementor: .word 1
	innerIncrementor: .word 1
	monthInYear: .word 12
	
	yearMessage: .asciiz "Year "
	monthMessage: .asciiz "Month\n"
	doneMessage1: .asciiz "Done1!\n"
	doneMessage2: .asciiz "Done2!\n"
	newLine: .asciiz "\n"
	colone: .asciiz ": "
	

.text

	main: 
	
		# $t0 = years
		# $t1 = outerIncrementor
		# $t2 = months
		# $t3 = innerIncrementor
		
		lw $t1, outerIncrementor
		lw $t2, monthInYear
		
	
		#displaying program title
		li $v0, 4
		la $a0, programTitle
		syscall
		
		#prompt user to enter number of years
		li $v0, 4
		la $a0, yearsPrompt
		syscall
		
		#read user entered number of years, stored in v0
		li $v0, 5
		syscall 
		
		#moving user inputted value for years into register t0
		move $t0, $v0
		
		while1: 
		
			#branch to exit if outerIncrementor is greater than hours
 			bgt $t1, $t0, exit1
 			
 				#loop body
 				
 				#display year message
				li $v0, 4  
				la $a0, yearMessage
				syscall
				
				#dispay year iteration number
				li $v0, 1
				add $t1, $zero, $t1
				syscall
				
				#display new line
				
				lw $t3, innerIncrementor
				
				while2:
				
					bgt $t3, $t2, exit2
					
						#loop body
						li $v0, 4
						la $a0, monthMessage
						syscall
					
					addi $t3, $t3, 1
					
					j while2
				
				exit2: 
				
					li $v0, 4
					la $a0, doneMessage2
					syscall
 			
 			#incrementing the outerIncrementor
 			addi $t1, $t1, 1
 			
 			#jumps back to while
 			j while1 
		
		exit1: 
		
			li $v0, 4
			la $a0, doneMessage1
			syscall
	
	#closing statement of main 
	li $v0, 10
	syscall
