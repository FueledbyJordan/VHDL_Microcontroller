----------------------------------------------------------------------------------
-- Company: The University of North Carolina at Charlotte
-- Engineer: Roy Helms
-- 
-- Create Date: 03/19/2018 07:24:40 AM
-- Design Name: Project 1 - Intro to VHDL
-- Module Name: Dest_Reg_Write - Behavioral
-- Project Name: Team 6
-- Target Devices: 
-- Tool Versions: 
-- Description: This file contains the dwrite logic using a 16x1 and a 4x1 MUX
--              and the table included in the project description on page 7.
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

entity Dest_Reg_Write is
  Port ( 
  op1op2: in std_logic_vector(3 downto 2);
  stage:  in std_logic_vector(1 downto 0);
  dwrite: out std_logic
  );
end Dest_Reg_Write;

architecture Behavioral of Dest_Reg_Write is
shared variable dwrite_mux_2_mux: std_logic; -- create signal between the two MUXs
begin

  process(op1op2)
    begin
      case op1op2 is
        when "0000"|"0001"|"0010"|"0011"|"0100"|"0110"|"1100"|"1110" => -- values from table
          dwrite_mux_2_mux := '1'; -- set signal between MUXs to HIGH
        when others =>
          dwrite_mux_2_mux := '0'; -- set signal between MUXs to HIGH
      end case;
    end process;
  
  process(stage)
    begin
      case stage is
        when "01" =>
          dwrite_mux_2_mux := dwrite_mux_2_mux; -- set the dwrite output to equal the signal (will be one clock-cycle delayed
        when others =>
          dwrite_mux_2_mux := '0';
      end case;
    end process;     
    
  dwrite <= dwrite_mux_2_mux;
    
end Behavioral;
