----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 10:44:47 PM
-- Design Name: 
-- Module Name: Start_Program - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Start_Program is
--  Port ( );
end Start_Program;

architecture Behavioral of Start_Program is

component Microcontroller is
    Port (
        clk : in std_logic;
        sbus : out std_logic_vector(7 downto 0);
        dbus : out std_logic_vector(7 downto 0);
        aluout : out std_logic_vector(7 downto 0);
        immed : out std_logic_vector(7 downto 0);
        aluop : out std_logic_vector(1 downto 0); 
        negative : out std_logic;
        zero : out std_logic;
        pcsel : out std_logic;
        stage : out std_logic_vector(1 downto 0);
        pcload : out std_logic;
        addressout : out std_logic_vector(7 downto 0);
        irlineout : out std_logic_vector(7 downto 0)
    );
end component;

signal clk : std_logic;
signal sbus : std_logic_vector(7 downto 0);
signal dbus : std_logic_vector(7 downto 0);
signal aluout : std_logic_vector(7 downto 0);
signal immed : std_logic_vector(7 downto 0);
signal aluop : std_logic_vector(1 downto 0);
signal negative : std_logic;
signal zero : std_logic;
signal pcsel : std_logic;
signal pcload : std_logic;
signal stage : std_logic_vector(1 downto 0);
signal address : std_logic_vector(7 downto 0);
signal irline : std_logic_vector(7 downto 0);


begin

p0: Microcontroller port map(clk=>clk,stage=>stage,sbus=>sbus,dbus=>dbus,aluout=>aluout,immed=>immed,aluop=>aluop,negative=>negative,zero=>zero,pcsel=>pcsel,pcload=>pcload,addressout=>address,irlineout=>irline);

    process
        begin
            clk <= '0';
            wait for 100 ns;
            while true loop
                clk <= '1';
                wait for 67.5 ns;
                clk <= '0';
                wait for 67.5 ns;
            end loop;
            wait;
    end process;
                

end Behavioral;
