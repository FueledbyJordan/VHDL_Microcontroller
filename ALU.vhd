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
        A : in STD_LOGIC_VECTOR(7 downto 0);
        B : in STD_LOGIC_VECTOR(7 downto 0);
        aluop : in STD_LOGIC_VECTOR(3 downto 0);
        result : out STD_LOGIC_VECTOR(15 downto 0);
    );
end entity;

--TODO: Implement ALU op logic.

architecture Arch of ALU is
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

    process(operand_one, operand_two, aluop)
    begin
        case aluop is
            when OP_AND =>
                arith_result := ZERO;
                logic_result := ZERO;
            when OP_OR =>
                arith_result := ZERO;
                logic_result := ZERO;
            when OP_ADD =>
                arith_result := ZERO;
                logic_result := ZERO;
            when OP_SUB =>
                arith_result := ZERO;
                logic_result := ZERO;
            when OP_LW =>
                arith_result := ZERO;
                logic_result := ZERO;
            when OP_SW =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OP_MOV =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OP_NOP =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OP_JEQ =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OP_JNE =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OP_JGT =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OP_JLT =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OP_LWI =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OP_SWI =>
                logic_result := ZERO;
                arith_result := ZERO;
            when OTHERS =>
            
        end case;

	temp_result <= logic_result or arith_result;
        result <= temp_result;
            
    end process;
end Arch;
