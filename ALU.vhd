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

--TODO: LW, SW, LWI, SWI, Comparisons and tie everything together.

architecture Arch of ALU is
    constant DATA_WIDTH : integer := 8;
    constant OP_WIDTH : integer := 4;
    
    constant ZERO : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := "00000000";

    constant OP_AND : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0000";
    constant OP_OR : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0001";
    constant OP_ADD : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0010";
    constant OP_SUB : STD_LOGIC_VECTOR(OP_WIDTH - 1 downto 0) := "0011";

begin

    shared variable temp_result : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := ZERO;

    process(A, B, aluop)
    begin
        case aluop is
            when OP_AND =>
                temp_result := a and b;
            when OP_OR =>
                temp_result := a or b;
            when OP_ADD =>
                temp_result := STD_LOGIC_VECTOR(SIGNED(A) + SIGNED(B));
            when OP_SUB =>
                temp_result := STD_LOGIC_VECTOR(SIGNED(A)-SIGNED(B));
            when OTHERS =>
                temp_result := ZERO;
        end case;
    end process;
    result <= temp_result;
end Arch;
