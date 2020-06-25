#using the keyword 'mult' for multiplication

.data
    #not using .data for multiplication bc we dont want to 
    #store values in RAM and using registers is faster
    
    #display messages
    newLine: .asciiz "\n"
    problem1: .asciiz "2000 x 10 = "
    problem2: .asciiz "47 x 21 = "
    problem3: .asciiz "22 x 36 x 56 = "
    problem4: .asciiz "15 x 12 x 9 x 8 = "
    problem5: .asciiz "16 x 7 x 3 x 9 x 25 = "

.text

    #multiplying 2 numbers--------------------------------------
    #displaying first problem message
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, problem1
    syscall  #execute

    #store the values to multiply into 2 registers
    #'declaring' 2 int values
    addi $t0, $zero, 2000  #now t0 has value of 200
    			   #bc 2000+0=2000, result stored in t0
    			   
    addi $t1, $zero, 10    #now t1 has value of 10 bc 10+0=10
    
    mult $t0, $t1 #takes 2 registers
    
    mflo $s0 #multiplication result gets moved to lo
             #now we want to move it from lo to a register
    
    #display product
    li $v0, 1
    add $a0, $zero, $s0
    syscall  #execute
    
    #displaying new line
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, newLine
    syscall  #execute-------------------------------------------
    
    
    #multiplying 2 numbers--------------------------------------
    #displaying second problem message
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, problem2
    syscall  #execute
    
    addi $t0, $zero, 47  #'declaring' a value
    addi $t1, $zero, 21  #'declaring' a value
    
    mult $t0, $t1  #multiply the 2 values
    
    mflo $s0  #move from 'lo' to register s0
    
    #display product
    li $v0, 1
    add $a0, $zero, $s0
    syscall  #execute
    
    #displaying new line
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, newLine
    syscall  #execute-------------------------------------------
    
    
    #multiplying 3 numbers--------------------------------------
    #displaying third problem message
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, problem3
    syscall  #execute
    
    addi $t0, $zero, 22  #'declaring' a value
    addi $t1, $zero, 36  #'declaring' a value
    addi $t2, $zero, 56  #'decalring' a value
    
    mult $t0, $t1  #multiply the first 2 values
    
    mflo $s0  #move product of first 2 values into $s0
    
    mult $s0, $t2  #multiply product of first 2 values with 3rd
    
    mflo $s1  #move final product into s1
    
    #display result
    li $v0, 1
    add $a0, $zero, $s1
    syscall  #execute
    
    #displaying new line
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, newLine
    syscall  #execute--------------------------------------------
    
    
    #multiplying 4 numbers---------------------------------------
    #displaying 4th problem message
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, problem4
    syscall  #execute
    
    addi $t0, $zero, 15  #'declaring' a value
    addi $t1, $zero, 12  #'declaring' a value
    addi $t2, $zero, 9   #'declaring' a value
    addi $t3, $zero, 8   #'declaring' a value
    
    mult $t0, $t1  #multiplying first 2 values
    mflo $s0       #move result from lo to s0 register
    
    mult $s0, $t2  #multipying with 3rd value
    mflo $s1       #move result from lo to s1 register
    
    mult $s1, $t3  #multiplying with last value
    mflo $s2       #move result from lo to s2 register
    
    #display final result
    li $v0, 1
    add $a0, $zero, $s2
    syscall  #execute
    
    #displaying new line
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, newLine
    syscall  #execute--------------------------------------------
    
    
    #multiplying 5 numbers---------------------------------------
    #displaying problem 5 message
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, problem5
    syscall  #execute
    
    #'declaring' variables 16, 7, 3, 9, 25
    addi $t0, $zero, 16
    addi $t1, $zero, 7
    addi $t2, $zero, 3
    addi $t3, $zero, 9
    addi $t4, $zero, 25
    
    #multiplying first 2 values and moving them from lo to s0 register
    mult $t0, $t1
    mflo $s0
    #multiplying w/ 3rd value and moving result from lo to s1 register
    mult $s0, $t2
    mflo $s1
    #multiplying w/ 4th value and moving result from lo to s2 register
    mult $s1, $t3
    mflo $s2
    #multiplying w/ 5th value and moving result from lo to s3 register
    mult $s2, $t4
    mflo $s3
    
    #displaying final multiplication result
    li $v0, 1
    add $a0, $zero, $s3
    syscall  #execute
    
    #displaying new line
    li $v0, 4  #system signal/code for string printing = 4
    la $a0, newLine
    syscall  #execute--------------------------------------------
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

