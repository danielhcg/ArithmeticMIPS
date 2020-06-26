#Multiplication using shift left logical (sll)

.data
    newLine: .asciiz "\n" 
    problem1: .asciiz "4 x 8 = "
    problem2: .asciiz "16 x 4 = "
    problem3: .asciiz "25 x 16 = "
    problem4: .asciiz "17 x 2 = "
    problem5: .asciiz "7 x 32 = "
    problem6: .asciiz "19 x 64 = "
    problem7: .asciiz "15 x 128 = "
    problem8: .asciiz "5 x 256 = "

.text
    
    #multiplying 4 x 8---------------------------------------------------
    #printing problem1
    li $v0, 4
    la $a0, problem1
    syscall
    
    #adding 4 to register s0
    addi $s0, $zero, 4
    
    #multiply t0(4) x 2^3
    sll $t0, $s0, 3
    
    #display result
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    #displaying new line
    li $v0, 4
    la $a0, newLine
    syscall
    
    #multiplying 16 x 4--------------------------------------------------
    #displaying problem2
    li $v0, 4
    la $a0, problem2
    syscall
    
    #adding 16 to register s0
    addi $s0, $zero, 16
    
    #multiply t0(16) x 2^2
    sll $t0, $s0, 2
    
    #display result
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    #displaying new line
    li $v0, 4
    la $a0, newLine
    syscall
    
    #multiplying 25 x 16-------------------------------------------------
    #displaying problem3
    li $v0, 4
    la $a0, problem3
    syscall
    
    #adding 25 to register s0
    addi $s0, $zero, 25
    
    #multiply t0(25) x 2^4
    sll $t0, $s0, 4
    
    #display result
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    #displaying new line
    li $v0, 4
    la $a0, newLine
    syscall
    
    #multiplying 17 x 2--------------------------------------------------
    #displaying problem4
    li $v0, 4
    la $a0, problem4
    syscall
    
    #adding 17 to register s0
    addi $s0, $zero, 17
    
    #multiply t0(17) x 2^1
    sll $t0, $s0, 1
    
    #display result
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    #displaying new line
    li $v0, 4
    la $a0, newLine
    syscall
    
    #multiplying 7 x 32--------------------------------------------------
    #displaying problem5
    li $v0, 4
    la $a0, problem5
    syscall
    
    #adding 7 to register s0
    addi $s0, $zero, 7
    
    #multiply t0(7) x 2^5
    sll $t0, $s0, 5
    
    #display result
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    #displaying new line
    li $v0, 4
    la $a0, newLine
    syscall
    
    #multiplying 19 x 64-------------------------------------------------
    #displaying problem5
    li $v0, 4
    la $a0, problem6
    syscall
    
    #adding 19 to register s0
    addi $s0, $zero, 19
    
    #multiply t0(19) x 2^6
    sll $t0, $s0, 6
    
    #display result
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    #displaying new line
    li $v0, 4
    la $a0, newLine
    syscall
    
    #multiplying 15 x 128------------------------------------------------
    #displaying problem7
    li $v0, 4
    la $a0, problem7
    syscall
    
    #adding 15 to register s0
    addi $s0, $zero, 15
    
    #multiply t0(19) x 2^7
    sll $t0, $s0, 7 
    
    #display result
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    #displaying new line
    li $v0, 4
    la $a0, newLine
    syscall
    
    #multiplying 5 x 256-------------------------------------------------
    #displaying problem8
    li $v0, 4
    la $a0, problem8
    syscall
    
    #adding 5 to register s0
    addi $s0, $zero, 5
    
    #multiply t0(8) x 2^8
    sll $t0, $s0, 8
    
    #display result
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    #displaying new line
    li $v0, 4
    la $a0, newLine
    syscall 
    