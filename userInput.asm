#Using syscalls to get user input

.data

	#These messages are in RAM. To print them out, we need 
	#to load them to registers. 
	
	#User input prompts
	agePrompt:   .asciiz "Enter your age: "
	agePrompt2:  .asciiz "\n\nEnter another age: "
	
	#Result display messages
	ageMessage:  .asciiz "Your age is "
	multMessage: .asciiz "\nYour age x 2 is "
	ageMessage2: .asciiz "The second age entered is "
	subMessage:  .asciiz "\nThe second age minus 10 is "

.text

	#Prompt user to enter age---------------------------------------------------
	li $v0, 4          #Code to print string: 4
	la $a0, agePrompt  #load 'agePrompt' address into register a0 
	syscall            #exectute
	
	#Get user input(age), an integer
	#Program pauses here to accept user input.
	#User input is stored in register v0
	li $v0, 5  #Code to get an integer from keyboard: 5
			   #Register v0 accepts user input, but doens't save it
	syscall #execute
	
	#Store user input in t0 temporarily bc were gonna modify
	#v0 later.
	move $t0, $v0  #Pseudo instruction
				   #Move to register t0 the value in v0
	
				   
	#Now that we have all our user input, we can do whatever we want with it
	
	#Display result message
	li $v0, 4           #Code to print string: 4
	la $a0, ageMessage  #load 'ageMessage' address into register a0
	syscall             #execute
	
	#Displaying user input 'age'
	li $v0, 1
	move $a0, $t0  #Pseudo instruction
				   #Moves value in t0 register to a0 register
	syscall  #execute
	
	#'Declaring' a variable to multiply age with
	addi $t1, $zero, 2
	
	#Multiplying age by 2
	mult $t0, $t1
	
	#Result of muliplication is stored in lo, so we have to move it to s0
	mflo $s0
	
	#Displaying result message 'multMessage'
	li $v0, 4            #Code to print string: 4
	la $a0, multMessage  #Load 'multMessage' address into register a0
	syscall              #Execute 
	
	#Displaying result of multiplication calculation
	li $v0, 1            #Code to print an integer: 1
	add $a0, $zero, $s0  #0+value in s0 stored in a0
	syscall              #Execute 
	
	#Prompt user to enter another age-------------------------------------------
	li $v0, 4           #Code to print string: 4
	la $a0, agePrompt2  #Load 'agePrompt2' address into register a0
	syscall             #Execute
	
	#Get user input for second age, program pauses here to accept user input
	li $v0, 5  #Code to accept integer from keyboard: 5
			   #v0 register accepts the input, but doesn't save it
	syscall    #Exectute
	
	#Save user input to t0 register
	move $t2, $v0  #Move v0 value to t2 register
	
	#Now we can manipulate the user input
	
	#Display second age message
	li $v0, 4            #Code to print string: 4
	la $a0, ageMessage2  #Load 'ageMessage2' address into register a0
	syscall              #Execute
	
	#Display user input for second age
	li $v0, 1      #Code to print integer: 1
	move $a0, $t2  #Pseudo instruction
				   #Moves value in register t2 to a0 register
	syscall        #Execute
	
	#'Declaring' variable to subtract from second age with
	addi $t3, $zero, 10  #0+10 stored in t3 register
	
	#Subtracting second age by 10
	sub $t4, $t2, $t3  #second age - 10, stored in t4 register
	
	#Displaying 'subMessage'
	li $v0, 4           #Code to print string: 4
	la $a0, subMessage  #Load 'subMessage' address into register a0
	syscall             #Execute
	
	#Displaying result of subtraction calculation
	li $v0, 1 			 #Code to print integer: 1
	add $a0, $zero, $t4  #0+value stored in t4, stored in a0
	syscall 			 #Execute
	
	
	