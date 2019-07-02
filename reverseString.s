/*H****************************************************************
* FILENAME :        reverseString.s
*
* DESCRIPTION :
*       Reverses a string of up to 100 characters 
*
*       Copyright 2017, Jacob Wilkins.  All rights reserved.
* 
* AUTHOR :    Jacob Wilkins        START DATE :    7 Mar 17
*
*H*/

    .global _start

_start:

_read:
    mov r7, #3
    mov r0, #0
    mov r2, #100
    ldr r1, =string
    swi 0

_write:
    mov r7, #4
    mov r0, #1
    mov r2, #1
    ldr r1, =string

_loop:
    ldrb r3, [r1]
    cmp r3, #10
    beq _exit
    cmp r3, #32
    beq _update
    add r3, r3, #32
    strb r3, [r1]
    swi 0

    add r1, r1, #1
    bal _loop

_update:
    swi 0
    add r1, r1, #1
    bal _loop

_exit:
    swi 0
    mov r7, #1
    swi 0

.data
string:
    .space 100
