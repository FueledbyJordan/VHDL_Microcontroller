LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY MEMORY IS
    PORT(
        address : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
        dataout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
        datain : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        readwrite : IN STD_LOGIC;-- := '0';   --read is 1, write is 0
        clk : in STD_LOGIC := '0';
        rst : in STD_LOGIC := '0'
    );
END ENTITY;

ARCHITECTURE BEV OF MEMORY IS
    TYPE MEM_2048 IS ARRAY (255 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MEMORY : MEM_2048 := (OTHERS => "00000000");
    SHARED VARIABLE ADDR : INTEGER RANGE 0 TO 255;
    BEGIN
        MEMORY(0) <= "11100100"; --LI R1, 0x00
        MEMORY(1) <= "00000000"; --Immediate Val
        MEMORY(2) <= "11100000"; --LI R0, 0x80
        MEMORY(3) <= "10000000"; --Immediate Val
        MEMORY(4) <= "01001000"; --LW R2 (R0)
        MEMORY(5) <= "10001000"; --JEQ R2 end
        MEMORY(6) <= "00001101"; --Immediate Val
        MEMORY(7) <= "00100110"; --ADD R1 (R2)
        MEMORY(8) <= "11101100"; --LI R3, 0x01
        MEMORY(9) <= "00000001"; --Immediate Val
        MEMORY(10) <= "00100011"; --ADD R0 (R3)
        MEMORY(11) <= "11111111"; --JMP loop
        MEMORY(12) <= "00000100"; --Immmediate Val
        MEMORY(13) <= "11010100"; --SW R1, 0x40
        MEMORY(14) <= "01000000"; --Immediate Val
        MEMORY(15) <= "11111111"; --JMP inf
        MEMORY(16) <= "00001111"; --Immediate Val
        PROCESS(ADDRESS, DATAIN, readwrite, clk, rst)
        BEGIN
            IF(rising_edge(clk)) THEN
                IF(rst='1') THEN
                    dataout <= "00000000";
                ELSE
                    ADDR:=CONV_INTEGER(ADDRESS);
                    IF(readwrite='1')THEN
                        MEMORY(ADDR)<=datain;
                    ELSE
                        dataout<=MEMORY(ADDR);
                    END IF;
                END IF;
            END IF;
        END PROCESS;
END BEV;
