----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 02:13:50 PM
-- Design Name: 
-- Module Name: regiFile_test - Behavioral
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

entity regiFile_test is
--  Port ( );
end regiFile_test;

architecture Behavioral of regiFile_test is
    signal dwrite : STD_LOGIC;
    signal dval : STD_LOGIC_VECTOR (7 downto 0);
    signal sregsel : STD_LOGIC_vector (1 downto 0);
    signal dregsel : STD_LOGIC_vector (1 downto 0);
    signal sbus : STD_LOGIC_VECTOR (7 downto 0);
    signal dbus : STD_LOGIC_VECTOR (7 downto 0);
    signal Zero : STD_LOGIC;
    signal Negative : STD_LOGIC;
    signal clk : STD_LOGIC;
    signal reset : STD_LOGIC;
begin
RF : entity work.Register_File(Behavioral)
    port map (dwrite=>dwrite,dval=>dval,sregsel=>sregsel,dregsel=>dregsel,sbus=>sbus,dbus=>dbus,Zero=>Zero,Negative=>Negative,
                clk=>clk,reset=>reset);

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
        
        dwrite <= '1';
        dval <= "00000001";
        dregsel <= "00";
        sregsel <= "01";
        wait for 100ns;
        dval <= "00000010";
        dregsel <= "01";
        wait for 100ns;
        dval <= "00000011";
        dregsel <= "10";
        sregsel <= "00";
        wait for 100ns;
        dval <= "00000100";
        dregsel <= "11";
        wait for 100ns;        
    end process;
end Behavioral;
