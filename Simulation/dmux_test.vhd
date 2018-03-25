----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 03:13:54 PM
-- Design Name: 
-- Module Name: dmux_test - Behavioral
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

entity dmux_test is
--  Port ( );
end dmux_test;

architecture Behavioral of dmux_test is
   signal Mux_in : STD_LOGIC;
   signal op : std_logic_vector(1 downto 0);
   signal out_0 : STD_LOGIC;
   signal out_1 : STD_LOGIC;
   signal out_2 : STD_LOGIC;
   signal out_3 : STD_LOGIC;
begin
DMUX : entity work.mux_1_4(Behavioral)
    port map (Mux_in=>Mux_in,op=>op,out_0=>out_0,out_1=>out_1,out_2=>out_2,out_3=>out_3);

process
    begin
        Mux_in <='1';
        op <= "00";
        wait for 50ns;
        op <= "01";
        wait for 50ns;
        op <= "10";
        wait for 50ns;
        op <= "11";
        wait for 50ns;
        Mux_in <='0';
        wait for 50ns;
end process;
end Behavioral;
