//This is a 4×4 hexadecimal keypad interfaced with ATmega32
.include "m32adef.inc"
.org 0
//set stack pointer 
LDI R16, HIGH(RAMEND) OUT SPH,R16 LDI R16, LOW(RAMEND) OUT SPL, R16 

//create lookup table
LDI R31, 0x00 LDI R30, 0x00
LDI R16, 0xFC STD Z+0x00, R16
LDI R16, 0x60 STD Z+0x01, R16
LDI R16, 0xDA STD Z+0x02, R16
LDI R16, 0xF2 STD Z+0x03, R16
LDI R16, 0x66 STD Z+0x04, R16
LDI R16, 0xB6 STD Z+0x05, R16
LDI R16, 0xBE STD Z+0x06, R16
LDI R16, 0xE0 STD Z+0x07, R16
LDI R16, 0xFE STD Z+0x08, R16
LDI R16, 0xF6 STD Z+0x09, R16
LDI R16, 0b11101110 STD Z+0x0A, R16
LDI R16, 0b00111110 STD Z+0x0B, R16
LDI R16, 0b10011100 STD Z+0x0C, R16
LDI R16, 0b01111010 STD Z+0x0D, R16
LDI R16, 0b10011110 STD Z+0x0E, R16
LDI R16, 0b10001110 STD Z+0x0F, R16

ldi r16, 0b1111_1111   out ddrc, r16

ldi r16, 0b0000_1111   out ddra, r16
loop:
ldi r18, 0
ldi r16, 0b1111_1110   out porta, r16   in r17, pina   com r17   andi r17, 0b1111_0000
                cpi r17, 0b0001_0000    brne l11    call show
l11: inc r18    cpi r17, 0b0010_0000    brne l12    call show
l12: inc r18    cpi r17, 0b0100_0000    brne l13    call show
l13: inc r18    cpi r17, 0b1000_0000    brne l14    call show
l14:

ldi r16, 0b1111_1101   out porta, r16   in r17, pina   com r17   andi r17, 0b1111_0000
     inc r18    cpi r17, 0b0001_0000    brne l21    call show
l21: inc r18    cpi r17, 0b0010_0000    brne l22    call show
l22: inc r18    cpi r17, 0b0100_0000    brne l23    call show
l23: inc r18    cpi r17, 0b1000_0000    brne l24    call show
l24:

ldi r16, 0b1111_1011   out porta, r16   in r17, pina   com r17   andi r17, 0b1111_0000
     inc r18    cpi r17, 0b0001_0000    brne l31    call show
l31: inc r18    cpi r17, 0b0010_0000    brne l32    call show
l32: inc r18    cpi r17, 0b0100_0000    brne l33    call show
l33: inc r18    cpi r17, 0b1000_0000    brne l34    call show
l34:

ldi r16, 0b1111_0111   out porta, r16   in r17, pina   com r17   andi r17, 0b1111_0000
     inc r18    cpi r17, 0b0001_0000    brne l41    call show
l41: inc r18    cpi r17, 0b0010_0000    brne l42    call show
l42: inc r18    cpi r17, 0b0100_0000    brne l43    call show
l43: inc r18    cpi r17, 0b1000_0000    brne l44    call show
l44:
rjmp loop

show:
mov r30, r18
ld R20, Z
out portc, r20
r: ret

