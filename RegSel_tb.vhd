----------------------------------------------------------------------------------
-- Company: The University of North Carolina at Charlotte
-- Engineer: Roy Helms
-- 
-- Create Date: 03/19/2018 09:41:35 AM
-- Design Name: Project 1 - Intro to VHDL
-- Module Name: RegSel_tb.vhd
-- Project Name: Team 6
-- Target Devices: 
-- Tool Versions: 
-- Description: Test bench for the Register_Select.vhd file
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity RegSel_tb is
--  Port ();
end RegSel_tb;

architecture Behavioral of RegSel_tb is
signal ALU, D, SourceReg, Immed, RegSel:      std_logic_vector(7 downto 0);
signal Operator:     std_logic_vector(3 downto 0); -- may need to make as two inputs of 2- bits each
signal Stage:        std_logic_vector(1 downto 0); 

begin
p0: entity work.Register_Select(Behavioral) Port Map(ALU_out=>ALU, Datain=>D, Rs=>SourceReg, Immediate=>Immed, regsel=>RegSel, op1op2=>Operator, stage=>Stage);

ALU         <= "00000000"; -- '0'
D           <= "00001111"; -- "15"
SourceReg   <= "11110000"; -- "240"
Immed       <= "11111111"; -- "255"

process
  begin
    wait for 100ns;
    Stage <= "00";
    Operator <= "0000";
    wait for 20ns;
    Stage <= "01";
    Operator <= "0000";
    wait for 20ns;
    Stage <= "10";
    Operator <= "0000";
    wait for 20ns;
    Stage <= "11";
    Operator <= "0000";
    wait for 100ns;
    Operator <= "0000";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "0001";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "0010";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "0011";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "0100";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "0101";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "0110";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "0111";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "1000";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "1001";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "1010";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "1011";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "1100";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "1101";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "1110";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    Operator <= "1111";
    Stage <= "10";
end process;

end Behavioral;
