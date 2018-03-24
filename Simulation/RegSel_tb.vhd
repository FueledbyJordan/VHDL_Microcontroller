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
signal ALU, D, SourceReg, Immed, RegSel:      std_logic_vector(1 downto 0);
signal Stage, OP1, OP2:        std_logic_vector(1 downto 0); 

begin
p0: entity work.Register_Select(Behavioral) Port Map(ALU_out=>ALU, Datain=>D, Rs=>SourceReg, Immediate=>Immed, regsel=>RegSel, op1=>OP1, op2=>OP2, stage=>Stage);

ALU         <= "00"; -- '0'
D           <= "01"; -- "1"
SourceReg   <= "10"; -- "2"
Immed       <= "11"; -- "3"

process
  begin
    wait for 100ns;
    Stage <= "00";
    OP1 <= "00";
    OP2 <= "00";
    wait for 20ns;
    Stage <= "01";
    OP1 <= "00";
    OP2 <= "00";
    wait for 20ns;
    Stage <= "10";
    OP1 <= "00";
    OP2 <= "00";
    wait for 20ns;
    Stage <= "11";
    OP1 <= "00";
    OP2 <= "00";
    wait for 100ns;
    OP1 <= "00";
    OP2 <= "00";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "00";
    OP2 <= "01";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "00";
    OP2 <= "10";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "00";
    OP2 <= "11";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "01";
    OP2 <= "00";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "01";
    OP2 <= "01";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "01";
    OP2 <= "10";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "01";
    OP2 <= "11";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "10";
    OP2 <= "00";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "10";
    OP2 <= "01";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "10";
    OP2 <= "10";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "10";
    OP2 <= "11";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "11";
    OP2 <= "00";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "11";
    OP2 <= "01";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "11";
    OP2 <= "10";
    Stage <= "10";
    wait for 20ns;
    Stage <= "00";
    wait for 10ns;
    OP1 <= "11";
    OP2 <= "11";
    Stage <= "10";
  end process;

end Behavioral;
