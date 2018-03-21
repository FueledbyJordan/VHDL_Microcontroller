library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_TB is

end ALU_TB;

architecture Arch of ALU_TB is
        signal A : STD_LOGIC_VECTOR(7 downto 0);
        signal B : STD_LOGIC_VECTOR(7 downto 0);
        signal aluop : STD_LOGIC_VECTOR(3 downto 0);
        signal result : STD_LOGIC_VECTOR(7 downto 0);
begin
    p0: entity work.ALU(Arch) port map (A=>A, B=>B, aluop=>aluop, result=>result);

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
            wait for 20 ns;
            aluop <= "0010";
            A <= "10110110";
            B <= "10001111";
            wait for 20 ns;
            aluop <= "0011";
            A <= "00110110";
            B <= "10001111";
            wait for 100 ns;
    end process;
end Arch;

