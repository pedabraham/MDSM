library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BaseDeTiempo is
	generic(
		n : integer := 9
	);
	port(
		CLK : IN STD_LOGIC;
		NewWord : IN STD_LOGIC_VECTOR(n-1 downto 0);
		CE  : OUT STD_LOGIC
	);
end BaseDeTiempo;

architecture Behavioral of BaseDeTiempo is
Signal temporalCe: STD_LOGIC;
begin
process (NewWord)
begin
	CE<= NewWord(0) OR NewWord(1) OR NewWord(2) OR NewWord(3) OR NewWord(4) OR NewWord(5)OR NewWord(6) OR NewWord(7) OR NewWord(8);
	
	end process;
		
    


end Behavioral;