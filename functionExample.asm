.data

	areaPrompt: .asciiz "Calculate the area of 3 rectangles\n"
	lengthPrompt: .asciiz "\nLength: "
	widthPrompt: .asciiz "Width: "
	areaOutPut: .asciiz "Area: "
	termMessage: .asciiz "\nDone!"
	newLine: .asciiz "\n"
	

.text

	main: 
	
		jal displayTitle
	
		addi $t0, $zero, 0 #Incrementor
		while:
		
			beq $t0, 3, exit
			
				#propmt for length. 
				jal displayLengthPrompt
				#Reading uiLength
				li $v0, 6  #stored in f0
				syscall
		
				mov.s $f1, $f0 #moving uiLength to f1
		
				#prompt for width.
				jal displayWidthPrompt
				#Reading uiWidth
				li $v0, 6
				syscall   #stored in f0
		
				mov.s $f2, $f0 #moving uiWidth to f2
		
				#Display output
				jal displayOutPut

				#Calling calArea to multiply both values
				jal calcArea
				
				#Displaying new line
				jal displaynewLine
		
				#clearing f0, f1, f2
				mul.s $f0, $f10, $f0
				mul.s $f1, $f10, $f1
				mul.s $f2, $f10, $f2
			
			addi $t0, $t0, 1  #i++
			j while
		
		exit:
			li $v0, 4
			la $a0, termMessage
			syscall
		

	
	li $v0, 10
	syscall
	
	displayTitle:
		#Displays title.
		li $v0, 4
		la $a0, areaPrompt
		syscall
	jr $ra
	
	displayLengthPrompt:
		#Displays length prompt.
		li $v0, 4
		la $a0, lengthPrompt
		syscall
	jr $ra
	
	displayWidthPrompt:
		#Displays width Prompt.
		li $v0, 4
		la $a0, widthPrompt
		syscall
	jr $ra
	
	displayOutPut:
		li $v0, 4
		la $a0, areaOutPut
		syscall
	jr $ra
	
	displaynewLine:
		li $v0, 4
		la $a0, newLine
		syscall
	jr $ra
	
	#Procedure to multiply 2 f register values
	calcArea:
		li $v0, 2
		mul.s $f12, $f1, $f2
		syscall
	jr $ra
