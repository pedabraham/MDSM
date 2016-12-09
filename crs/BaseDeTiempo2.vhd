library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
---------------------------------------------------
entity BasedeTiempo2 is
	port(
		clk : in std_logic;
		rst_in : in std_logic;
		rst_out : out std_logic
	);
end BasedeTiempo2;
---------------------------------------------------
architecture simple of BasedeTiempo2 is
-------------------Signals-------------------------
	signal N_S : std_logic_vector(3 downto 0);
	signal P_S : std_logic_vector(3 downto 0);
-------------------Process-------------------------
begin
	comb : process(P_S)
	begin
		--if(P_S = "11101110011010110010100000000") then
		if(P_S = "0011") then
			N_S <= (others => '0');
			rst_out <= '1';  
		else 
			N_S <= P_S + '1';
			rst_out <= '0';
		end if;
	end process comb; 	
	
	sequ : process(clk,rst_in,rst_in)
	begin
		if( rst_in = '1' ) then
			P_S <= (others => '0');
		elsif ( clk'event AND clk = '1') then
			P_S <= N_S;
		end if;
	end process sequ; 
end simple;