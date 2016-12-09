library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity prueba is 
	port(
		bool : in std_logic;
		CLK  : in std_logic;
		count: in std_logic_vector(3 downto 0);
		CE	 : in std_logic;
		rst  : in std_logic;
		Salida: out std_logic
	);
end prueba;

architecture simple of prueba is
signal N_S, P_S : std_logic_vector(6 downto 0);
begin
	comb : process(bool, count,CE,P_S)
	begin
		if(CE = '1')then
			case count is
				when "0001" => N_S(0) <= bool;
				when "0010" => N_S(1) <= bool;
				when "0011" => N_S(2) <= bool;
				when "0100" => N_S(3) <= bool;
				when "0101" => N_S(4) <= bool;
				when "0110" => N_S(5) <= bool;
				when "0111" => N_S(6) <= bool;  
				when others => NULL;
			end case;
		end if;

		if(P_S = "1111111" AND count = "0111")then
			salida <= '1';
		else 
			salida <= '0';
		end if;
	end process comb;

	sequ : process(CLK, rst)
	begin
		if(rst = '1')then
			P_S <= (others => '0');
		elsif(clk'event AND clk = '1')then
			P_S <= N_S;
		end if;
	end process sequ;
end simple;
