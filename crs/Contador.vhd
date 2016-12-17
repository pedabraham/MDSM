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
		Clk  : IN STD_LOGIC;
		Clr : IN STD_LOGIC;
		CE: in STD_LOGIC;
		Count : OUT STD_LOGIC_VECTOR(n-1 downto 0) --Indica el turno en que se detecto un sensor.
	);
end Contador;
---------------------------------------------------
architecture Behavioral of Contador is
-------------------SIGNALS-------------------------
signal N_S : std_logic_vector(n-1 downto 0);
signal P_S : std_logic_vector(n-1 downto 0);
-------------------PROCESS-------------------------
begin 
	comb : process(P_S)
	begin 
		if ( P_S = "1001" ) then
			N_S <= "0000";
		else
			N_S <= P_S + 1;
		end if;				

		Count <= P_S;

	end process comb;

	sequ : process(clk,clr)
	begin
		if(Clr = '1') then
			P_S <= "0000";
		elsif (clk'event AND clk = '1' AND CE='1') then
					P_S <=	N_S; 
		end if;
	end process sequ;
end Behavioral;