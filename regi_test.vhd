----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 10:10:31 AM
-- Design Name: 
-- Module Name: regi_test - Behavioral
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

entity regi_test is
--  Port ( );
end regi_test;

architecture Behavioral of regi_test is
   signal clk : std_logic;
   signal reset : std_logic;
   signal enable : std_logic;
   signal Reg_in : STD_LOGIC_VECTOR (7 downto 0);
   signal Reg_out : STD_LOGIC_VECTOR (7 downto 0);
begin
REG8 : entity work.bit_reg_8(Behavioral) 
    port map (clk=>clk,reset=>reset,enable=>enable,Reg_in=>Reg_in,Reg_out=>Reg_out);
    
  process
      begin
        clk <= '0';
        while true loop
          wait for 50ns;
          clk <= not clk;
        end loop;
    end process;
    
process
    begin
        Reg_in <= "01000100";
        wait for 100ns;
        enable <='1';
        wait for 100ns;
        enable <='0';
        reset <= '1';
        wait for 100ns;
        reset <= '0';
        Reg_in <= "11101010";
        wait for 100ns;
        enable <='1';
        wait for 100ns;
end process;
end Behavioral;
