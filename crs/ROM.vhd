library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ROM is 
	port(
		Count : in STD_LOGIC_VECTOR(3 downto 0);
		Valor : out STD_LOGIC_VECTOR(3 downto 0)
	);
end ROM;

Architecture Behavioral of ROM is
begin
	process(Count)
	begin
		case Count is
			when "0000" =>	Valor <= "0010";   --empezar de cero
			when "0001" =>	Valor <= "0110";
			when "0010" =>	Valor <= "1000";
			when "0011" =>	Valor <= "1001";
			when "0100" =>	Valor <= "0101";
			--when "0101" =>	Valor <= "1000";
			--when "0110" =>	Valor <= "1001";
			when others =>	Valor <= "1111";
		end case;
	end process;

end Behavioral;