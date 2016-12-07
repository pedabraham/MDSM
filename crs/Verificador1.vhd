library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Verificador1 is
	port(
		bool : in STD_LOGIC;
		Count : in STD_LOGIC;
		CLK : in STD_LOGIC;
		CE : in STD_LOGIC;
		Salida : out STD_LOGIC
	);
end Verificador1;

architecture Behavioral of Verificador1 is
	SIGNAL P_S, N_S : STD_LOGIC_VECTOR(6 downto 0);
	begin
	comb : process(P_S, N_S, bool, Count)
	begin
		N_S(conv_integer(Count)) <= bool;

		if(P_S = "1111111" AND Count = "0111") then
			Salida <= '1';
		else 
			Salida <= '0';
		end if;

	end process comb;	

	sequ : process(CLK, CE)
	begin
		if(CLK'event AND CLK = 1) then
			if(CE = '1') then
				P_S <= N_S;
			end if;
		end if;

	end process sequ;

end Behavioral;