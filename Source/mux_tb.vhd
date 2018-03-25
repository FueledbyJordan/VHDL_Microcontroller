library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_tb is
end;

architecture bench of mux_tb is
component mux
    Port ( a: in  STD_LOGIC;
           b: in  STD_LOGIC;
           c: in  STD_LOGIC;
           d: in  STD_LOGIC;
          s1: in  STD_LOGIC;
          s0: in  STD_LOGIC;
           y: out STD_LOGIC);
end component;
    
signal  a: STD_LOGIC;
signal  b: STD_LOGIC;
signal  c: STD_LOGIC;
signal  d: STD_LOGIC;
signal s1: STD_LOGIC;
signal s0: STD_LOGIC;
signal  y: STD_LOGIC;
        
begin
    uut: mux port map ( a => a,
                        b => b,
                        c => c,
                        d => d,
                       s1 => s1,
                       s0 => s0,
                        y => y);
    stimulus: process
    begin
        for i in 1 downto 0 loop
            a <= to_unsigned(i,1)(0);
            for j in 1 downto 0 loop
                b <= to_unsigned(j,1)(0);
                for k in 1 downto 0 loop
                    c <= to_unsigned(k,1)(0);
                    for l in 1 downto 0 loop
                        d <= to_unsigned(l,1)(0);
                        for m in 1 downto 0 loop
                            s1 <= to_unsigned(m,1)(0);
                            for n in 1 downto 0 loop
                                s0 <= to_unsigned(n,1)(0);
                                wait for 10ns;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end process;
end;