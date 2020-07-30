# Total Sales
#Design a program that asks the user to enter a store’s sales for each day 
#of the week. The amounts should be stored in an array. Use a loop to 
#calculate the total sales for the week and display the result.

.data

	#make an array
	myArray: .space 28 #allocating 28 bytes of memory for 12 4-byte floats
	
	# test done message
	testDoneMessage: .asciiz "Done!\n"
	# another test message
	testMessage: .asciiz "This is a test\n"
	
	# i value
	iValue: .word 1
	
	#program title
	title: .asciiz "Total Sales------\n"
	
	# user prompt
	userPrompt: .asciiz "Enter sales for day "
	
	newLine: .asciiz "\n"
	colon: .asciiz ": "
	
	#zero float
	zeroAsFloat: .float 0.0
	#running total
	total: .float 0.0
	
	offSet: .float 0.0

.text

	main: 
	
		#load i value into processor register
		lw $t1, iValue
		
		#load zero float into processor register
		lwc1, $f1, zeroAsFloat
		#load running total into processor register
		lwc1, $f2, total
		#load offset into processor register
		lwc1, $f3, offSet
		
		# printing title
		jal printTitle
	
		# loop to prompt user to enter values, populate array, 
		# & calculate the total sales for the week
		while: 
		
			#branch statement
			bgt $t1, 7, exit
			
				#LOOP BODY
				
				#print prompt
				jal printPrompt
				
				#print iteration number
				li $v0, 1
				addi $a0, $t1, 0
				syscall
				
				#print colon
				jal printColon
					
				#read user input
				li $v0, 6         #code to read a float: 6, stored in $f0
 				syscall
 				
 					#WHERE THE MAGIC HAPPENS
 					
 					swc1 
 					
 					#add user input to running total
					#add.s $f2, $f0, $f2
							
			#increment i
			addi $t1, $t1, 1
			
			#jump back to while
			j while
		
		exit:
			jal printDone
			li $v0, 2
			add.s $f12, $f2, $f1
			syscall
	
	li $v0, 10
	syscall
	
	printDone: 
		li $v0, 4
		la $a0, testDoneMessage
		syscall
		
		jr $ra
		
	printTest: 
		li $v0, 4
		la $a0, testMessage
		syscall
		
		jr $ra
		
	printTitle: 
		li $v0, 4
		la $a0, title
		syscall
		
		jr $ra
		
	printPrompt:
		li $v0, 4
		la $a0, userPrompt
		syscall
		
		jr $ra
		
	printNewLine: 
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra
		
	printColon:
		li $v0, 4
		la $a0, colon
		syscall
		
		jr $ra
	
