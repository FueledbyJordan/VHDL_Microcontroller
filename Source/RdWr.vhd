library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RdWr is
    Port ( irbit: in  STD_LOGIC_VECTOR(7 downto 0);
           stage: in  STD_LOGIC_VECTOR(1 downto 0);
       readwrite: out STD_LOGIC);
end RdWr;

architecture dataflow of RdWr is
component mux
    Port ( a: in  STD_LOGIC;
           b: in  STD_LOGIC;
           c: in  STD_LOGIC;
           d: in  STD_LOGIC;
          s1: in  STD_LOGIC;
          s0: in  STD_LOGIC;
           y: out STD_LOGIC);
end component;

signal x: STD_LOGIC;

begin
    x <= irbit(4) and (not irbit(5)) and irbit(6);
    m0: mux port map ( a => '0',
                       b => '0',
                       c => x,
                       d => '0',
                      s1 => stage(1),
                      s0 => stage(0),
                       y => readwrite);
end dataflow;