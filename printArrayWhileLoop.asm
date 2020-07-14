.data
	
	myArray: .space 12
	
	myComma: .asciiz ", "
	message1: .asciiz "Displaying array NOT USING while looping: "
	message2: .asciiz "\nDisplaying array USING while loopiing: "
	
.text
	
	#main procedure
	main: 
	
		#calling driver function to display array using while loop
		jal printArrayLoop
		
		#cant seem to figure out why only 1 array displays
		
		#calling driver function
		jal printArray
	
	#closing statement
	li $v0, 10
	syscall
	
	#driver function for printing array without while loop
	printArray:
	
		addi $s0, $zero, 4
		addi $s1, $zero, 10
		addi $s2, $zero, 12
	
		addi $t0, $zero, 0   #at first position
	
		sw $s0, myArray($t0)
			addi $t0, $t0, 4 #at second position
		sw $s1, myArray($t0)
			addi $t0, $t0, 4 #at thrid position
		sw $s2, myArray($t0)
	
		#printint values of array without using while loop
		subi $t0, $t0, 8  #moving index to position 1
		
		#retrieving value at first position of array using LOAD WORD(lw) instruction
		lw $t6, myArray($t0) #load value at 3rd position from myArray(4) into t6
		
		#display message1
		jal displayMessage1
		
		#calling function to display int at first position
		jal displayInt
		
		#calling dipslayComma function to dipslay comma
		jal displayComma
		
		#changing index to second position
		addi $t0, $t0, 4
		
		#loading new array position value into t6
		lw $t6, myArray($t0)
		
		#display next int
		jal displayInt
		
		#display a comma 
		jal displayComma
		
		#changing index to third position 
		addi $t0, $t0, 4
		
		#loading new array position value into t6
		lw $t6, myArray($t0)
		
		#display last int
		jal displayInt
		
	#closing statement
	jr $ra
	
	#driver functin to print array using looping
	printArrayLoop:
	
		#'declaring' values
		addi $s0, $zero, 4
		addi $s1, $zero, 10
		addi $s2, $zero, 12
		
		addi $t0, $zero, 0       #specify starting index
		
		sw $s0, myArray($t0)
			addi $t0, $t0, 4     #at second position
		sw $s1, myArray($t0)
			addi $t0, $t0, 4     #at thrid position
		sw $s2, myArray($t0)
		
		#clearing t0 to 0
		addi $t0, $zero, 0
		
		#displaying message2
		jal displayMessage2
		
		while:
		
			#test condition
			beq $t0, 12, exit  #if t0 = 12, then break out of while loop
			
			lw $t6, myArray($t0) #load element to register t0
			
			#updating offset
			addi $t0, $t0, 4
			
			#calling displayInt to print current number
			li $v0, 1
			addi $a0, $t6, 0
			syscall
			
			#displaying comma
			li $v0, 4
			la $a0, myComma
			syscall
			
			j while  #iterator
		
		exit:
			#tell system this is end of loop
			li $v0, 10
			syscall
	
	#closing statement
	jr $ra
	
	
	
	#function to display an integer
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
	
	#function to display message1
	displayMessage1:
		li $v0, 4
		la $a0, message1
		syscall
	#closing statement
	jr $ra
	
	#function to display message2
	displayMessage2:
		li $v0, 4
		la $a0, message2
		syscall
	#closing statement
	jr $ra
	
