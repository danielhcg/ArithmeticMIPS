#Integer Division using 'div' keyword

.data
    newLine:  .asciiz "\n"
    problem2: .asciiz "30 / 5 = "
    problem3: .asciiz "60 / 5 / 3 = "
    problem4: .asciiz "100 / 5 / 4 / 2 = "
    problem5: .asciiz "96 / 2 / 3 / 4 / 2 = "
	
.text

   #DIVIDING 2 NUMBERS 30/5-----------------------------
   
   #displaying problem
   li $v0, 4  #system signal for string printing
   la $a0, problem2
   syscall
   
   #storing 2 values into registers to divide
   #'declaring' a variable
   addi $t0, $zero, 30 #30+0 stored in t0
   
   #'declaring' a variable
   addi $t1, $zero, 5  #5+0 stored in t1
   
   #dividing the variables
   div $s0, $t0, $t1   #30/5 stored in s0
   
   #displaying result
   li $v0, 1  #system signal for printing int
   add $a0, $zero, $s0 #move result to argument
      		           #bc only args can be printed
   syscall  #execute
   
   #moving cursor to new line
   li $v0, 4  #system signal for string printing
   la $a0, newLine
   syscall
   
   #DIVIDING 3 NUMBERS 60/5/3---------------------------
   
   #displaying problem
   li $v0, 4  #system signal for string printing
   la $a0, problem3
   syscall
   
   #storing 3 values into registers to divide
   #'declaring' a variable
   addi $t0, $zero, 60  #60+0 stored in t0
   #'declaring' a variable
   addi $t1, $zero, 5   #5+0 stored in t1
   #'declaring' a variable
   addi $t2, $zero, 3   #3+0 stored in t2
   
   #dividing first 2 integers
   div $s0, $t0, $t1    #60/5 stored in s0
   
   #dividing with last integer
   div $s1, $s0, $t2   #12/3 stored in s1
   
   #displaying result
   li $v0, 1  #system signal for integer printing
   add $a0, $zero, $s1
   syscall  #execute
   
   #moving cursor to new line
   li $v0, 4  #system signal for string printing
   la $a0, newLine
   syscall  #execute
   
   #DIVIDING 4 NUMBERS 100/5/4/2---------------------
   
   #displaying problem
   li $v0, 4  #system signal for string printing
   la $a0, problem4
   syscall  #execute
   
   #storing 4 values into registers to divide
   #'declaring' the 4 variables
   addi $t0, $zero, 100  #100+0 stored in t0
   addi $t1, $zero, 5    #5+0   stored in t1
   addi $t2, $zero, 4    #4+0   stored in t2
   addi $t3, $zero, 2    #2+0   stored in t3
   
   #dividing t0/t1 stored in s0
   div $s0, $t0, $t1
   
   #dividing s0/t2 stored in s1
   div $s1, $s0, $t2
   
   #dividing s1/t3 stored in s2
   div $s2, $s1, $t3
   
   #system rounds down to nearest whole number
   
   #displaying result
   li $v0, 1  #system signal for int printing
   add $a0, $zero, $s2  #s2+0 stored in $a0
   syscall  #execute
   
   #moving cursor to new line 
   li $v0, 4  #system signal for string printing
   la $a0, newLine
   syscall  #execute
   
   #DIVIDING 5 NUMBERS 96/2/3/4/2--------------------
   
   #displaying problem
   li $v0, 4  #system signal for string printing
   la $a0, problem5
   syscall  #execute
   
   #storing 5 variables into registers to divide
   #'declaring' the 5 variables
   addi $t0, $zero, 96  #96+0 stored in t0
   addi $t1, $zero, 2   #2+0  stored in t1
   addi $t2, $zero, 3   #3+0  stored in t2
   addi $t3, $zero, 4   #4+0  stored in t3
   addi $t4, $zero, 2   #2=0  stored in t4
   
   #dividing t0/t1 stored in s0
   div $s0, $t0, $t1   
   #dividing s0/t2 stored in s1
   div $s1, $s0, $t2
   #dividing s1/t3 stored in s2
   div $s2, $s1, $t3
   #dividing s2/t4 stored in s3
   div $s3, $s2, $t4
   
   #displaying result
   li $v0, 1  #system signal for int printing
   add $a0, $zero, $s3
   syscall 
   
   

   
   
   
  