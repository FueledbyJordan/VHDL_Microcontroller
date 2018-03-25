library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PCL_tb is
end;

architecture bench of PCL_tb is
component PCL
    Port ( zero: in  STD_LOGIC;
       negative: in  STD_LOGIC;
          irbit: in  STD_LOGIC_VECTOR(7 downto 0);
            op2: in  STD_LOGIC_VECTOR(1 downto 0);
          stage: in  STD_LOGIC_VECTOR(1 downto 0);
         pcload: out STD_LOGIC);
end component;
    
signal     zero: STD_LOGIC;
signal negative: STD_LOGIC;
signal    irbit: STD_LOGIC_VECTOR(7 downto 0);
signal      op2: STD_LOGIC_VECTOR(1 downto 0);
signal    stage: STD_LOGIC_VECTOR(1 downto 0);
signal   pcload: STD_LOGIC;
        
begin
    uut: PCL port map ( zero => zero,
                     negative => negative,
                        irbit => irbit,
                          op2 => op2,
                        stage => stage,
                       pcload => pcload);
    stimulus: process
    begin
        for i in 255 downto 0 loop
            irbit <= STD_LOGIC_VECTOR(to_unsigned(i,8));
            for j in 3 downto 0 loop
                op2 <= STD_LOGIC_VECTOR(to_unsigned(j,2));
                for k in 3 downto 0 loop
                    stage <= STD_LOGIC_VECTOR(to_unsigned(k,2));
                    for l in 1 downto 0 loop
                        negative <= to_unsigned(l,1)(0);
                        for m in 1 downto 0 loop
                            zero <= to_unsigned(m,1)(0);
                            wait for 10ns;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end process;
end;