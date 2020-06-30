#Function Arguments and Return Values 

.data
	
	#Message to display the first problem
	problem1: .asciiz "45 + 16 = "
	#Message to display the second problem
	problem2: .asciiz "\n85 - 23 = "
	#Message to display the third problem
	problem3: .asciiz "\n26 x 54 = "
	#Message to display the fourth problem
	problem4: .asciiz "\n144 / 24 = "

.text
	
	#Main function that calls all the driver functions
	main: 
	
		#Displaying problem1 message
		li $v0, 4
		la $a0, problem1
		syscall
		#'Declaring' values to be added stored in registers a0 and a1
		addi $a1, $zero, 16
		addi $a2, $zero, 45
		#Calling the addNumbers function to perform the addition using jal
		jal addNumbers
		#Displaying result of addition calculation
		li $v0, 1
		addi $a0, $v1, 0
		syscall
		
		#Displaying problem2 message
		li $v0, 4
		la $a0, problem2
		syscall
		#'Re-Declaring' values stored in a1 and a2 for subtraction
		addi $a1, $zero, 85
		addi $a2, $zero, 23
		#Calling subNumbers function to perform subtraction using jal
		jal subNumbers
		#Displaying result of subtraction calculation
		li $v0, 1
		addi $a0, $v1, 0
		syscall
		
		#Displaying problem3 message 
		li $v0, 4
		la $a0, problem3
		syscall
		#'Re-Declaring' values stored in a1 and a2 for multiplication
		addi $a1, $zero, 26
		addi $a2, $zero, 54
		#Calling multNumbers function to perform multiplication using jal
		jal multNumbers
		#Displaying result of multiplication calculation
		li $v0, 1
		addi $a0, $v1, 0
		syscall
		
		#Displaying problem4 message
		li $v0, 4
		la $a0, problem4
		syscall
		#'Re-Declaring' values stored in a1 and a2 for division
		addi $a1, $zero, 144
		addi $a2, $zero, 24
		#Calling divNumbers function to perform division using jal
		jal divNumbers
		#Displaying result of division calculation
		li $v0, 1
		addi $a0, $v1, 0
		syscall
	
	#This is the closing statement, like 'return 0' in c++
	li $v0, 10
	syscall
	
	
	#Function that adds the two values stored in registers a1 and a2
	#Register v1 is used to return the value of the addition calculation
	addNumbers:
	
		add $v1, $a1, $a2
	
	#Closing statement of function, returns back to main function
	jr $ra
	
	#Function that adds the two values stoed in registers a1 and a2
	subNumbers:
	
		sub $v1, $a1, $a2  #Register v1 used for return value of calculation
	
	#Closing statement of function, returns back to main function
	jr $ra
	
	#Function that multiplies the two values stored in registers a1 and a2
	multNumbers:
	
		mul $v1, $a1, $a2
	
	#Closing statement of function, returns back to main function
	jr $ra
	
	#Function that divides the two values stored in registers a1 and a2
	divNumbers:
	
		div $v1, $a1, $a2
	
	#Closing statement of function, returns back to main function
	jr $ra
	