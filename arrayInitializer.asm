.data
	
	#declaring array with 12 bytes to hold 3 integers
	#myArray: .space 12 #uninitialized
	
	#declaring and initializing a 3 element long array with 100 as value
	#default value of each element is 100
	myArray: .word 100:3 #3 elements long, each element is 100
	myArray2: .word 24:5 #5 elements long, each element is 24
	
	#print a new line
	newLine: .asciiz "\n"
	#main title
	mainTitle: .asciiz "This program displays array elements that have already been initialized when the array was created.\n"
	exitMessage: .asciiz "This is the end. "

.text
	
	#main procedure
	main: 
	
		#displaying main title
		li $v0, 4
		la $a0, mainTitle
		syscall
	
		#calling function to display 3 element array
		jal displayMyArray
		
		jal printNL
		
		#calling function to display 5 element array 
		jal displayMyArray2
	
	#closing statement for main procedure
	li $v0, 10
	syscall
	
	#function to display integer for first array
	printInt1:
		li $v0, 1
		addi $a0, $t6, 0
		syscall
	#closing statement
	jr $ra
	
	#function to display integer for second array
	printInt2:
		li $v0, 1
		move $a0, $t7
		syscall
	#closing statement
	jr $ra
	
	#function to display new line
	printNL:
		li $v0, 4
		la $a0, newLine
		syscall
	#closing statement
	jr $ra
	
	#function to display 3 element array of 100 
	displayMyArray:
		#setting t0 register to value of 0
		addi $t0, $zero, 0
		
		#while loop to display all the elements of myArray
		while:
			#test condition
 			beq $t0, 12, exit #if t0 = 12, then break out of while loop
 			
 			#load current element to register t0
 			lw $t6, myArray ($t0)
 			
 			#updating offset
 			addi $t0, $t0, 4
 			
 			#calling printInt to display current number
 			jal printInt1 
 			#calling printNL to print new line
 			jal printNL
 			
 			j while #iterator
 			
		exit:
			li $v0, 4
			la $a0, exitMessage
			syscall
	#closing statement
	jr $ra
	
	#function to display 5 element array
	displayMyArray2:
		#setting t0 register to value of 0
		addi $t1, $zero, 0
		
		#while loop to display all elements of myArray2
		while2:
			#test condition
			beq $t1, 20, exit2 #if t0 = 20, then break out of while loop
			
			#load current element to register t0
			lw $t7, myArray2 ($t1)
			
			#updating offset 
			addi $t1, $t1, 4
			
			#printing current number
			jal printInt2
			#printing new line
			jal printNL
			
			j while #iterator
		exit2:
			li $v0, 4
			la $a0, exitMessage
			syscall
	#closing statement
	jr $ra
	
