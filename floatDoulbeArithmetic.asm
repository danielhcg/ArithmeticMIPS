.data

	#'declaring' variables in RAM to store user input, initializing everything to 0
	uBB:     .float 0.00
	hBP:     .float 0.00
	single:  .float 0.00
	double:  .float 0.00
	triple:  .float 0.00
	homeRun: .float 0.00
	atBat:   .float 0.00
	totalBB: .float 0.00
	iBB:     .float 0.00
	sacFly:  .float 0.00
	
	#'declaring' converstion factors for numerator values
	uBBFactor: .float 0.69
	hBPFactor: .float 0.72
	singleFactor: .float 0.89
	doubleFactor: .float 1.27
	tripleFactor: .float 1.62
	homeRunFactor: .float 2.10
	
	programTitle: .asciiz "This program calculates your wOBA.\n\n"
	prompt1: .asciiz "Please enter your unintentional walks: "
	prompt2: .asciiz "\nPlease enter your hit by pitch: "
	prompt3: .asciiz "\nPlease enter your singles: "
	prompt4: .asciiz "\nPlease enter your doubles: "
	prompt5: .asciiz "\nPlease enter your triples: "
	prompt6: .asciiz "\nPlease enter your home runs: "
	prompt7: .asciiz "\nPlease enter your at bats: "
	prompt8: .asciiz "\nPlease enter your intentional walks: "
	prompt9: .asciiz "\nPlease enter your sacrifice flys: "
 
.text
	
	#main method
	main: 
	
		#displaying title message
		jal displayTitle
		
		#loading uBB value into $f0 register
		lwc1 $f0, uBB
		#displaying prompt1 message
		jal displayPrompt1
		#reading user input for uBB
		li $v0, 6  #value stored in $f0, code to read float: 6
		syscall
		
		#loading hBP value into $f1 register
		lwc1 $f1, hBP
		#displaying prompt2 message
		jal displayPrompt2
		#reading user input for hBP
		li $v0, 6  #value stored in $f1, code to read float: 6
		syscall
		
		#loading single value into $f2 register
		lwc1 $f2, single
		#displaying prompt3 message
		jal displayPrompt3
		#reading user input for single
		li $v0, 6  #value stored in $f2, code to read float: 6
		syscall
		
		#loading double value into $f3 register
		lwc1 $f3, double
		#displaying prompt4 message
		jal displayPrompt4
		#reading user input for double
		li $v0, 6  #value stored in $f3, code to read float: 6
		syscall
		
		#loading triple value into $f4 register
		lwc1 $f4, triple
		#displaying prompt5 message
		jal displayPrompt5
		#reading user input for triple
		li $v0, 6  #value stored in $f4, code to read float: 6
		syscall
		
		#loading homeRun value into $f5 register
		lwc1 $f5, homeRun
		#displaying prompt6 message
		jal displayPrompt6
		#reading user input for homeRun
		li $v0, 6  #value stored in $f5, code to read float: 6
		syscall
		
		#loading atBat value into $f6 register
		lwc1 $f6, atBat
		#displaying prompt7 message
		jal displayPrompt7
		#reading user input for atBat
		li $v0, 6  #value stored in $f6, code to read float: 6
		syscall
		
		#loading iBB value into $f7 register
		lwc1 $f7, iBB
		#displaying prompt8 message
		jal displayPrompt8
		#reading user input for iBB
		li $v0, 6  #value stored in $f7, code to read float: 6
		syscall
		
		#loading sacFly value into $f8 register
		lwc1 $f8, sacFly
		#displaying prompt9 message
		jal displayPrompt9
		#reading user input for sacFly
		li $v0, 6  #value stored in $f8, code to read float: 6
		syscall
		
		#now that we have all the variables, it is time to do the calculation
		
		#loading conversion factor values into $f registers
		lwc1, $f9, uBBFactor

	
	#closing statement
	li $v0, 10
	syscall
	
	#function to display title message
	displayTitle:
		li $v0, 4
		la $a0, programTitle
		syscall 
	#closing statement
	jr $ra
	
	#function to display prompt1 message
	displayPrompt1:
		li $v0, 4
		la $a0, prompt1
		syscall 
	#closing statement
	jr $ra
		
	#function to display prompt2 message
	displayPrompt2:
		li $v0, 4
		la $a0, prompt2
		syscall 
	#closing statement
	jr $ra
		
	#function to display prompt3 message
	displayPrompt3:
		li $v0, 4
		la $a0, prompt3
		syscall 
	#closing statement
	jr $ra
		
	#function to display prompt4 message
	displayPrompt4:
		li $v0, 4
		la $a0, prompt4
		syscall 
	#closing statement
	jr $ra
		
	#function to display prompt5 message
	displayPrompt5:
		li $v0, 4
		la $a0, prompt5
		syscall 
	#closing statement
	jr $ra
		
	#function to display prompt6 message
	displayPrompt6:
		li $v0, 4
		la $a0, prompt6
		syscall 
	#closing statement
	jr $ra
		
	#function to display prompt7 message
	displayPrompt7:
		li $v0, 4
		la $a0, prompt7
		syscall 
	#closing statement
	jr $ra
		
	#function to display prompt8 message
	displayPrompt8:
		li $v0, 4
		la $a0, prompt8
		syscall 
	#closing statement
	jr $ra
		
	#function to display prompt9 message
	displayPrompt9:
		li $v0, 4
		la $a0, prompt9
		syscall 
	#closing statement
	jr $ra
	