# By: Alberic A. Davila Cadilla
# Date: April/29/2014
# Course: Computer Architecture (SICI-4019)
#
# factorialMem.asm
#  This program computes the factorial of a non-negative
#  integer. The number and the factorial will be stored 
#  in memory.
#
# Register use:
#  $t8 - number
#  $t1 - product
#  $t2 -  counter
#########################################################################
#
#
#########################################################################
# Data segment
#########################################################################

.data 
num:      .word 5
fact:     .word 0

#########################################################################
# Code segment
#########################################################################
.text 
.globl main

main: 
          lw $t8, num              # load number from memory
          li $t1, 1                # initialize product
          li $t2, 1                # initialize counter
          
test_loop: 
		 bgt $t2, $t8, end_loop    # exit loop when counter > number
         mul $t1, $t1, $t2         # set product to product * counter
         add $t2, $t2, 1           # set counter to counter + 1
         b test_loop               # go back to loop test
         
end_loop: sw $t1, fact             # store product in memory