----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2018 10:07:44 PM
-- Design Name: 
-- Module Name: PC_sim - Behavioral
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

entity PC_sim is
--  Port ( );
end PC_sim;

architecture Behavioral of PC_sim is
signal Immed_in : STD_LOGIC_VECTOR (7 downto 0);
signal clk : std_logic;
signal pcsel : std_logic;
signal pcload : std_logic;
signal sbus : std_logic_vector (7 downto 0 );
signal dbus : std_logic_vector (7 downto 0 );
signal addrsel  : std_logic_vector (1 downto 0);
signal address : STD_LOGIC_VECTOR (7 downto 0);
begin
PC1: entity work.PC(Behavioral)
    port map(Immed_in=>Immed_in,clk=>clk,pcsel=>pcsel,pcload=>pcload,sbus=>sbus,dbus=>dbus,addrsel=>addrsel,address=>address);

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
        Immed_in <= "00001000";
        sbus <= "00000100";
        dbus <= "00000010";
        addrsel <= "00";
        pcsel <= '0';
        pcload <='1';
        wait for 100ns;
        wait for 100ns;
        pcsel <= '1';
        wait for 100ns;
        wait for 100ns;
        pcload <='0';
        addrsel <= "01";
        wait for 100ns;
        addrsel <= "10";
        wait for 100ns;
        addrsel <= "11";
        wait for 100ns;
        
        
end process;        
end Behavioral;
