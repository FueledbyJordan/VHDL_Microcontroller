LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    ENTITY MEMORY IS
        PORT(
            ADDRESS : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            DATAOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            DATAIN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            readwrite : IN STD_LOGIC;
            clk : in STD_LOGIC;
            rst : in STD_LOGIC
        );
    END ENTITY;

    ARCHITECTURE BEV OF RAM IS
        TYPE MEM_2048 IS ARRAY (255 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
        SIGNAL MEMORY : MEM_2048;
        SIGNAL ADDR : INTEGER RANGE 0 TO 255;
        BEGIN
            PROCESS(ADDRESS, DATAIN, readwrite, clk, rst)
            BEGIN
                IF(rising_edge(clk)) THEN
                    IF(rst='1') THEN
                        DATAOUT <= "00000000";
                    ELSE
                        ADDR<=CONV_INTEGER(ADDRESS);
                        IF(readwrite='0')THEN
                            MEMORY(ADDR)<=DATAIN;
                        ELSIF(readwrite='1')THEN
                            DATAOUT<=MEMORY(ADDR);
                            END IF;
                    END IF;
                END IF;
            END PROCESS;
     END BEV;
