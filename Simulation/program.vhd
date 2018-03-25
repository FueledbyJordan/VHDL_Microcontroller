library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity program is
end program;

architecture BEV of program is
    constant T : TIME := 125 ns;
    constant MEM_WIDTH : INTEGER := 8;
    constant INSTRUCTION_POINTER : STD_LOGIC_VECTOR(MEM_WIDTH - 1 downto 0) := (others => '0');
    constant NUM_INSTRUCTIONS : INTEGER := 17;
    type INSTRUCTIONS is array(NUM_INSTRUCTIONS - 1 downto 0) of STD_LOGIC_VECTOR(MEM_WIDTH - 1 downto 0);


    signal ISA : INSTRUCTIONS;
    signal address : STD_LOGIC_VECTOR(MEM_WIDTH - 1 downto 0);-- := (others=>'0');
    signal dataout : STD_LOGIC_VECTOR(MEM_WIDTH - 1 downto 0) := (others=>'0');
    signal datain : STD_LOGIC_VECTOR(MEM_WIDTH - 1 downto 0);
    signal readwrite : STD_LOGIC;
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    
    begin
    
    ISA(0) <= "11100100"; --LI R1, 0x00
    ISA(1) <= "11111111"; --Immediate Val
    ISA(2) <= "11100000"; --LI R0, 0x80
    ISA(3) <= "10000000"; --Immediate Val
    ISA(4) <= "01001000"; --LW R2 (R0)
    ISA(5) <= "10001000"; --JEQ R2 end
    ISA(6) <= "00001101"; --Immediate Val
    ISA(7) <= "00100110"; --ADD R1 (R2)
    ISA(8) <= "11101100"; --LI R3, 0x01
    ISA(9) <= "00000001"; --Immediate Val
    ISA(10) <= "00100011"; --ADD R0 (R3)
    ISA(11) <= "11111111"; --JMP loop
    ISA(12) <= "00000100"; --Immmediate Val
    ISA(13) <= "11010100"; --SW R1, 0x40
    ISA(14) <= "01000000"; --Immediate Val
    ISA(15) <= "11111111"; --JMP inf
    ISA(16) <= "00000000"; --Immediate Val

    p0 : entity work.Memory(BEV) port map(address=>address, dataout=>dataout, datain=>datain, readwrite=>readwrite, clk=>clk, rst=>rst);

    process
    begin

        --begin load ISA into memory, takes 2250 ns
        clk <= '0';
        wait for T/2;
        clk <= '1';
        readwrite <= '0';

        instr_loop : for i in 0 to NUM_INSTRUCTIONS - 1 loop
            datain <= ISA(i);
            clk <= '0';
            address <= STD_LOGIC_VECTOR(to_unsigned((CONV_INTEGER(INSTRUCTION_POINTER) + i), address'length));
            wait for T/2;
            clk <= '1';
            wait for T/2;
        end loop instr_loop;
        --end load ISA into memory

        clk <= '0';
        readwrite <= '1';

        --begin ISA load verif
        verif_loop : for j in 0 to NUM_INSTRUCTIONS - 1 loop
            address <= STD_LOGIC_VECTOR(to_unsigned((CONV_INTEGER(INSTRUCTION_POINTER) + j), address'length));
            wait for T/2;
            clk <= '1';
            wait for T/2;
            clk <= '0';
        end loop verif_loop;        

        wait;
        --end ISA load verif

    end process;

end BEV; 
