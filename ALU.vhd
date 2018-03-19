----------------------------------------------------------------------------------
-- Company: 
-- Engineer: DJM
-- 
-- Create Date: 03/19/2018 02:28:34 PM
-- Design Name: 
-- Module Name: ALU.vhd
-- Project Name: Microcontroller
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        operand_one : in STD_LOGIC_VECTOR(7 downto 0);
        operand_two : in STD_LOGIC_VECTOR(7 downto 0);
        aluop : in STD_LOGIC_VECTOR(3 downto 0);
        result : out STD_LOGIC_VECTOR(15 downto 0);
    );
end ALU;

architecture Testing of ALU is
    constant DATA_WIDTH : integer := 8;
    constant OP_WIDTH : integer := 4;
    
    constant ZERO : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := "00000000";

    constant OP_AND : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0000";
    constant OP_OR : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0001";
    constant OP_ADD : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0010";
    constant OP_SUB : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0011";
    constant OP_LW : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0100";
    constant OP_SW : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0101";
    constant OP_MOV : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0110";
    constant OP_NOP : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0111";
    constant OP_JEQ : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "1000";
    constant OP_JNE : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "1001";
    constant OP_JGT : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "1010";
    constant OP_JLT : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "1011";
    constant OP_LWI : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "1100";
    constant OP_SWI : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "1101";

    shared variable temp_result : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
    shared variable arith_result : STD_LOGIC_VECTOR(DATA_WIDTH + 1 downto 0);
    shared variable logic_result : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
    shared variable temp_zero : STD_LOGIC;
    shared variable temp_negative : STD_LOGIC;

begin

    process(operand_one, operand_two, operator)
    begin
        case operator is
            when OP_ADD =>
                arith_result := STD_LOGIC_VECTOR("00"&unsigned(operand_one) + unsigned(operand_two));
                logic_result := (DATA_WIDTH - 1 downto 0 => '0');
            when OP_SUB =>
                arith_result := STD_LOGIC_VECTOR("00"&unsigned(operand_one) - unsigned(operand_two));
                logic_result := (DATA_WIDTH - 1 downto 0 => '0');
            when OP_MUL =>
                assert operand_one <= "11111111" report "Multiplication operands must be no more than a byte." severity error;
                assert operand_two <= "11111111" report "Multiplication operands must be no more than a byte." severity error;
                arith_result := STD_LOGIC_VECTOR("00"&unsigned(operand_one(7 downto 0)) * unsigned(operand_two(7 downto 0)));
                logic_result := (DATA_WIDTH - 1 downto 0 => '0');
            when OP_INC =>
                arith_result := STD_LOGIC_VECTOR("00"&unsigned(operand_one) + 1);
                logic_result := (DATA_WIDTH - 1 downto 0 => '0');
            when OP_DEC =>
                arith_result := STD_LOGIC_VECTOR("00"&unsigned(operand_one) - 1);
                logic_result := (DATA_WIDTH - 1 downto 0 => '0');
            when OP_AND =>
                logic_result := operand_one and operand_two;
                arith_result := (17 downto 0 => '0');
            when OP_OR =>
                logic_result := operand_one or operand_two;
                arith_result := (17 downto 0 => '0');
            when OP_XOR =>
                logic_result := operand_one xor operand_two;
                arith_result := (17 downto 0 => '0');
            when OP_NOT =>
                logic_result := not operand_one;
                arith_result := (17 downto 0 => '0');
            when OP_ROL =>
                logic_result := STD_LOGIC_VECTOR(rotate_left(unsigned(operand_one), to_integer(unsigned(operand_two))));
                arith_result := (17 downto 0 => '0');
            when OP_ROR =>
                logic_result := STD_LOGIC_VECTOR(rotate_right(unsigned(operand_one), to_integer(unsigned(operand_two))));         
                arith_result := (17 downto 0 => '0');
            when OTHERS =>
            
        end case;
        
        if (operator >= "0000" and operator <= "1010") then  
            temp_result := logic_result or arith_result(DATA_WIDTH - 1 downto 0);
            
            temp_zero := '0';
            temp_carry := '0';
            temp_negative := '0';
            temp_overflow := '0';
            
            if (temp_result = ZERO) then
                temp_zero := '1';
            end if;
            
            if (operator = OP_MUL) then
                temp_overflow := arith_result(17);
                temp_carry := arith_result(16);
            end if;
            
            if (arith_result(16) = '1' and (operator = OP_ADD or operator = OP_INC)) then
                temp_carry := '1';
            end if;
            
            if (arith_result(17 downto 16) /= "00" and (operator = OP_SUB or operator = OP_DEC)) then
                temp_negative := '1';
            end if;
                    
            result <= temp_result;
            status <= "0000" & temp_overflow & temp_negative & temp_carry & temp_zero;
            
        end if;
    end process;
end Testing;
