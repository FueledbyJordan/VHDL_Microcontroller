----------------------------------------------------------------------------------
-- Company: The University of North Carolina at Charlotte
-- Engineer: Roy Helms
-- 
-- Create Date: 03/20/2018 10:08:04 AM
-- Design Name: Project 1 - Intro to VHDL
-- Module Name: DestRegWrite_tb.vhd
-- Project Name: Team 6
-- Target Devices: 
-- Tool Versions: 
-- Description: Test bench for the Address_Select.vhd file
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

entity DestRegWrite_tb is
--  Port ( );
end DestRegWrite_tb;

architecture Behavioral of DestRegWrite_tb is
signal DestRegWrite: std_logic;
signal Stage, OP1, OP2: std_logic_vector(1 downto 0);

begin
p2: entity work.Dest_Reg_Write(Behavioral) Port Map(dwrite=>DestRegWrite, op1=> OP1, op2=>OP2, stage=>Stage);

process
  begin
    wait for 100ns;
    OP1 <= "00";
    OP2 <= "00";
    Stage <= "00";
    wait for 20ns;
    OP1 <= "00";
    OP2 <= "00";
    Stage <= "01";
    wait for 20ns;
    OP1 <= "00";
    OP2 <= "00";
    Stage <= "10";
    wait for 20ns;
    OP1 <= "00";
    OP2 <= "00";
    Stage <= "11";
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
