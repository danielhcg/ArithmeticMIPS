#Celsius to Fahrenheit Table
#Design a program that displays a table of the Celsius temperatures 0 through 20 
#and their Fahrenheit equivalents. The formula for converting a temperature from 
#Celsius to Fahrenheit is F = (9C/5) + 32 where F is the Fahrenheit temperature and 
#C is the Celsius temperature. Your program must use a loop to display the table.

.data

	#program title         
	programTitle:  .asciiz "Celsius to Fahrenheit Table-------\n"
	
	#output messages
	topRowMessage: .asciiz "Celsius		Fahrenheit\n"
	doneMessage:   .asciiz "Done!\n"
	
	#incrementor for while loop
	incrementor:   .word 0
	
	#cosmetic messages
	newLine: .asciiz "\n"
	space:   .asciiz " ---------------- "
	                
	
	#conversion factors
	number1:     .float 9.0
	number2:     .float 5.0
	number3:     .float 32.0
	zeroAsFloat: .float 0.0
	

.text

	main: 
	
		#loading conversion factors into processor registers
		lwc1, $f2, number1 #9
		lwc1, $f3, number2 #5
		lwc1, $f4, number3 #32
		lwc1, $f5, zeroAsFloat #0
	
		#loading incrementor into processor register
		lw $t1, incrementor
	
		#display title
		li $v0, 4
		la $a0, programTitle
		syscall
		
		#display title row of table 
		li $v0, 4
		la $a0, topRowMessage
		syscall
		
		#while loop to display table values
		while:
		
			#loop body
			
			#branch to exit once incremtor reaches 20
			bgt $t1, 20, exit
			
				#display incrementor
				li $v0, 1
				add $a0, $t1, $zero
				syscall
				
				#displaying a space
				li $v0, 4
				la $a0, space
				syscall
				
				#convert copy of iteration number to float for calculation
				mtc1 $t1, $f1
				cvt.s.w $f1, $f1
				
				#multiply iteration number by 9
				mul.s $f1, $f1, $f2
				
				#dividing by 5
				div.s $f1, $f1, $f3
				
				#adding 32
				add.s $f1, $f1, $f4
				
				#displaying result
				li $v0, 2
				add.s $f12, $f5, $f1
				syscall
				
				#display new line
				li $v0, 4
				la $a0, newLine
				syscall
			
			#increment the incrementor
			addi $t1, $t1, 1 #i++
			
			#jump back to while
			j while
		
		exit: 
			
			#display nothing when loop is done
	
	#closing statement for main
	li $v0, 10
	syscall


