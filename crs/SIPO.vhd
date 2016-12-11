library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SIPO is
    generic(
        n:integer:=9
    );
    port(
    Bool: IN     STD_LOGIC; 
    Clk : IN     STD_LOGIC;
	CE  : IN     STD_LOGIC;
	Clr : IN     STD_LOGIC;
    P   : OUT    STD_LOGIC_VECTOR(n-1 downto 0)

);
end SIPO;

architecture Behavioral of SIPO is
signal P_S,N_S: STD_LOGIC_VECTOR(n-1 downto 0);
begin 
    comb: process(P_S,N_S,Bool)
    begin
       N_S(n-1) <= Bool;
		N_S(n-2 downto 0)<= P_S (n-1 downto 1);
        
        P  <= N_S;;
    end process comb;

    sequ: process (Clk,CE,CLr,N_S)
    begin
        if(Clr = '1') then
			P_S <= (others => '0'); 
        elsif(Clk'event AND Clk='1'AND CE='1')then
            P_S<=N_S;
        end if;
    end process sequ;

end Behavioral;
