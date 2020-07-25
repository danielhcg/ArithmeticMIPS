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
    
    #user prompts
	programTitle:     .asciiz "Average Rainfall----------\n"
	yearsPrompt:      .asciiz "Number of years: "
	yearMessage:      .asciiz "Year "
	monthMessage:     .asciiz "Month "
	
	#output prompts
	totalMonths:      .asciiz "Total Months: "
	totalRainfall:    .asciiz "\nTotal Rainfall: "
	avgRainfall:      .asciiz "\nAverage Rainfall: "
	
	#incrementors for both loops 
	outerIncrementor: .word 1
	innerIncrementor: .word 1
	monthInYear:      .word 12
	
	#cosmetic string literals 
	newLine:          .asciiz "\n"
	colon:            .asciiz ": "
	
	#for calculating average rainfall as a decimal
	zeroAsFloat:      .float 0.0
	runningTotal:     .float 0.0

.text

	main: 
	
		# $t0 = years
		# $t1 = outerIncrementor
		# $t2 = months
		# $t3 = innerIncrementor
		
		# $f1 = zeroAsFloat
		# $f2 = runningTotal
		
		#loading values from RAM into processor registers
		lw $t1, outerIncrementor
		lw $t2, monthInYear
		
		lwc1 $f1, zeroAsFloat
		lwc1 $f2, runningTotal
	
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
		
		#begining of outer loop 	
		while1: 
		
			#branch to exit1 if outerIncrementor is greater than years
 			bgt $t1, $t0, exit1
 			
 				#loop body
 				
 				#display new line
				li $v0, 4
				la $a0, newLine
				syscall
 				
 				#display year message
				li $v0, 4  
				la $a0, yearMessage
				syscall
				
				#dispay year iteration number
				li $v0, 1
				add $a0, $zero, $t1
				syscall
				
				#display new line
				li $v0, 4
				la $a0, newLine
				syscall
				
				#loading innerIncrementor to t register inside outer while loop
				lw $t3, innerIncrementor
				
				#begining of inner loop 
				while2:
				
					#branch to exit2 if innerIncrementor > months
					bgt $t3, $t2, exit2
					
						#loop body
						
						#prompt user to enter rain fall for that month
						li $v0, 4
						la $a0, monthMessage
						syscall
						
						#display inner loop iteration number
						li $v0, 1
						add $a0, $zero, $t3
						syscall
						
						#display a colon 
						li $v0, 4
						la $a0, colon
						syscall
						
						#read user input for month, stored in $f0 
						li $v0, 6 #code to read float: 6
						syscall
						
						#add user input to running total 
						add.s $f2, $f2, $f0 
					
					#increment innerIncrementor
					addi $t3, $t3, 1
					
					#jump back to while2 if condition is still true
					j while2 
					
					#display new line
					li $v0, 4
					la $a0, newLine
					syscall
				
				#end of inner loop 
				exit2: 
				
 			#incrementing the outerIncrementor
 			addi $t1, $t1, 1
 			
 			#jumps back to while1
 			j while1 
		
		#end of of outer loop 
		exit1: 
		
			#display new line
			li $v0, 4
			la $a0, newLine
			syscall
		
			#display total number of months message
			li $v0, 4
			la $a0, totalMonths
			syscall
			
			#display total number of months
			li $v0, 1
			mul $a0, $t0, $t2
			syscall
			
			#display total rain fall message
			li $v0, 4
			la $a0, totalRainfall
			syscall
			
			#display running total number 
			li $v0, 2  #code to print a float: 2
			add.s $f12, $f2, $f1
			syscall 
			
			#display average rainfall message
			li $v0, 4
			la $a0, avgRainfall
			syscall
			
			#display average rainfall
			#running total f2 / number of months f1
			
			# years * months, stored in t4
			mul $t4, $t0, $t2
			
			
			#convert number of months integer to float
			mtc1 $t4, $f1
			cvt.s.w $f1, $f1
			
			#divide running total by months 
			div.s $f12, $f2, $f1
			
			#display average
			li $v0, 2
			syscall
			
			#display new line
			li $v0, 4
			la $a0, newLine
			syscall
			
	#closing statement of main 
	li $v0, 10
	syscall
