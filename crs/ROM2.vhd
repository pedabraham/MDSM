library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ROM2 is 
	port(
		Count       : in    STD_LOGIC_VECTOR(3 downto 0);
        palabrasEnt : in    std_logic_vector(35 downto 0) ;
		Valor       : out   STD_LOGIC_VECTOR(3 downto 0)
	);
end ROM2;

Architecture Behavioral of ROM2 is
begin
	process(Count)
	begin
		case Count is
			when "0000" =>	Valor <= palabrasEnt(3 downto 0);   --empezar de cero
			when "0001" =>	Valor <= palabrasEnt(7 downto 4);
			when "0010" =>	Valor <= palabrasEnt(11 downto 8);
			when "0011" =>	Valor <= palabrasEnt(15 downto 12);
			when "0100" =>	Valor <= palabrasEnt(19 downto 16);
			when "0101" =>	Valor <= palabrasEnt(23 downto 20);
			when "0110" =>	Valor <= palabrasEnt(27 downto 24);
			when "0111" =>	Valor <= palabrasEnt(31 downto 28);
            when "1000" =>	Valor <= palabrasEnt(35 downto 32);
            when others =>	Valor <= "1111";
		end case;
	end process;

end Behavioral;