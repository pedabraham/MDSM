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
begin

		

end Behavioral;