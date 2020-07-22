#Distance Traveled
#The distance a vehicle travels can be calculated as follows: D = S x T
#For example, if a train travels 40 miles per hour for three hours, 
#the distance traveled is 120 miles. Design a program that asks the user 
#for the speed of a vehicle (in miles per hour) and how many hours it has 
#traveled. It should then use a loop to display the distance the vehicle 
#has traveled for each hour of that time period

.data
    
    #title, user prompts, and output message                
	programTitle: .asciiz "Distance Traveled---------"
	speedPrompt: .asciiz "\nWhat is the speed of the vehicle in mph? "
	hoursPrompt: .asciiz "How many hours has it traveled? "
	outPutHeader: .asciiz "\nHour	Distance Traveled\n"
	
	#COSMETIC output messages
	newLine: .asciiz "\n"
	bigSpace: .asciiz "              "
	smallSpace: .asciiz " "
	miOutPut: .asciiz "mi"
	
	#declaring value in RAM to be used as incrementor in RAM
	incrementor: .word 1

.text

	main: 
	
		# $t0 = speed
		# $t1 = hours 
		# $t2 = incrementor
		# $t3 = iteration distance
		
		#loading incrementor value into processor register
		lw $t2, incrementor
		
		#displaying title message and getting speed
		jal getSpeed
		#moving speed from v1, t0
		move $t0, $v1
		
		#displaying output header and getting hours
		jal getHours
		#moving hours from v1 to t1
		move $t1, $v1
 		
 		#begining of while loop 
 		while: 
 		
 			#branch to exit if incrementor is greater than hours
 			bgt $t2, $t1, exit
 			
 				#loop body
 				
 				#COSTMETIC: display a small space
 				li $v0, 4
 				la $a0, smallSpace
 				syscall
 				
 				#display iteration number
 				li $v0, 1
 				add $a0, $zero, $t2
 				syscall
 				
 				#COSTMETIC: display a space
 				li $v0, 4
 				la $a0, bigSpace
 				syscall
 				
 				#speed x incrementor = distance
 				mul $t3, $t0, $t2 
 				
 				#displaying distance 
 				li $v0, 1
 				add $a0, $zero, $t3
 				syscall
 				
 				#COSTMETIC: displaying miles label
 				li $v0, 4
 				la $a0, miOutPut
 				syscall
 				
 				#COSTMETIC: displaying a new line
 				li $v0, 4
 				la $a0, newLine
 				syscall
 			
 			#incrementing the incrementor
 			addi $t2, $t2, 1
 			
 			#jumps back to while
 			j while 
 		
 		exit: 
 			
	#closing statement of main 
	li $v0, 10
	syscall
	
	#function to return value entered for speed
	getSpeed:
		
		#display program title
		li $v0, 4
		la $a0, programTitle
		syscall 
		
		#prompt user to enter vehicle speed
		li $v0, 4
		la $a0, speedPrompt
		syscall
		
		#read integer user input, stored in $v0
		li $v0, 5  #code to read an integer: 5
		syscall 
		
		#move user inputted integer from v0 to v1
		move $v1, $v0
		
		jr $ra
	
	#function to return value entered for hours, display output header
	getHours:
	
		#prompt user to enter number of hours traveled
		li $v0, 4
		la $a0, hoursPrompt
		syscall
		
		#read in user inputted integer for hours
		li $v0, 5  #code to read an integer: 5
 		syscall 
 		
 		#move user input for hours from v0 to v1
 		move $v1, $v0
 		
 		#displaying output header
 		li $v0, 4
 		la $a0, outPutHeader
 		syscall
	
		jr $ra
		
		