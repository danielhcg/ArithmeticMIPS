#OBP calculation: ( H + BB + HBP ) / ( AB + BB + HBP + SF )

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
	outPutMessage: .asciiz "The players' OBP is "
 
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
		li $v0, 6 #stored in f0
		syscall

		add.s $f12, $f0, $f4 #storing user input in f12

		
		
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

		add.s $f12, $f0, $f12
		
		#moving user entered walks into register f7
		mov.s $f7, $f0 #walks now stored in $f7

	
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
		#li $v0, 2
		add.s $f12, $f12, $f0
		#syscall
		
		mov.s $f9, $f0  #moving hbp into $f0 register
		
		mov.s $f6, $f12 #moving data out of f12 and into f6
						#numerator stored in f6
						
						
		#denominator---------------------------------------------------------
		
		
		#clearing the value of $f12
		mul.s $f12, $f4, $f4
		#clearing the value of $f0
		mul.s $f0, $f4, $f0
		
		
		#prompt user to enter at bats------------------------------------------
		li $v0, 4
		la $a0, abPrompt
		syscall
		#reading user input
		li $v0, 6  #input stored in $f0
		syscall
		add.s $f12, $f7, $f0  #at bats + walks stored in $f12
		
		mov.s $f10, $f12  #moving at bats + walks intor f10
		
		
		#clearing the value of $f12
		mul.s $f12, $f4, $f4
		#clearing the value of $f0
		mul.s $f0, $f4, $f0
		
		add.s $f12, $f10, $f9  #(at bats + walks) + hbp stored in f12
		
		mov.s $f11, $f12  #move (at bats + walks) + hbp into f11
		
		#clearing the value of $f12
		mul.s $f12, $f4, $f4
		#clearing the value of $f0
		mul.s $f0, $f4, $f0
		
		#prompt user to enter sac flys
		li $v0, 4
		la $a0, sacFlyPrompt
		syscall
		#read user input
		li $v0, 6 #stored in $f0
		syscall
		add.s $f12, $f0, $f11
		
		mov.s $f13, $f12
		
		#clearing the value of $f12
		mul.s $f12, $f4, $f4
		#clearing the value of $f0
		mul.s $f0, $f4, $f0
		
		#display output message
		li $v0, 4
		la $a0, outPutMessage
		syscall
		
		li $v0, 2
		div.s $f12,$f6 ,$f13
		syscall

	
	#closing statement
	li $v0, 10
	syscall
	

	
