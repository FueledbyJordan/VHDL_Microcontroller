library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
    Port ( readwrite, clk, rst: in  STD_LOGIC;
               address, datain: in  STD_LOGIC_VECTOR(7 downto 0);
                       dataout: out STD_LOGIC_VECTOR(7 downto 0));
end RAM;

architecture dataflow of RAM is

type Memory_Array is array(255 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
signal Memory: Memory_Array;

begin
    write: process(clk)
    begin
        if (clk = '1') then
            if rst = '1' then
                for i in Memory'range loop
                    Memory(i) <= (others => '0');
                end loop;
            else
                if readwrite = '1' then
                    Memory(to_integer(unsigned(address))) <= datain;
                end if;
            end if;
        end if;
    end process;
    
    read: process(clk)
    begin
        if (clk = '1') then
            if rst = '1' then
                dataout <= (others => '0');
            else
                if readwrite = '1' then
                    dataout <= datain;
                else
                    dataout <= Memory(to_integer(unsigned(address)));
                end if;
            end if;
        end if;
    end process;
end dataflow;