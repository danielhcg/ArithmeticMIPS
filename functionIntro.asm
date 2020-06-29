#introcuction to functions

.data
	
	message: .asciiz "Hi, everybody. \nMy name is Daneil. \n"
	message1: .asciiz "\nHere is an example of division with overflow.\n"
	message2: .asciiz "\nHere is an example of division without overflow.\n"
	message3: .asciiz "\n\nHere is an example of multiplication using sll.\n"
	message4: .asciiz "\n\nHere is an example of integer subtraction.\n"
	newLine: .asciiz "\n"
	rmdr: .asciiz " remainder "
	problem1: .asciiz "89 / 10 = "
	problem2: .asciiz "155 / 5 = "
	problem3: .asciiz "17 x 16 = "
	problem4: .asciiz "785 - 63 = "
	
	#storing numbers in RAM for subtraction
	num1: .word 785
	num2: .word 63
	
.text
	
	#main function
	main:
	
		#calling functions
		jal displayMessage  
		jal displayMessage1 
		jal displayProblem1 
		jal calculateProblem1 
		jal displayMessage2  
		jal displayProblem2  
		jal calculateProblem2 
		jal displayMessage3
		jal displayProblem3
		jal calculateProblem3
		jal displayMessage4
		jal displayProblem4
		jal calculateProblem4
	
	#tells the computer that program is done
	li $v0, 10
	syscall
	
	#display division with overflow message
	displayMessage1:
		li $v0, 4
		la $a0, message1
		syscall
		
		jr $ra  #goes back to main
	
	#function to display message
	displayMessage:
		li $v0, 4
		la $a0, message
		syscall
		
		jr $ra  #goes back to main
		
	#function to display problem1 mesage
	displayProblem1:
		li $v0, 4
		la $a0, problem1
		syscall
		
		jr $ra #goes back to main
		
	#function to calculate and display 89/10
	calculateProblem1:
		addi $t0, $zero, 89  #'declaring' variables
		addi $t1, $zero, 10  #'declaring' variables
		
		div $t0, $t1  #using 'div' to divide
		
		mflo $s0  #moving quotient from lo to s0
		mfhi $s1  #moving remainder from hi to s1
		
		#display quotient value
		li $v0, 1
		add $a0, $zero, $s0
		syscall
		
		#display remainder message
		li $v0, 4
		la $a0, rmdr
		syscall
		
		#display remainder value
		li $v0, 1
		add $a0, $zero, $s1
		syscall 
		
		#moving output to new line
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra  #end of function
		
	#function to display message 2
	displayMessage2:
		li $v0, 4
		la $a0, message2
		syscall 
			
		jr $ra  #end of function
		
	#function to display problem2
	displayProblem2:
		li $v0, 4
		la $a0, problem2
		syscall 
		
		jr $ra  #end of function
		
	#function to calculate and display problem2
	calculateProblem2:
		#storing 2 values into registers to divide
		addi $t0, $zero, 155  #'declaring' a variable
		addi $t1, $zero, 5    #'declaring' a variable
		
		div $s0, $t0, $t1  #using 'div' to divide, stored in s0
		
		#displaying result
		li $v0, 1
		add $a0, $zero, $s0
		syscall 
		
		jr $ra  #end of function
		
	#function to display problem 3 message
	displayMessage3: 
		li $v0, 4
		la $a0, message3
		syscall
		
		jr $ra  #end of function
		
	#function to display problem 3
	displayProblem3:
		li $v0, 4
		la $a0, problem3
		syscall 
		
		jr $ra
		
	#function to calcluate and display problem3 17 x 16
	calculateProblem3:
		addi $s0, $zero, 17  #'declaring' variable
		
		sll $t0, $s0, 4  #multiply 17 x 2^4
		
		#display result
		li $v0, 1
		add $a0, $zero, $t0
		syscall 
		
		jr $ra  #end of function
		
	#function to display problem4 message
	displayMessage4: 
		li $v0, 4
		la $a0, message4
		syscall 
		
		jr $ra  #end of function 
		
	#function to display problem4
	displayProblem4:
		li $v0, 4
		la $a0, problem4
		syscall 
		
		jr $ra  #end of function 
		
	#function to calcluate problem4 and display the result
	calculateProblem4:
		#load values form RAM into registers
		lw $s0, num1
		lw $s1, num2
		
		sub $t0, $s0, $s1  #subtracting num1 - num2, storing in t0
		
		#displaying result
		li $v0, 1
		add $a0, $zero, $t0
		syscall 
		
		jr $ra #end of function 
		
		
		

