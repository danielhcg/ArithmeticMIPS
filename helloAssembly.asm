.data #variables to be used in program

    #storing numbers in RAM
    num1: .word 20
    num2: .word 8
    num3: .word 25
    num4: .word 18
    num5: .word 3
    num6: .word 7
	
.text #instructions
    
    #subtracting 2 numbers  (20 - 8)
    #load values to registers $s0 and $s1
    lw $s0, num1               # $s0 = 20
    lw $s1, num2               # $s1 = 8
    #subtracting then assigning result to $t0
    sub $t0, $s0, $s1          # $t0 = $s0 - $s1
    #displaying result
    li $v0, 1         #telling system i want to print integer
    move $a0, $t0     #pseudo instruction, moves $t0 to $a0
                      #system can only print out arguments
    #syscall
    
    
    #subtracting 3 numbers  (25 - 18 - 3)
    #load values to registers $s0, $s1, and $s2
    lw $s0, num3
    lw $s1, num4
    lw $s2, num5
    #subtracting then assigning result to $t0
    sub $t0, $s0, $s1
    #subtracting then assigning result to $t1
    sub $t1, $t0, $s2
    #displaying result
    li $v0, 1       #system signal for printing
    move $a0, $t1
    #syscall
    
    
    #subtracting 4 numbers (25 - 3 - 8 - 7) 
    #load values to registers $s0, $s1, $s2, $s3
    lw $s0, num3
    lw $s1, num2
    lw $s2, num5
    lw $s3, num6
    #subtracting num3 - num2, assigning result to $t0
    sub $t0, $s0, $s1       # $t0 = 25 - 8 = 17
    #subtracting $t0(17) - num5(3), assigning result to $t1
    sub $t1, $t0, $s2       # $t1 = 17 - 3 = 14
    #subtracting $t1(14) - num6(7), assigning result to $t2
    sub $t2, $t1, $s3       # $t2 = 14 - 7 = 7
    #displaying final result
    li $v0, 1       #system signal for printing
    move $a0, $t2
    #syscall         #execute
    
    
    #subtracting 5 numbers  (8 - 18 - 7 - 3 - 25)
    #load values to registers $s0, $s1, $s2, $s3, $s4
    lw $s0, num2
    lw $s1, num4
    lw $s2, num6
    lw $s3, num5
    lw $s4, num3
    #subtracting num2 - num4, assigning result to $t0
    sub $t0, $s0, $s1    # $t0 = 8 - 18 = -10
    #subracting $t0 - $s2, assigning result to $t1
    sub $t1, $t0, $s2    # $t1 = -10 - 7 = -17
    #subtracting $t1 - $s3, assigning result to $t2
    sub $t2, $t1, $s3    # $t2 = -17 - -3 = -20
    #subtracting $t2 - $s4, assigning result to $t3
    sub $t3, $t2, $s4    # $t3 = -20 - 25 = -45
    #displaying final result 
    li $v0, 1       #system signal for printing 
    move $a0, $t3
    syscall         #execute
    