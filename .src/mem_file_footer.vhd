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
