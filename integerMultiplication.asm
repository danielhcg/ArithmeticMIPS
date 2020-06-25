#several methods to multiply in MIPS
# 'mul'  : method 1, takes 3 registers
# 'mult' : method 2, takes 2 registers
# 'sll'  : method 3, less flexible than mult or mul

.data
    newLine: .asciiz "\n"
    problem1: .asciiz "10 x 4 = "
    problem2: .asciiz "6 x 9 = "
    problem3: .asciiz "5 x 8 = "

.text
    
    #DISPLAYING FIRST PROBLEM MESSAGE-----------------------------------
    li $v0, 4            #system signal for string printing
    la $a0, problem1
    syscall   #execute--------------------------------------------------
    
    
    #MULTIPLYING 10 AND 4------------------------------------------------
    #Getting values into registers without using RAM
    addi $s0, $zero, 10  #add immediate, where immediate is a constant
    			 #add 10 + 0, store in $s0 register
    
    addi $s1, $zero, 4   #add immediate, where immediate is a constant
    		       	 #add 4 + 0, store in $s1 register
    			
    #Now that variables have been 'declared', its time to multiply
    mul $t0, $s0, $s1    #multiply $s1 x $s0, store in $t0 register
    
    #Displaying result
    li $v0, 1            #get ready system, bc i want to print an integer
    add $a0, $zero, $t0  #putting the value of $t0 in argument $a0
    syscall    #execute------------------------------------------------
    
    
    #PRINTING NEW LINE-------------------------------------------------
    li $v0, 4            #system signal for printing string
    la $a0, newLine
    syscall  #execute-------------------------------------------------
    
    
    #DISPLAYING SECONG PROBLEM MESSAGE---------------------------------
    li $v0, 4            #system signal for printing string
    la $a0, problem2     #load problem2
    syscall   #execute-------------------------------------------------
    
    
    #MULTIPLYING 6 x 9-------------------------------------------------
    #Getting values into registers without using RAM
    addi $s0, $zero, 6   #add immediate, where immediate is a constant
    			 #add 6 + 0, store in $s0 register
    			
    addi $s1, $zero, 9   #add immediate, where immediate is a constant
    			 #add 9 + 0, store in $s1 register
    			
    #Now that variables have been 'declared', its time to multiply 
    mul $t0, $s0, $s1    #multiply $s1 x $s0, store in $t0 register
    
    #Displaying result
    li $v0, 1            #get ready system, bc i want to print an integer
    add $a0, $zero, $t0  #moving $t0 value to $a0 argument for printing
    syscall   #execute--------------------------------------------------
    
    
    #PRINTING NEW LINE--------------------------------------------------
    li $v0, 4            #system signal for printing string
    la $a0, newLine
    syscall  #execute---------------------------------------------------
    
    
    #DISPLAYING THIRD PROBLEM MESSAGE-----------------------------------
    li $v0, 4            #system signal for printing a string
    la $a0, problem3     #load problem3
    syscall  #execute---------------------------------------------------
    
    
    #MULTIPLYING 5 X 8--------------------------------------------------
    #Getting values into registers without using RAM
    addi $s0, $zero, 5   #add immediate, where immediate is a constant
    			 #add 5 + 0, store in $s0 register
    			 
    addi $s1, $zero, 8   #add immediate, whre immediate is a constant
    			 #add 8 + 0, store in $s1 register
    			 
    #Now that variables have been 'declared', its time to multiply
    mul $t0, $s0, $s1    #multiply $s1 x $s0, store in $t0 register
    
    #Display result
    li $v0, 1            #get ready system, bc i want to print an integer
    add $a0, $zero, $t0  #moving $t0 value to $a0 argument for printing
    syscall  #execute----------------------------------------------------
   
   
    # 'mul' is limited to only 32 total bits, anything larger needs 'mult'
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
