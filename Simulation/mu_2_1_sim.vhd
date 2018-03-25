----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2018 11:14:27 PM
-- Design Name: 
-- Module Name: mu_2_1_sim - Behavioral
-- Project Name: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mu_2_1_sim is
--  Port ( );
end mu_2_1_sim;

architecture Behavioral of mu_2_1_sim is
signal in_0 : STD_LOGIC_VECTOR (7 downto 0);
signal in_1 : std_logic_vector (7 downto 0);
signal out_mux : STD_LOGIC_vector (7 downto 0);
signal op : STD_LOGIC;
begin
M21 : entity work.mux_2_1(Behavioral)
    port map (in_0=>in_0,in_1=>in_1,out_mux=>out_mux,op=>op);
process
    begin
       in_0 <= "00000001";
       in_1 <= "00000010";
       
       op <= '0';
       wait for 100ns;
       op <= '1';
       wait for 100ns;
       in_1 <= "00000011";
       wait for 100ns;
       op <= '0';
       wait for 100ns;
       in_0 <= "00001000";
       wait for 100ns;
end process;
end Behavioral;
