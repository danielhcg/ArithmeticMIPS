#how to create and manipulate arrays

.data

	myArray: .space 12  #making an array with the name myArray
						#arrays use .space instead of .asciiz 
						#.asciiz is only for string literals
						#this array is 12 bytes / 3 elements long
						#1 integer is 4 bytes of memory in RAM
						
	programTitle: .asciiz "This program accepts and then displays an array of 3 integers in reverse order.\n"

	outputMessage: .asciiz "Your array backwards is "
		
	#to display a comma				
	myComma: .asciiz ", "
	
	enterNum1: .asciiz "Enter number 1: "
	enterNum2: .asciiz "Enter number 2: "
	enterNum3: .asciiz "Enter number 3: "
	
.text

	#main method
	main: 
		
		#calling function to display title of program
		jal displayTitle
	
		#calling driver function
		jal arrayDriver
	
	#main method closing statement
	li $v0, 10
	syscall
	
	#driver function
	arrayDriver:
	
		#populating array with user input---------------------------------
		#display first prompt
		li $v0, 4
		la $a0, enterNum1
		syscall
		#read input from user
		li $v0, 5
		syscall
		#move user input to s0
		move $s0, $v0	
		
		#display second prompt
		li $v0, 4
		la $a0, enterNum2
		syscall
		#read input from user
		li $v0, 5
		syscall
		#move user input to s0
		move $s1, $v0
	
		#display third prompt
		li $v0, 4
		la $a0, enterNum3
		syscall
		#read input from user
		li $v0, 5
		syscall
		#move user input to s0
		move $s2, $v0
	
		#index = $t0--------------------------------------------------------
		addi $t0, $zero, 0 #starting position of array
	
		#using instruction STORE WORD(sw) to store s register values in RAM
		#storing 4 in first position of array
		sw $s0, myArray($t0) #store s0 in myArray index 0
			#updating offset to second positon 
			addi $t0, $t0, 4 #t0(0) + 4 bytes, stored in t0
		#storing 10 in second position of arry
		sw $s1, myArray($t0) #store s1 in myArray index 1
			#updating offset to third position
			addi $t0, $t0, 4 #t0(4) + 4 bytes, stored in t0
		#storing 12 in third position of array
		sw $s2, myArray($t0)
	
		#retrieving value at first position of array using LOAD WORD(lw) instruction
		lw $t6, myArray($t0) #load value at 3rd position from myArray(4) into t6
		
		#calling function to display output message
		jal displayOutput
		
		#calling displayInt function
		jal displayInt
		
		#calling displayComma function
		jal displayComma
		
		#updating offset to 2nd position to access 10
		subi $t0, $t0, 4
		
		#loading new array position value into t6
		lw $t6, myArray($t0)
		
		#calling displayInt function
		jal displayInt
		
		#calling displayComma function
		jal displayComma
		
		#updating offset to 1st position to access 4
		subi $t0, $t0, 4
		
		#loading new array position value into t6
		lw $t6, myArray($t0)
		
		#calling displayInt function
		jal displayInt
	
	#driver function closing statemnt
	jr $ra
	
	#function to display integer
	displayInt:
		li $v0, 1
		addi $a0, $t6, 0
		syscall
	#closing statement
	jr $ra
	
	#function to display a comma
	displayComma:
		li $v0, 4
		la $a0, myComma
		syscall
	#closing statement
	jr $ra
	
	#function to display a title
	displayTitle:
		li $v0, 4
		la $a0, programTitle
		syscall
	#closing statement
	jr $ra	
	
	#function to display output message
	displayOutput:
		li $v0, 4
		la $a0, outputMessage
		syscall
	#closing statement
	jr $ra
	


	