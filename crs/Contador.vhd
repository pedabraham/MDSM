library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
---------------------------------------------------
entity cont is 
port(
	clk : in std_logic;
	CE  : in std_logic;
	count : out std_logic_vector(3 downto 0)
);
end cont;
---------------------------------------------------
architecture simple of cont is
-------------------SIGNALS-------------------------
signal N_S : std_logic_vector();
signal P_S : std_logic_vector();
---------------------------------------------------
begin 
	comb : process()
	begin 
		if(P_S = "1001") then
			N_S <= (others => '0');
		else 
			N_S <= P_S + 1;
		end if;
	count <= P_S;
	end process comb;

	sequ : process(clk, CE, N_S)
	begin
		if (clk'event AND clk = '1') then
			if (CE = '1') then
				P_S <=	N_S; 
			end if;
		end if;
	end process sequ;

end simple;