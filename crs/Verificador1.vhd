library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Verificador1 is
	port(
		P 		: in 	STD_LOGIC_VECTOR(8 downto 0);
		Count 	: in 	STD_LOGIC_VECTOR(3 downto 0);
		Salida 	: out 	STD_LOGIC
	);
end Verificador1;

architecture Behavioral of Verificador1 is
	
	begin
		comb : process(P,Count)
		begin
			
		if(P = "1111111" AND Count = "0111") then	
				Salida <= '1';
			else 
				Salida <= '0';
			end if;					   
			
		end process comb;	

end Behavioral;