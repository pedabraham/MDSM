library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
---------------------------------------------------
entity contador is
generic(
	n : INTEGER := 4
); 
port(
	num : in std_logic_vector(8 downto 0);
	clk : in std_logic;
	CE  : in std_logic;
	count : out std_logic_vector(n-1 downto 0)
);
end contador;
---------------------------------------------------
architecture simple of contador is
-------------------SIGNALS-------------------------
signal N_S : std_logic_vector(n-1 downto 0);
signal P_S : std_logic_vector(n-1 downto 0);
---------------------------------------------------
begin 
	comb : process(num, P_S, count)
	begin 
		if(num = "000000000")then 
			
		else
			if(P_S = "1001") then
				N_S <= (others => '0');
			else 
				N_S <= P_S + 1;
			end if;
			count <= P_S;
		end if;
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