----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 05:14:30 PM
-- Design Name: 
-- Module Name: Mem_TB - Behavioral
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

entity Mem_TB is
end Mem_TB;

architecture RTL of Mem_TB is
    signal address : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal dataout : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal datain : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal readwrite : STD_LOGIC;
    signal clk : STD_LOGIC;
    --signal rst : STD_LOGIC;
    constant T : TIME := 100 ns;
begin
    p0: entity work.Memory(RTL) port map(address=>address, dataout=>dataout, datain=>datain, we=>readwrite, clock=>clk);

    process
    begin
        wait for T/2;
        readwrite <= '0';
        clk <= '1';
        wait for T/2;
        clk <= '0';
        address <= STD_LOGIC_VECTOR(to_unsigned(12, address'length));
        readwrite <= '1';
        datain <= "11001100";
        wait for T/2;
        clk <= '1';
        wait for T/2;
        clk <= '0';
        address <= STD_LOGIC_VECTOR(to_unsigned(12, address'length));
        readwrite <= '0';
        wait for T/2;
        clk <= '1';
        wait for T/2;
        clk <= '0';
        address <= STD_LOGIC_VECTOR(to_unsigned(11, address'length));
        wait for T/2;
        clk <= '1';
        wait for T/2;
        clk <= '0';
        wait for T/2;
        clk <= '1';
        wait for T/2;
        clk <= '0';
        wait for T/2;
        clk <= '1';
        wait for T/2;
        clk <= '0';
        wait;
    end process;
    
end RTL;

