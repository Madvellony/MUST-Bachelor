 .text
    .globl main

main:
    # Define scale within the .text section
    scale: .space 2  # define a 2-byte buffer for scale input

    .data
msg_scale:  .asciiz "Enter Scale (F/C/Q): "
msg_temp:   .asciiz "Enter Temperature: "
msg_result: .asciiz "Temperature in "
msg_celsius: .asciiz "Celsius: "
msg_fahrenheit: .asciiz "Fahrenheit: "
newline:    .asciiz "\n"

    .text
    .globl main

main:
    # Print prompt for scale input
    li $v0, 4            # syscall code for printing string
    la $a0, msg_scale    # load address of the scale prompt
    syscall              # print the scale prompt
    
    # Read user input for scale
    li $v0, 8            # syscall code for reading string
    la $a0, scale        # load address of the scale buffer
    li $a1, 2            # specify the buffer length (1 character + null terminator)
    syscall              # read the scale
    
    # Check if user wants to quit
    lb $t0, scale        # load the input character
    li $t1, 'Q'          # load the ASCII value for 'Q'
    beq $t0, $t1, quit   # if input is 'Q', exit the program

    # Print prompt for temperature input
    li $v0, 4            # syscall code for printing string
    la $a0, msg_temp     # load address of the temperature prompt
    syscall              # print the temperature prompt
    
    # Read user input for temperature
    li $v0, 5            # syscall code for reading integer
    syscall              # read the temperature
    move $t2, $v0        # store the temperature in $t2

    # Convert temperature
    lb $t3, scale        # load the scale ('F' or 'C')
    li $t1, 'F'          # load the ASCII value for 'F'
    beq $t3, $t1, fahrenheit_to_celsius  # if scale is 'F', convert to Celsius
    j celsius_to_fahrenheit              # otherwise, convert to Fahrenheit

quit:
    # Exit program
    li $v0, 10           # syscall code for exit
    syscall              # exit the program

fahrenheit_to_celsius:
    # Convert Fahrenheit to Celsius
    sub $t2, $t2, 32     # F = (9/5)C + 32 -> (F - 32) = (9/5)C
    mul $t2, $t2, 5      # multiply by 5
    div $t2, $t2, 9      # divide by 9

    # Print result
    li $v0, 4            # syscall code for printing string
    la $a0, msg_result   # load address of the result message
    syscall              # print the result message
    la $a0, msg_celsius  # load address of the Celsius message
    syscall              # print the Celsius message
    li $v0, 1            # syscall code for printing integer
    move $a0, $t2        # load Celsius temperature to print
    syscall              # print the Celsius temperature
    li $v0, 4            # syscall code for printing string
    la $a0, newline      # load address of the newline
    syscall              # print a newline
    j main               # return to main loop

celsius_to_fahrenheit:
    # Convert Celsius to Fahrenheit
    mul $t2, $t2, 9      # C = (5/9)(F - 32) -> (9/5)C = F - 32
    div $t2, $t2, 5      # multiply by 9 and divide by 5
    add $t2, $t2, 32     # add 32

    # Print result
    li $v0, 4            # syscall code for printing string
    la $a0, msg_result   # load address of the result message
    syscall              # print the result message
    la $a0, msg_fahrenheit  # load address of the Fahrenheit message
    syscall              # print the Fahrenheit message
    li $v0, 1            # syscall code for printing integer
    move $a0, $t2        # load Fahrenheit temperature to print
    syscall              # print the Fahrenheit temperature
    li $v0, 4            # syscall code for printing string
    la $a0, newline      # load address of the newline
    syscall              # print a newline
    j main               # return to main loop
