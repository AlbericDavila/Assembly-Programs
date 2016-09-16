# By: Alberic A. Davila Cadilla
# Date: April/29/2014
# Course: Computer Architecture (SICI-4019)
#
# factorial2.asm
#  This program computes the factorial of a non-negative integer
#
#
# register use:
#  $t0 - number
#  $t1 - product
#  $t2 0 - counter
#
#######################################################
#
#
#####################################################
# text (code) segment
#####################################################

.text 
.globl main 


main:   
		li $t0, 5				# initialize number
		li $t1, 1				# initialize product
		li $t2, 1				#initialize counter
	
test_loop:	
		bgt $t2, $t0, end_loop	# exit loop when counter > number
		mul $t1, $t1, $t2		# set podruct to product * counter
		add $t2, $t2, 1			#increment counter by 1
		b test_lp				# go back to loop test
	
	
end_loop:	nop					# do nothing, just end
