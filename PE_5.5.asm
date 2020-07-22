#Tuition Increase
#At one college, the tuition for a full-time student is $6,000 per 
#semester. It has been announced that the tuition will increase by 
#2 percent each year for the next five years. Design a program with 
#a loop that displays the projected semester tuition amount for the 
#next five years.

.data

	programTitle:  .asciiz "Tuition Increase----------\n"
	initialYear:   .asciiz "Year 1 tuition cost: $"
	iterationYear: .asciiz "Year "
	doneMessage:   .asciiz "Done!"
	newLine:       .asciiz "\n"
	colon:         .asciiz " tuition cost: $"
	
	incrementor:   .word 2
	initialAmount: .float 6000.00
	rate:          .float 0.02
	zeroAsFloat:   .float 0.0

.text

	main:
	
		#loading values from ram into processor registers
		lw $t0, incrementor
		lwc1 $f1, initialAmount
		lwc1 $f2, rate
		lwc1 $f5, zeroAsFloat
	
		#displaying title message
		li $v0, 4
		la $a0, programTitle
		syscall
		
		#display intial year 
		li $v0, 4
		la $a0, initialYear
		syscall
		
		#display initialAmount
		li $v0, 2  #code to display a float: 2
		lwc1 $f12, initialAmount
		syscall
		
		#display newline
		li $v0, 4
		la $a0, newLine
		syscall
	
		while:
		
			beq $t0, 6, exit
			
			#display iterationYear
			li $v0, 4
			la $a0, iterationYear
			syscall
			
			#display iteration number
			li $v0, 1
			add $a0, $zero, $t0
			syscall
			
			#display colon
			li $v0, 4
			la $a0, colon
			syscall
			
			#processing intial amount 
			mul.s $f3, $f1, $f2
			add.s $f1, $f3, $f1
			
			#display increased tuition 
			li $v0, 2
			add.s $f12, $f5, $f1
			syscall
			
			#displaying new line
			li $v0, 4
			la $a0, newLine
			syscall
			
			#increment incrementor
			addi $t0, $t0, 1
			
			j while	
		
		exit:
		
			#display done message
			li $v0, 4
			la $a0, doneMessage
			syscall
	
	li $v0, 10
	syscall
