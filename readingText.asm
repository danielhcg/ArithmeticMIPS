#This program reads in a string from the user and displays it back out

.data

	#messages to display 
	myMessage0: .asciiz "Please enter your name: "
	myMessage1: .asciiz "Hello, "
	
	#variable to store user input, data type: .space
	#need to specify how many characters user is allowed to enter
	userInput: .space 20
	
	madLib1: .asciiz "\nColor: "
	madLib2: .asciiz "Superlative: "
	madLib3: .asciiz "Adjective: "
	madLib4: .asciiz "Body Part: "
	madLib5: .asciiz "Noun: "
	madLib6: .asciiz "Animal: "
	
	ml1Input: .space 20
	ml2Input: .space 20
	ml3Input: .space 20
	ml4Input: .space 20
	ml5Input: .space 20
	ml6Input: .space 20

	
	#final madlib output
	mad1: .asciiz "\nThe "
	mad2: .asciiz "Dragon is the "
	mad3: .asciiz "Dragon of all."
	mad4: .asciiz " It has "
	mad5: .asciiz "and a "
	mad6: .asciiz "shaped like a "

.text

	main:
	
		#display user prompt to enter name
		li $v0, 4
		la $a0, myMessage0
		syscall
		
		#get user input as text----------------------------------
		li $v0, 8  #system signal for reading text: 8
		#passing argument to system call
		la $a0, userInput
		#telling system max length of string to be entered
		li $a1, 20
		syscall
		
		#display message1
		li $v0, 4  #system signal to display text: 4
		la $a0, myMessage1
		syscall
		
		#display userInput
		li $v0, 4
		la $a0, userInput
		syscall
		
		#Madlib game-----------------------------------------------
		
		#Display madLib1
		li $v0, 4
		la $a0, madLib1
		syscall
		
		#get ml1Input
		li $v0, 8
		la $a0, ml1Input
		li $a1, 20
		syscall
		
		#Display madLib2
		li $v0, 4
		la $a0, madLib2
		syscall
		
		#get ml2Input
		li $v0, 8
		la $a0, ml2Input
		li $a1, 20
		syscall
		
		#Display madLib3
		li $v0, 4
		la $a0, madLib3
		syscall
		
		#get ml3Input
		li $v0, 8
		la $a0, ml3Input
		li $a1, 20
		syscall
		
		#Display madLib14
		li $v0, 4
		la $a0, madLib4
		syscall
		
		#get ml4Input
		li $v0, 8
		la $a0, ml4Input
		li $a1, 20
		syscall
		
		#Display madLib5
		li $v0, 4
		la $a0, madLib5
		syscall
		
		#get ml5Input
		li $v0, 8
		la $a0, ml5Input
		li $a1, 20
		syscall
		
		#Display madLib6
		li $v0, 4
		la $a0, madLib6
		syscall
		
		#get ml6Input
		li $v0, 8
		la $a0, ml6Input
		li $a1, 20
		syscall
		
		#display mad1
		li $v0, 4
		la $a0, mad1
		syscall
		
		#display ml1Input
		li $v0, 4
		la $a0, ml1Input
		syscall
		
		#display mad2
		li $v0, 4
		la $a0, mad2
		syscall
		
		#display ml2Input
		li $v0, 4
		la $a0, ml2Input
		syscall
		
		#display mad3
		li $v0, 4
		la $a0, mad3
		syscall
		
		#display mad4
		li $v0, 4
		la $a0, mad4
		syscall
		
		#display ml3Input
		li $v0, 4
		la $a0, ml3Input
		syscall
		
		#display ml4Input
		li $v0, 4
		la $a0, ml4Input
		syscall
		
		#display mad5
		li $v0, 4
		la $a0, mad5
		syscall
		
		#display ml5Input
		li $v0, 4
		la $a0, ml5Input
		syscall
		
		#display mad6
		li $v0, 4
		la $a0, mad6
		syscall
		
		#display ml6Input
		li $v0, 4
		la $a0, ml6Input
		syscall
		
	
	#End of the main function
	li $v0, 10  #system signal for ending main function 
	syscall