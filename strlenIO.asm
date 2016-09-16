# By: Alberic A. Davila Cadilla
# Date: May/05/2014
# Course: Computer Architecture (SICI-4019)
#
# strIO.asm
#  Computes the length of the string entered by the user.
# 
# Register use:  
#  $t0 - counter
#  $t1 - pointer to current character
#  $t2 current character (in low order byte)
#  $v0 - system call code
#  $v1 - system call arument
####################################################
#
#
###################################################
# Data segment
###################################################
.data
prompt:         .asciiz "Enter string: "
str:            .space 81
len_msg:         .asciiz "Length of string is"

#########################################################################
# Code segment
#########################################################################
.text 
.globl main

main: 
          li $v0, 4                # set system call code to print string
          la $a0, prompt           # load string base adress
          syscall
          
          li $v0,8                 # set system call code to read string
          la $a0, str              # load string base adress
          li $a1, 81               # load buffer length
          syscall                  # read integer
          
          li $t0, 0                # initialize counter
          move $t1, $a0            # point to first adress
          
next_ch:  
		  lb $t2, ($t1)            # load character from memory
         
          beq $t2, $zero, end_str  # exit loopp when char == '/0'
          add $t0, $t0, 1          #increment counter by 1
          add $t1, $t1, 1          # point to next character
          b next_ch                # load next character
          
          
end_str:  
		  sub $t0, $t0, 1          #discount '/n' from counter
          
          li $v0, 4                #set system call code to print string
          la $a0, len_msg          # load string base adress
          syscall                  # set system call code to print integer
          
          li $v0, 1                # set system call code to print integer
          move $a0, $t0            # prepare integer to print
          syscall                  # print length
          
exit:     
		  li $v0, 10               # set system call code to exit program
          syscall                  # exit program
          
