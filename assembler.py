import sys
import re

Instructions = []

binary = lambda x: " ".join(reversed( [i+j for i,j in zip( *[ ["{0:04b}".format(int(c,16)) for c in reversed("0"+x)][n::2] for n in [1,0] ] ) ] ))

def instr_dict(x):
    return {
        "AND" : "0000",
        "OR" : "0001",
        "ADD" : "0010",
        "SUB" : "0011",
        "LW" : "0100",
        "SW" : "0101",
        "MOV" : "0110",
        "NOP" : "0111",
        "JEQ" : "1000",
        "JNE" : "1001",
        "JGT" : "1010",
        "JLT" : "1011",
        "LWI" : "1100",
        "SWI" : "1101",
        "LI" : "1110",
        "JMP" : "1111",
    }[x]

def reg_dict(x):
    return{
        "R0" : "00",
        "R1" : "01",
        "R2" : "10",
        "R3" : "11",
    }[x]

def hex_to_binary(hex):
    hex = hex.upper()
    hex = hex.replace(" ", "")
    hex = hex.replace("0X", "")
    binary_string = binary(hex)
    return str(binary_string)

def instruction_to_binary(instruction):
    instruction = instruction.upper()
    instruction = instruction.replace(",", "")
    instruction = instruction.replace("(", "")
    instruction = instruction.replace(")", "")
    opcode = instruction.split(' ')[0]

    if opcode == "AND":
        Rd = instruction.split(" ")[1]
        Rs = instruction.split(" ")[2]
        immed = ''
    elif opcode == "OR":
        Rd = instruction.split(" ")[1]
        Rs = instruction.split(" ")[2]
        immed = ''
    elif opcode == "ADD":
        Rd = instruction.split(" ")[1]
        Rs = instruction.split(" ")[2]
        immed = ''
    elif opcode == "SUB":
        Rd = instruction.split(" ")[1]
        Rs = instruction.split(" ")[2]
        immed = ''
    elif opcode == "LW":
        Rd = instruction.split(" ")[1]
        Rs = instruction.split(" ")[2]
        immed = ''
    elif opcode == "SW":
        Rd = instruction.split(" ")[1]
        Rs = instruction.split(" ")[2]
        immed = ''
    elif opcode == "MOV":
        Rd = instruction.split(" ")[1]
        Rs = instruction.split(" ")[2]
        immed = ''
    elif opcode == "NOP":
        Rd = "R0"
        Rs = "R0"
        immed = ''
    elif opcode == "JEQ":
        Rd = instruction.split(" ")[1]
        Rs = "R0"
        immed = instruction.split(" ")[2]
    elif opcode == "JNE":
        Rd = instruction.split(" ")[1]
        Rs = "R0"
        immed = instruction.split(" ")[2]
    elif opcode == "JGT":
        Rd = instruction.split(" ")[1]
        Rs = "R0"
        immed = instruction.split(" ")[2]
    elif opcode == "JLT":
        Rd = instruction.split(" ")[1]
        Rs = "R0"
        immed = instruction.split(" ")[2]
    elif opcode == "LWI":
        Rd = instruction.split(" ")[1]
        Rs = "R0"
        immed = instruction.split(" ")[2]
    elif opcode == "SWI":
        Rd = instruction.split(" ")[1]
        Rs = "R0"
        immed = instruction.split(" ")[2]
    elif opcode == "LI":
        Rd = instruction.split(" ")[1]
        Rs = "R0"
        immed = instruction.split(" ")[2]
    elif opcode == "JMP":
        Rd = "R3"
        Rs = "R3"
        immed = instruction.split(" ")[1]
    
    Instructions.append(instr_dict(opcode) + reg_dict(Rd) + reg_dict(Rs))
    if (instr_dict(opcode)[0] == '1'):
        immed = immed.replace("0X","")
        Instructions.append(binary(immed))

def mem_file_writer_header():
    header_lines = open('.src/mem_file_header.vhd')
    for line in header_lines:
        line = line.strip()
        sys.stdout.write(line + "\n")
        sys.stdout.flush()

def mem_file_writer_footer():
    header_lines = open('.src/mem_file_footer.vhd')
    for line in header_lines:
        line = line.strip()
        sys.stdout.write(line + "\n")
        sys.stdout.flush()

lines = open('.src/instructions.asm', 'r')

for line in lines:
    line = line.strip()
    instruction_to_binary(line)
lines.close()

mem_file_writer_header()
sys.stdout.write("MEMORY(0) <= \"00000000\";\n")

i = 1

for instruction in Instructions:
    sys.stdout.write("MEMORY(")
    sys.stdout.write(str(i))
    sys.stdout.write(") <= \"")
    sys.stdout.write(instruction + "\";\n")
    sys.stdout.flush()
    i = i + 1

sys.stdout.write("MEMORY(")
sys.stdout.write(str(i))
sys.stdout.write(") <= \"")
sys.stdout.write("00000000\";\n")

mem_file_writer_footer()
