----------------------------------------------------------------------------------
-- Company: The University of North Carolina at Charlotte
-- Engineer: Roy Helms
-- 
-- Create Date: 03/21/2018 04:40:49 PM
-- Design Name: Project 1 - Intro to VHDL
-- Module Name: StageCount_tb - Behavioral
-- Project Name: Team 6
-- Target Devices: 
-- Tool Versions: 
-- Description: Test bench for the Stage_Count.vhd file
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

entity StageCount_tb is
--  Port ( );
end StageCount_tb;

architecture Behavioral of StageCount_tb is
signal Stage: std_logic_vector(1 downto 0):= "00";
signal clock, reset: std_logic := '0';

begin
p3: entity work.Stage_Count(Behavioral) Port Map(clk=>clock, rst=>reset, stage=>Stage);

process
    begin
        while true loop
            clock <= '0';
            wait for 10ns;
            clock <= '1';
            wait for 10ns;
        end loop;
    end process;

process
    begin
        wait for 525ns;
        reset <= '1';
        wait for 20ns;
        reset <= '0';
        wait for 25ns;
        reset <= '1';
        wait for 20ns;
        reset <= '0';
    end process;

end Behavioral;
