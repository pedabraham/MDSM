library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Verificador1 is
	port(
		bool : in STD_LOGIC;
		Count : in STD_LOGIC_VECTOR(3 downto 0);
		CLK : in STD_LOGIC;
		CE : in STD_LOGIC;
		Clr : IN STD_LOGIC;	  
		Verif : out STD_LOGIC_VECTOR(9 downto 0);
		Salida : out STD_LOGIC
	);
end Verificador1;

architecture Behavioral of Verificador1 is
	SIGNAL P_S, N_S : STD_LOGIC_VECTOR(9 downto 0);
	begin
		comb : process(P_S, N_S, bool, Count,CE)
		begin
			
		if(P_S(7 downto 1) = "1111111" AND Count = "0111") then	
				Salida <= '1';
			else 
				Salida <= '0';
			end if;					   
			Verif <= P_S;
		end process comb;	

		sequ : process(CLK, CE,Clr)
		begin
			if(Clr = '1') then
				P_S <= (others => '0');
			elsif (CLK'event AND CLK = '1') then
				if(CE = '1') then 
					N_S(conv_integer(Count)) <= bool;
					P_S <= N_S;
				end if;
			end if;
		end process sequ;
end Behavioral;