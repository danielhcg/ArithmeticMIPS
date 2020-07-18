#need to do
	#Done. ask user how many triangles to calculate
	#Done. associate name with triangle and print out
	#Done. display at each iteration which triangle we are currently working on
	#Done. change title to include the number of iterations


.data

	recNumPrompt: .asciiz "Enter number of rectangles you wish to process: "
	areaPrompt1:  .asciiz "\nCalculating the area of "
	areaPrompt2:  .asciiz " rectanlges.\n"
	recNumber:    .asciiz "\nRectangle "
	lengthPrompt: .asciiz "\nLength: "
	widthPrompt:  .asciiz "Width: "
	areaOutPut:   .asciiz "Area: "
	termMessage:  .asciiz "\nDone!"
	newLine:      .asciiz "\n"
	

.text

	main: 
		
		#prompting user to enter number of rectangles they wish to 
		#process
		jal displayRecPrompt
		#reading number of rectangles user wishes to process
		li $v0, 5
		syscall 
		#moving user input from v0 to t1
		move $t1, $v0
	
		#displaying first part of title
		jal displayTitle1
		#print number of triangles user wishes to process
		li $v0, 1
		move $a0, $t1
		syscall
		#displaying second part of title
		jal displayTitle2
		
	
		addi $t0, $zero, 0 #Incrementor
		while:
		
			beq $t0, $t1, exit
			
				#displaying rectangle
				li $v0, 4
				la $a0, recNumber
				syscall
				#displaying rectangle number
				li $v0, 1
				addi $a0, $t0, 1
				syscall
			
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
	
	displayRecPrompt:
		li $v0, 4
		la $a0, recNumPrompt
		syscall
	jr $ra
	
	displayTitle1:
		#Displays title.
		li $v0, 4
		la $a0, areaPrompt1
		syscall
	jr $ra
	
	displayTitle2:
		#Displays title.
		li $v0, 4
		la $a0, areaPrompt2
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
	

