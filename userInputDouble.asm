.data
	
	titlePrompt: .asciiz "This program reads a double from the user"
	titlePrompt2: .asciiz " and displays it to the screen."
	prompt: .asciiz "\n\nEnter Euler's number: "
	prompt2: .asciiz "\n\nEnter your GPA: "
	prompt3: .asciiz "\n\nEnter a high batting average: "
	prompt4: .asciiz "\n\nEnter a safe BAC for driving: "
	prompt5: .asciiz "\n\nEnter your BMI: "
	message1: .asciiz "You entered "

.text

	#Displaying title prompts
	li $v0, 4  #System signal for string printing: 4
	la $a0, titlePrompt
	syscall
	
	li $v0, 4  #System signal for string printing: 4
	la $a0, titlePrompt2
	syscall

	#Display message to user-------------------------------------------------
	li $v0, 4  #System signal for string printing: 4
	la $a0, prompt
	syscall
	
	#Get double from user
	li $v0, 7  #System signal for reading double: 7
	syscall
	
	#Double user inputs are stored in f registers.
	#User inputted double here is stored in f0.
	
	#Display output message
	li $v0, 4  #System signal for string printing: 4
	la $a0, message1
	syscall
	
	#Display user input
	li $v0, 3                    #System signal to display doubles: 3
	#Add doubles user input + 0, stored in f12
	add.d $f12, $f0, $f10        #Argument to display doubles is f12
	syscall
	
	#Display second message to user------------------------------------------
	li $v0, 4  #System signal for string printing: 4
	la $a0, prompt2
	syscall
	
	#Read double from user
	li $v0, 7  #System signal for reading double: 7
	syscall
	
	#Display output message
	li $v0, 4  #System signal for string printing: 4
	la $a0, message1
	syscall
	
	#Display second user input
	li $v0, 3  #System signal for displaying a double: 3
	add.d $f12, $f0, $f10
	syscall
	
	
	#Display third message to user--------------------------------------------
	li $v0, 4  #System signal for string printing: 4
	la $a0, prompt3
	syscall
	
	#Read double from user
	li $v0, 7  #System signal for reading double: 7
	syscall
	
	#Display output message
	li $v0, 4  #System signal for string printing: 4
	la $a0, message1
	syscall
	
	#Display third user input
	li $v0, 3  #System signal for displaying a double: 3
	add.d $f12, $f0, $f10
	syscall
	
	#Display fourth message to user-------------------------------------------
	li $v0, 4  #System signal for string printing: 4
	la $a0, prompt4
	syscall
	
	#Read double from user
	li $v0, 7  #System signal for reading double: 7
	syscall
	
	#Display output message
	li $v0, 4  #System signal for string printing: 4
	la $a0, message1
	syscall
	
	#Display fourth user input
	li $v0, 3  #System signal for displaying a double: 3
	add.d $f12, $f0, $f10
	syscall
	
	#Display fifth message to user-----------------------------------------------
	li $v0, 4  #System signal for string printing: 4
	la $a0, prompt5
	syscall
	
	#Read double from user
	li $v0, 7  #System signal for reading double: 7
	syscall
	
	#Display output message
	li $v0, 4  #System signal for string printing: 4
	la $a0, message1
	syscall
	
	#Display fifth user input
	li $v0, 3  #System signal for displaying a double: 3
	add.d $f12, $f0, $f10
	syscall
	
	
