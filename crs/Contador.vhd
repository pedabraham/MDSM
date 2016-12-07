library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
---------------------------------------------------
entity Contador is
	generic(
		n : INTEGER := 4
	); 
	port(
		GoodWord : IN STD_LOGIC_VECTOR(8 downto 0);	--Palbra generada por los sensores.
		clk : IN STD_LOGIC;
		CE  : IN STD_LOGIC;
		Clr : IN STD_LOGIC;
		Indice : OUT STD_LOGIC_VECTOR(n-1 downto 0) --Indica el turno en que se detecto un sensor.
	);
end Contador;
---------------------------------------------------
architecture Behavioral of Contador is
-------------------SIGNALS-------------------------
signal N_S : std_logic_vector(n-1 downto 0);
signal P_S : std_logic_vector(n-1 downto 0);
-------------------PROCESS-------------------------
begin 
	comb : process(GoodWord, P_S, Indice)
	begin 
		if(Goodword = "000000000") then 
			--No hacer nada si no se detecta ningun sensor--	
		else
			if(P_S = "1001") then	--
				N_S <= (others => '0');
			else 
				N_S <= P_S + 1;
			end if;
			Indice <= P_S;
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

end Behavioral;