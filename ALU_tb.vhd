library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_TB is

end ALU_TB;

architectural BEHAVIORAL  of ALU_TB
    signal A : in STD_LOGIC_VECTOR(7 downto 0);
    signal B : in STD_LOGIC_VECTOR(7 downto 0);
    signal aluop : in STD_LOGIC_VECTOR(3 downto 0);
    signal result : out STD_LOGIC_VECTOR(7 downto 0);

begin
    p0: entity work.ALU(BEV) port map (A=>A, B=>B, aluop=>aluop, result=>result);

    process
        begin
            wait for 100 ns;
            aluop <= "0000";
            A <= "00110110";
            B <= "00001111";
            wait for 20 ns;
            aluop <= "0001";
            A <= "00110110";
            B <= "00001111";
            wait for 20 ns;
            aluop <= "0010";
            A <= "00110110";
            B <= "00001111";
            wait for 20 ns;
            aluop <= "0011";
            A <= "00110110";
            B <= "00001111";
            wait for 100 ns;
    end process;
end BEHAVIORAL;
