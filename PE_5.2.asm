
.data

	#Calorie program data
	iterationMessage:    .asciiz "Calories burned after "
	iterationMessage2:   .asciiz " minutes: "
	calorieProgramTitle: .asciiz "CALORIE PROGRAM--------------\n"
	
	calorieNumber:        .float 3.9
	startingTime:         .float 5.0
	startTimeIncrementor: .float 5.0
	
	#General data
	doneMessage: .asciiz "Done!"
	newLine:     .asciiz "\n"
	
.text
	
	main: 
		
		jal calorieDriver

	li $v0, 10
	syscall
	
	
	#Running on a particular treadmill you burn 3.9 calories 
	#per minute. Design a program that uses a loop to display the 
	#number of calories burned after 10, 15, 20, 25, and 30 minutes.
	calorieDriver:
	
		#display title of program
		la $v0, 4
		la $a0, calorieProgramTitle
		syscall
	
		# i = 1
		addi $t0, $zero, 1
		
		#loading conversion factor into register
		lwc1 $f1, calorieNumber

		#loading time interval values into registers
		lwc1 $f2, startTimeIncrementor
		lwc1 $f3, startingTime

		while: 

			bgt $t0, 5, exit #if t0 > 10, branch to exit label
			
			#Display prompts----------------------------------#
			#Displaying first part of prompt                  #
			li $v0, 4                                         #
			la $a0, iterationMessage                          #
			syscall                                           #
			                                                  #
			#Displaying time interval we wish to calculate    #
			add.s $f12, $f2, $f3                              #
			li $v0, 2                                         #
			syscall                                           #
                                                              #
			#Displaying second part of prompt                 #
			li $v0, 4                                         #
			la $a0, iterationMessage2                         #
			syscall                                           #
			#-------------------------------------------------#
			
			
			#multiplying current time with conversion factor
			mul.s $f12, $f12, $f1
			li $v0, 2
			syscall                                             
			                                                  
			#Displaying new Line                              
			li $v0, 4                                         
			la $a0, newLine                                     
			syscall                                           
			
			#increment startingTime
			add.s $f3, $f3, $f2
			
		    # increment counter
			addi $t0, $t0, 1  # i++
		
			j while #jump back to while
	
		exit: 
			li $v0, 4
			la $a0, doneMessage
			syscall
	
	jr $ra 

