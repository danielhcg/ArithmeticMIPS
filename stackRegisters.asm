#Saving Registers to the Stack, saving s registers to the stack
#Modifying values inside an s register

.data
	
	#Display messages for INCREASING value in s0 register
	display1: .asciiz "Original value in s0 register: "
	display2: .asciiz "\nModified value in s0 register: "
	
	#Display messages for DECREASING value in s1 register
	display3: .asciiz "\n\nOriginal value in s1 register: "
	display4: .asciiz "\nModified value in s1 register: "

.text

	#main method
	main: 
		
		#'Declaring' a variable
		addi $s0, $zero, 10 #10 is stored in register s0
		
		#Printing out display message for original value of s0
		li $v0, 4
		la $a0, display1
		syscall
		
		#Printing out original value in s0
		li $v0, 1
		move $a0, $s0
		syscall 
		
		#Printing out display message for modified value of s0
		li $v0, 4
		la $a0, display2
		syscall
		
		#Calling the increaseMyRegister function 
		#Prints out value in s0, but increased by 30
		#Modifies a 'copy' of the value in s0
		jal increaseMyRegister
		
		
		#'Declaring' a variable
		addi $s1, $zero, 45
		
		#Printing out display message for original value of s1
		li $v0, 4
		la $a0, display3
		syscall
		
		#Printing original value in s1
		li $v0, 1
		move $a0, $s1
		syscall
		
		#Printing out display message for modified value in s1
		li $v0, 4
		la $a0, display4
		syscall
		
		#Calling decreaseMyRegister function
		jal decreaseMyRegister
	
	#End of the program
	li $v0, 10
	syscall
	
	#New function, increases value of register, does not modify value.
	#Modifying value of t register inside a function does not nesesitate 
	#saving it to the stack. t registers have permission to modify values. 
	increaseMyRegister:
	
		#Whenever you use an s register inside a function, you have to save it
		#to the stack by convention bc we want the old value to be available 
		#in the from which this function is called from. 
		
		#We don't want this function to modify the value in the s register
	
		#Using the stack, place in memory, to save old value using sp register
		#Allocating enough space in the stack to store the old value of s0
		addi $sp, $sp, -4  #-4 means freeing up 4 bytes of memory in stack, enough
						   #bytes to store an integer value.
						   #+4 would mean your taking space away form stack
						   
		#Now we can store the value in the stack
		#Allocating space for 1 element
		sw $s0, 0($sp)  #Save the value(save word(word is integer)) in s0 to 
						#the first location in the stack pointer
						
		#Now we can manipulate the value in the s0 register
		addi $s0, $s0, 30  #30+value in s0(10), stored in s0
		
		#Display new value in register.
		li $v0, 1
		move $a0, $s0
		syscall
		
		#Loading the old value from memory
		#Allows the old value to be available in main function
		lw $s0, 0($sp)
		addi $sp, $sp, 4  #Restoring the stack
		
	#Statement to return to the caller, end of the function
	jr $ra
	
	#Function to decrease the value in s1 register
	decreaseMyRegister:
	
		addi $sp, $sp, -4  #Allocating space in stack for new value
		
		sw $s1, 0($sp) #Storing new value in stack
		
		#Manipulate data we are going to store in the stack
		subi $s1, $s1, 13  #Value in s1(45) - 13, stored in s1
		
		#Display new value in register
		li $v0, 1
		move $a0, $s1
		syscall
		
		#Load old value from memory so that it can be accessible in main
		lw $s1, 0($sp)
		addi $sp, $sp, 4
	
	#Closing statement
	jr $ra
	
	
		