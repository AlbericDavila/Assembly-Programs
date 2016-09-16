# By: Alberic A. Davila Cadilla
# Date: May/08/2014
# Course: Computer Architecture (SICI-4019)
#
# factorialI/O.asm
#  This program computes the factorial of a non-negative
#  integer. The number will be entered by the user and the 
#  factorial will be displayed on the screen.
#
# Register use:
#  $t8 - number
#  $t1 - product
#  $t2 -  counter
#  $v0 - system call code
#  $v1 system call argument
#########################################################################
#
#
##########################################################################
# Data segment
#########################################################################

.data 
prompt:   .asciiz "Enter a non-negative integer: "
fact_msg: .asciiz "Factorial of number is "
error_msg: .asciiz "Error: Negative number."

#########################################################################
# Code segment
#########################################################################
.text 
.globl main

main: 
          li $v0, 4                # set system call code to print string
          la $a0, prompt           # load string base adress
          syscall
          
          li $v0, 5                # set system call code to read integer
          syscall
          
          blt $v0, $zero, error    # go to error if number < 0
          
          move $t8, $v0            # initialize number
          li $t1, 1                # initialize product
          li $t2, 1                # initialize counter
          
      
test_loop:  
		  bgt $t2, $t8, end_loop     # exit loop when counter > number
          mul $t1, $t1, $t2        # set product to product * counter
          add $t2, $t2, 1          # set counter to counter + 1
          b test_loop                # go back to loop test
         
end_loop:   
		  li $v0, 4                # set system call code to print string
          la $a0, fact_msg         # load string base adress
          syscall                  # print factorial message

		  li $v0, 1                # set system call code to print integer
		  move $a0, $t1            # move integer to print
		  syscall                  # print factorial
	 
		  b exit                   # exit program
	 
error:   
		  li $v0, 4                # set system call code to print string
          la $a0, error_msg        # load string base adress
          syscall                  # print error message 

exit:   
		 li $v0, 10                # set system call to exit program
         syscall                   # exit
