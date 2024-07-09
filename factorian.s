.globl _start

# Given a number, find whether it is a Factorion number. 
# We will test the code only with three-digit numbers.
# The answer should be placed in a0. 
# The sum of the factorials of its digits should be placed in a1.
# The input number is placed in a2

_start:

    li a2, 145
    
    # copy in a3 for usage
    add a3, a2, x0
	li a4, 10
    # a1 stores the sum of factorials of digits
    li a1, 0
    # t0 will temporarily store factorial of a digit
    # t1 will store each of the digits one by one
    
loop_digits:
	# check if all digits have been extracted
    beq a3, x0, end
    # t1 = a3 mod 10
    rem t1, a3, a4
    li t0, 1
    jal x1, factorial
    add a1, a1, t0
    # a3 = a3 // 10
    div a3, a3, a4
    j loop_digits

# stores factorial of t1 in t0
factorial:
    # for 0 factorial is 1
    beq t1, x0, factorial_end
    mul t0, t1, t0
    addi t1, t1, -1
    j factorial
factorial_end:
    ret

end:
    li a0, 0
    beq a1, a2, result
    j exit
    
result:
    li a0, 1
    
exit:
    nop