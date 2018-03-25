library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decode_Logic_tb is
--  Port ( );
end Decode_Logic_tb;

architecture beh1 of Decode_Logic_tb is
    --inputs
    signal instruction : std_logic_vector(7 downto 0) := (others => '0');
    signal zero : std_logic; --zero line from Register File; pass to pcload
    signal negative : std_logic; --negative from Register File; pass to pcload
    signal stage : std_logic_vector(1 downto 0); --input from the stage counter
    
    --outputs
    signal addrsel : std_logic_vector(1 downto 0);
    signal irload : std_logic;
    signal imload : std_logic;
    signal regsel : std_logic_vector(1 downto 0);
    signal dwrite : std_logic;
    signal aluop : std_logic_vector(1 downto 0);
    signal readwrite : std_logic;
    signal pcsel : std_logic;
    signal pcload : std_logic;
    signal sregsel : std_logic_vector(1 downto 0);
    signal dregsel : std_logic_vector(1 downto 0);
    
    begin    
    p0: entity work.Decode_Logic(Behavioral) port map(instruction=>instruction,zero=>zero,negative=>negative,stage=>stage,addrsel=>addrsel,irload=>irload,imload=>imload,regsel=>regsel,dwrite=>dwrite,aluop=>aluop,readwrite=>readwrite,pcsel=>pcsel,pcload=>pcload,sregsel=>sregsel,dregsel=>dregsel);

    process
    begin
        --Stage 0 Testing
--        wait for 10ns;
--        instruction <= "00000000";
--        zero <= '0';
--        negative <= '0';
--        stage <= "00";
--        wait for 10ns;
--        instruction <= "00000000";
--        zero <= '1';
--        negative <= '1';
--        stage <= "00";
--        wait for 10ns;
--        instruction <= "00000000";
--        zero <= '1';
--        negative <= '0';
--        stage <= "00";
--        wait for 10ns;
--        instruction <= "00000000";
--        zero <= '0';
--        negative <= '1';
--        stage <= "00";
--        wait for 10ns;
--        instruction <= "00000110";
--        zero <= '0';
--        negative <= '0';
--        stage <= "00";
--        wait for 10ns;
--        instruction <= "00000110";
--        zero <= '1';
--        negative <= '1';
--        stage <= "00";
--        wait for 10ns;
--        instruction <= "00000110";
--        zero <= '1';
--        negative <= '0';
--        stage <= "00";
--        wait for 10ns;
--        instruction <= "00000110";
--        zero <= '0';
--        negative <= '1';
--        stage <= "00";

        --Stage 1 Testing
--        wait for 10ns;
--        stage <= "01";
--        instruction <= "01001111";
--        zero <= '0';
--        negative <= '0';
--        wait for 10ns;
--        stage <= "01";
--        instruction <= "10001111";
--        zero <= '0';
--        negative <= '0';
--        wait for 10ns;
--        stage <= "01";
--        instruction <= "11001111";
--        zero <= '0';
--        negative <= '0';
--        wait for 10ns;
--        stage <= "01";
--        instruction <= "00001111";
--        zero <= '0';
--        negative <= '0';
        
        zero <= '0';
        negative <= '0';
        stage <= "10";
        wait for 10ns;
        instruction <= "00000110";
        wait for 10ns;
        instruction <= "00010110";
        wait for 10ns;
        instruction <= "00100110";
        wait for 10ns;
        instruction <= "01110110";
        wait for 10ns;  
        instruction <= "11000110";
        wait for 10ns;
        instruction <= "01010110";      
     end process;
end beh1;