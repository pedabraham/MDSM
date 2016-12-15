library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
---------------------------------------------------
entity Timmer is
	port(
		Clk  : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		Count : OUT STD_LOGIC_VECTOR(27 downto 0) --Indica el turno en que se detecto un sensor.
	);
end Timmer;
---------------------------------------------------
architecture Behavioral of Timmer is
-------------------SIGNALS-------------------------
signal N_S : std_logic_vector(n-1 downto 0);
signal P_S : std_logic_vector(n-1 downto 0);
-------------------PROCESS-------------------------
begin 
	comb : process(P_S)
	begin 
		if ( P_S = "1000111100001101000110000000" ) then
			N_S <= (others => '0');
		else
			N_S <= P_S + 1;
		end if;		

	Count <= P_S;		
	end process comb;

	sequ : process(clk,rst)
	begin
		if(rst = '1') then
			P_S <= (others => '0');
		elsif (clk'event AND clk = '1') then
			P_S <=	N_S; 
		end if;
	end process sequ;
end Behavioral;