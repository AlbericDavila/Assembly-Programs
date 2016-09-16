# By: Alberic A. Davila Cadilla
# Date: May/01/2014
# Course: Computer Architecture (SICI-4019)
#
# dotproduct.asm
# Calculates and shows the dot product of two vectors of five elements.
#  
# Register use:
#  $t0 - counter
#  $t1 - product 
#  $t2 - sum of products
#  $t3 - array length
#  $t4 - pointer to current element of vectA
#  $t5 - pointer to current element of vectB
#  $t6 - current element vectA
#  $t7 - current element vectB
#  $v0 - system call code
#  $a0 - system call argument
##############################################################################

##############################################################################
# Data Segment
##############################################################################
.data
len:      .word 5
vectA:    .word 1, 2, 3, -4, 5
vectB:    .word 9, -8, 7, 6, 5
dot_msg:  .asciiz "Dot product of vectors A and B: "
##############################################################################
# Code Segment
##############################################################################

.text
.globl main

main:
          li $t0, 0					  # initialize counter
          li $t1, 1					  # initialize product
          li $t2, 0					  # initialize sum of products
          
          lw $t3, len				  # load array length from memory
          la $t4, vectA				  # point to first element vectA
          la $t5, vectB				  # point to first element vectB
          
test_loop:  beq $t0, $t3, end_loop    # exit loop when counter == length
          lw $t6, ($t4)				  # load element from memory vectA
          lw $t7, ($t5)				  # load element from memory vectB
          
mult_add: 
		  mul $t1, $t6, $t7			  # Add vectors A and B
		  add $t2, $t1, $t2			  # Add sum of products and product
		  add $t0, $t0, 1			  # increment counter by 1
		  add $t4, $t4, 4			  # point to next element vectA
		  add $t5, $t5, 4			  # point to next element vectB
	  
          b test_loop				  # go back to loop test

end_loop:   li $v0, 4                 # set system call code to print string
          la $a0, dot_msg			  # load string base address
          syscall					  # print 
          
          li $v0, 1					  # set system call code to print integer
          move $a0, $t2				  # prepare integer for printing
          syscall					  # print dot product
			
 exit:    li $v0, 10				  # set system call code to exit program
          syscall					  # exit program
