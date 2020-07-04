#Reading floats
#To read floats, you need to declare a modifiable zero value in .data
#or instantiate a value to = 0

.data

	#Promts to display
	message: .asciiz "Enter the value of PI: "
	message2: .asciiz "The value you entered for PI is "
	gpaMessage: .asciiz "\n\nEnter your GPA: "
	gpaMessage2: .asciiz "Your GPA is "
	eMessage: .asciiz "\n\nEnter the value of e used in Mathematics: "
	eMessage2: .asciiz "The value you entered for e is "
	
	#Creating a 'pseudo' register to hold the value of 0
	#because floats can't access the general purpose registers.
	zeroAsFloat: .float 0.0  
	
	#Creating a 'pseudo' register for gpa user input
	zeroFloatGPA: .float 0.0
	
	#Creating a 'pseudo' register for e user input
	zeroFloatE: .float 0.0
	
	#New line message for display purposes
	newLine: .asciiz "\n"
	
.text
	
	#Enter PI-------------------------------------------------------------------
	#Our zero is in RAM, but to access it we need to load it
	lwc1 $f4, zeroAsFloat  #Storing value of 'zeroAsFloat' in register f4
						   #f0 by default contains 0
						   #Arbitrarily picked f register 
	
	#Displaying message to user
	li $v0, 4
	la $a0, message
	syscall
	
	#Get user input, read user input
	li $v0, 6  #Code to read float: 6, code to read int: 5
			   #Value is stored in f4 register, not v0
	syscall 
	
	#Displaying message2
	li $v0, 4  #Code to display string: 4
	la $a0, message2
	syscall 

	#Display value user entered
	li $v0, 2  #Code to display float: 2
	add.s  $f12, $f0, $f4  #Value in f0(0) + value in f4(user input)
						   #Stored in register f12
	syscall 
	
	#Enter GPA------------------------------------------------------------------
	#Loading gpa zero into a register, arbitrarily picked f register 
	lwc1 $f5, zeroFloatGPA
	
	#Display gpa prompt
	li $v0, 4  #Code to display string: 4
	la $a0, gpaMessage
	syscall
	
	#Get user input, read user input
	li $v0, 6  #Code to read float: 6
	syscall
	
	#Display gpaMessage2
	li $v0, 4  #Code to display string: 4
	la $a0, gpaMessage2
	syscall
	
	#Display gpa value user entered
	li $v0, 2  #Code to display float: 2
	add.s $f11, $f0, $f5  #Value of f0(0) + value of f5(gpa user input)
						  #Stored in register f11
	syscall
	
	#Enter the value of e-------------------------------------------------------
	#Loading e zero into a register, arbitrarily picked f register 
	lwc1 $f6, zeroFloatE
	
	#Display e value prompt
	li $v0, 4  #Code to display string: 4
	la $a0, eMessage
	syscall
	
	#Get user input, read user input
	li $v0, 6  #Code to read float: 6
	syscall
	
	#Display eMessage2 
	li $v0, 4  #Code to display string: 4
	la $a0, eMessage2
	syscall
	
	#Display e value user entered
	li $v0, 2  #Code to display float: 2
	add.s $f10, $f0, $f6  #Value of f0(0) + value of f6(e user input)
					      #stored in register f10
	syscall
	
	#Display new line
	li $v0, 4  #Code to display string
	la $a0, newLine
	syscall
	
	
