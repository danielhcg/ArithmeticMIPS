#Nested Functions

.data

	newLine: .asciiz "\n"
	test: .asciiz "test"

.text

	#Main function
	main:

		addi $s0, $zero, 63
		
		jal displayValue

		#Prints a new line
		li $v0, 4
		la $a0, newLine
		syscall

		#'Declaring' a value
		addi $s0, $zero, 10  
		
		#Calling function to increase value in register s0 and display
		jal increaseMyRegister
		
		#Prints a new line
		li $v0, 4
		la $a0, newLine
		syscall
		
		#Calling function to display original value
		jal displayValue
	
	#Closing statement for main function
	li $v0, 10
	syscall
	
	#Function to increase value in register s0
	increaseMyRegister:
	
		#Nested function here returns to main, but we want it to return to 
		#increaseMyRegister function. Need to save the old address to the stack.
	
		#Freeing up 8 bytes of memory in stack for or old value in s0 and 
		#for the old address from main
		addi $sp, $sp, -8
		
		#Storing value in stack
		sw $s0, 0($sp)
		
		#Storing address
		sw $ra, 4($sp)
		
		#Manipulate value in register
		addi $s0, $s0, 30 #30 + value in s0, stored in s0
		
		#Nested function
		jal displayValue
		
		#Load original value and address from memory to be accessible in main
		lw $s0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 4  #Restoring the stack
	
	#Closing statement, returns to main
	jr $ra
	
	#Function to decrease value in register s1
	
	#Function to print value in register
	displayValue:
	
		li $v0, 1
		move $a0, $s0
		syscall
		
	#return to the caller
	jr $ra
	

	

	

	
