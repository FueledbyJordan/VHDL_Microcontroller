LI R1, 0x00
LI R0, 0x80
LW R2, (R0)
JEQ R2, 0x0E
ADD R1, R2
LI R3, 0x01
ADD R0, R3
JMP 0x05
SWI R1, 0x40
JMP 0x10