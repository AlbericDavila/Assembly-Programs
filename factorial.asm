# By: Alberic A. Davila Cadilla
# Date: May/01/2014
# Course: Computer Architecture (SICI-4019)
#
# factorial.asm
# This program computes the factorial of a non-negative
# integer. All values are in registers.
#
# Register use:
#  $t8 - number
#  $t1 - product
#  $t2 - counter
#########################################################################
#
#
#########################################################################
# Code segment
#########################################################################

.text 
.globl main

main: 
          li $t8, 5					  #initialize number
          li $t1, 1					  #initialize product
          li $t2, 1					  #initialize counter
          
test_loop: bgt $t2, $t8, end_loop     #exit loop when counter > number
         mul $t1, $t1, $t2			  #set product to product * counter
         add $t2, $t2, 1			  #set counter to counter + 1
         b test_lp					  #go back to loop test
         
end_loop: nop						  # do nothing, just end
