.data

	#'declaring' variables in RAM to store user input, initializing everything to 0
	H:   .float 0.0
	BB:  .float 0.0
	HBP: .float 0.0
	AB:  .float 0.0
	SF:  .float 0.0

	#creating my default zero
	zeroAsFloat: .float 0.0	

	
	programTitle: .asciiz "This program calculates a player's OBP"
	hitPrompt: .asciiz "\nHits: "
	walkPrompt: .asciiz "Walks: "
	hbpPrompt: .asciiz "Hit by Pitch: "
	abPrompt: .asciiz "At bats: "
	sacFlyPrompt: .asciiz "Sac Flys: "
 
.text
	
	#main method
	main: 
	
		#displaying title message
		li $v0, 4
		la $a0, programTitle
		syscall
	
	
	
		#placing zeroAsFloat into register $f4
		lwc1 $f4, zeroAsFloat
	

		#prompting user to enter hits
		li $v0, 4
		la $a0, hitPrompt
		syscall
		#reading what user entered for hits, value is stored in $f0
		li $v0, 6
		syscall
		#placing H into register $f5
		lwc1 $f5, H
		#displaying value
		#li $v0, 2
		add.s $f12, $f0, $f5
		#syscall
		
		
		#clearing the value of $f0
		mul.s $f0, $f4, $f0
		#clearing the value of $f12
		#mul.s $f12, $f0, $f0
		
		
		#prompting user to enter walks ----------------------------------------------------------------
		li $v0, 4
		la $a0, walkPrompt
		syscall 
		#reading what user enters for walks, value is stored in $f0
		li $v0, 6
		syscall
		#placing BB into register $f6
		lwc1 $f6, BB
		#displaying the value
		#li $v0, 2
		add.s $f12, $f0, $f12
		#syscall
		
		
		
		#clearing the value of $f0
		mul.s $f0, $f4, $f0
		
		
		#prompt user to enter hit by pitches-------------------------------------------------------------
		li $v0, 4
		la $a0, hbpPrompt
		syscall
		#reading what user enters for hbp, value is stored in $f0
		li $v0, 6
		syscall
		#displaying value
		li $v0, 2
		add.s $f12, $f12, $f0
		syscall
		

	
	#closing statement
	li $v0, 10
	syscall
	

	
