# By: Alberic A. Davila Cadilla
# Date: May/03/2014
# Course: Computer Architecture (SICI-4019)
#
# countupper.asm
# Counts the uppercase letters in a string.
#
# Register use:
#  $t0 - counter 
#  $t1 - pointer to current character 
#  $t2 - current character  
#  $v0 - system call code 
#  $a0 - system call argument
##############################################################################
#
#
##############################################################################
# Data Segment
##############################################################################
.data
prompt:    .asciiz "Enter string: "
str:       .space 81
upctr_msg: .asciiz "\nNumber of uppercase letters: "
##############################################################################
# Code segment
##############################################################################

.text
.globl main

main:
	li $v0, 4					   # set system call code to print string
	la $a0,prompt				   # print prompt string
	syscall
		         
	la $a0, str					   # load string base address
    li $a1, 81					   # load buffer length
        
    li $v0,8 					   # set system call code to read string
    syscall
     
    la $a0, upctr_msg			   # write output message
    li $v0, 4					   # set system call code to print string
    syscall  					   # print          
      
    la $t1, str					   # load string base adress
	li $t0, 0					   # initilaize counter 
     
loop: 	
		lb   $t2, 0($t1)           # load characer from memory 
        beqz $t2, exit_loop  	   # exit loop when character == '\0' 
        blt  $t2, 'A', nextchar    # if char < A move to next char 
        bgt  $t2, 'Z', nextchar    # if > Z move to next char
        add  $t0, $t0, 1           # increment counter by 1 
        sb   $t2, 0($t1)		   # store memory 
        
nextchar:  
		   add $t1, $t1, 1         # point to next character 
           b loop                  # load next character

exit_loop:
		   li $v0, 1               # set system call code to print integer
           move $a0, $t0           # prepare integer for printing
           syscall  

exit:      li $v0, 10              # set system call code to exit program
           syscall                 # exit program

