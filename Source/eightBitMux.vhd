library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux8 is
    Port ( a: in  STD_LOGIC_VECTOR(7 downto 0);
           b: in  STD_LOGIC_VECTOR(7 downto 0);
           c: in  STD_LOGIC_VECTOR(7 downto 0);
           d: in  STD_LOGIC_VECTOR(7 downto 0);
           s: in  STD_LOGIC_VECTOR(1 downto 0);
      output: out STD_LOGIC_VECTOR(7 downto 0));
end mux8;

architecture dataflow of mux8 is
signal u: STD_LOGIC;
signal v: STD_LOGIC;
signal w: STD_LOGIC;
signal x: STD_LOGIC;
signal y: STD_LOGIC;
begin
    y <= (u and (not s(1)) and (not s(0))) or (v and (not s(1)) and s(0)) or (w and s(1) and (not s(0))) or (x and s(1) and s(0));
    process(u,v,w,x,y)
    begin
        if y = u then
            output <= a;
        elsif y = v then
            output <= b;
        elsif y = w then
            output <= c;
        else
            output <= d;
        end if;
    end process;
end dataflow;