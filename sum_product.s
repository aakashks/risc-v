.globl _start

# Given a number, find whether it is a Sum-product number.
# We will test the code only with three-digit numbers.
# The answer should be placed in a0. 
# The product of the [sum of its digits] and the [product of its digits] should be placed in a1.
# The input number is placed in a2

_start:

    li a2, 1
    
    # copy in a3 for usage
    add a3, a2, x0
	li a4, 10

    # t0 will store sum of its digits
    # t1 will store product of its digits
    li t0, 0
    li t1, 1
    
loop_digits:
	# check if all digits have been extracted
    beq a3, x0, end
    # t2 = a3 mod 10
    rem t2, a3, a4
    add t0, t0, t2
    mul t1, t1, t2
    # a3 = a3 // 10
    div a3, a3, a4
    j loop_digits

end:
    mul a1, t1, t0
    li a0, 0
    beq a1, a2, result
    j exit
    
result:
    li a0, 1
    
exit:
    nop