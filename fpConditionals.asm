#This program tests the equality of 2 floating point numbers

#Conditionals with floating points numbers uses different 
#commands than conditionals with integers. 

.data

	#'declaring' 2 string variables in random access memory
	message: .asciiz "It was true.\n"
	message2: .asciiz "It was false.\n"
	
	#'declaring' float variables in random access memory
	num1: .float 10.4
	num2: .float 10.4
	num3: .float  6.3
	num4: .float 12.9
	num5: .float  3.5
	num6: .float  8.4
	num7: .float  8.4

.text

	main: #main procedure---------------------------------------
		#calling equality driver procedure
		#jal equalDriver
		#calling inequality driver procedure
		#jal notEqualDriver
		#calling less than driver procedure
		#jal lessThanDriver
		#calling not less than driver procedure
		#jal notLessThanDriver
		#calling less than or equal to driver
		jal lessThanOrEqualToDriver
	li $v0, 10
	syscall #closing statement for main procedure---------------
	
	
	
	
	equalDriver: #driver procedure to test for equality---------
		#moving numbers declared in RAM to processor registers
		lwc1 $f0, num1 #10.4
		lwc1 $f2, num2 # 4.6
		
		c.eq.s $f0, $f2 #comparing the 2 values
		
		bc1t exit #if true, branch to exit label
				  #else, continue on to next line of code
		
		#if false, display message2
		li $v0, 4
		la $a0, message2
		syscall	
	jr $ra #end of procedure------------------------------------
	
	
	
	
	notEqualDriver: #driver procedure to test for inequality----
		#moving numbers declared in RAM to processor registers
		lwc1 $f4, num3 # 6.3
		lwc1 $f6, num4 #12.9
		
		c.eq.s $f4, $f6 #comparing the 2 values
		
		bc1t exit #if true, branch to exit label
				  #else, continue on to next line of code
				  
		#if false, display message2
		li $v0, 4
		la $a0, message2
		syscall
	jr $ra #end of procedure------------------------------------
	
	
				
							
	lessThanDriver: #driver procedure to test for less than-----
		#moving numbers declared in RAM to processor registers
		lwc1 $f8,  num3 # 6.9
		lwc1 $f10, num5 #3.5
		
		c.lt.s $f10, $f8 #comparing less-than-ality of values
		
		bc1t exit #if true, branch to exit label
				  #else, continue on to next line of code
				 
		#if false, display message2
		li $v0, 4
		la $a0, message2
		syscall
	jr $ra #end of procedure------------------------------------				
	
	
	
	
	notLessThanDriver: #driver to test not less than------------
		#moving numbers declared in RAM to processor registers
		lwc1 $f14, num4 #12.9
		lwc1 $f16, num2 #10.4
		
		c.lt.s $f14, $f16 #comparing less-than-ality of values
		
		bc1t exit #if true, branch to exit label
				  #else, continue on to next line of code
				  
		#if false, display message2
		li $v0, 4
		la $a0, message2
		syscall
	jr $ra #end of procedure------------------------------------
	
	
	
	
	lessThanOrEqualToDriver: #driver to test <=-----------------
		#moving numbers declared in RAM to processor registers
		lwc1 $f18, num6 #8.4
		lwc1 $f20, num7 #8.4
		
		c.le.s $f18, $f20 #comparing <=-ality of values
		
		bc1t exit #if true, branch to exit label
				  #else, continue on to next line of code
				  
		#if false, display message2
		li $v0, 4
		la $a0, message2
		syscall
	jr $ra #end of procedure------------------------------------
	
	
	
	
	exit: #label to display first message-----------------------
		li $v0, 4
		la $a0, message
		syscall #end of label-----------------------------------
	


