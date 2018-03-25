library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IRL is
    Port ( stage: in  STD_LOGIC_VECTOR(1 downto 0);
          irload: out STD_LOGIC);
end IRL;

architecture dataflow of IRL is
component mux
    Port ( a: in  STD_LOGIC;
           b: in  STD_LOGIC;
           c: in  STD_LOGIC;
           d: in  STD_LOGIC;
          s1: in  STD_LOGIC;
          s0: in  STD_LOGIC;
           y: out STD_LOGIC);
end component;

begin
    m0: mux port map ( a => '1',
                       b => '0',
                       c => '0',
                       d => '0',
                      s1 => stage(1),
                      s0 => stage(0),
                       y => irload);
end dataflow;