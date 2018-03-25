----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2018 08:16:03 PM
-- Design Name: 
-- Module Name: mux_4_1 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_test is
--  Port ( );
end mux_test;

architecture Behavioral of mux_test is
    signal in_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal in_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal in_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal in_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal op : std_logic_vector (1 downto 0);
    signal out_mux : STD_LOGIC_VECTOR (7 downto 0);
begin


end Behavioral;
