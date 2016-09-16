# By: Alberic A. Davila Cadilla
# Date: May/15/2014
# Course: Computer Architecture (SICI-4019)
#
# lucas.asm
#  Ask the user for the first two terms of the Lucas succession 
#  and then shows the first n terms (where n is also given by the user) 
#
# Register use:
#  $t0 - number
#  $t1 - number2
#  $t2 - terms
#  $t3 - counter
#####################################################################
#
#
#####################################################################
# Data Segment
#####################################################################
.data
prompt1: .asciiz "Enter the first term: "
prompt2: .asciiz "Enter the second term: "
prompt3: .asciiz "Enter the number of terms: "
lucas_msg: .asciiz "\nTerms: "
space:	   .asciiz " "
#####################################################################
# Code Segment
#####################################################################

.text
.globl main

main:
          li $v0, 4                # set system call code to print string
          la $a0, prompt1          # load string base address
          syscall                  # print prompt message
          
          li $v0, 5                # set system call code to read integer
          syscall                  # read string
          
          move $t0, $v0            # initialize number
          
          li $v0, 4                # set system call code to print string
          la $a0, prompt2          # load string base address
          syscall                  # print prompt message
          
          li $v0, 5                # set system call code to read integer
          syscall                  # read string
          
          move $t1, $v0            # initialize number2
          
          li $v0, 4                # set system call code to print string
          la $a0, prompt3          # load string base address
          syscall                  # print prompt message
          
          li $v0, 5                # set system call code to read integer
          syscall                  # read 
          
          move $t2, $v0            # initialize terms
          
          li $t3, 3                # initialize counter
          
          li $t4, 0                #initialize sum
          
#######################################################################################################
# Output
#######################################################################################################

         li $v0, 4 			# set system call code to print string
         la $a0, lucas_msg	# load string base address
         syscall
         
         li  $v0, 1			# set system call code to print integer
         move  $a0, $t0     # prepare integer for printing
         syscall 
         
         li $v0, 4 			# set system call code to print string
         la $a0, space		# load string base address
         syscall 
         
         li  $v0, 1			# set system call code to print integer
         move  $a0, $t1     # prepare integer for printing
         syscall 
         
         li $v0, 4           # set system call code to print string
         la $a0, space	     # load string base address
         syscall 
    
test_loop:  
		  bgt $t3, $t2, end_loop    # exit loop when counter > number
          add $t4, $t0, $t1 
          la $t0, ($t1)
          la $t1, ($t4)
          add $t3, $t3, 1	  # increment counter by 1
          li $t4, 0
          
          li $v0, 1			  # set system call code to print string	
          move $a0, $t1	      # prepare integer for printing
          syscall 

          li $v0, 4 		  # set system call code to print string
          la $a0, space		  # load string base address
          syscall 
   
          b test_loop           # go back to loop test
           
          
 end_loop:    nop
 
 exit:    li $v0, 10              # set system call code to exit program
          syscall                 # exit program
         
         
         
          
          
          
          
          
