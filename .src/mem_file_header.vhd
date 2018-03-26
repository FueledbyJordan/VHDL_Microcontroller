LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY MEMORY IS
    PORT(
        address : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
        dataout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
        datain : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        readwrite : IN STD_LOGIC;-- := '0';   --read is 0, write is 1
        clk : in STD_LOGIC := '0';
        rst : in STD_LOGIC := '0'
    );
END ENTITY;

ARCHITECTURE BEV OF MEMORY IS
    TYPE MEM_2048 IS ARRAY (255 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MEMORY : MEM_2048 := (OTHERS => "00000000");
    SHARED VARIABLE ADDR : INTEGER RANGE 0 TO 255;
    BEGIN