library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity habilitador is 
generic(
		n : integer := 9
	);
port(
    word : IN STD_LOGIC_VECTOR(n-1 downto 0);
    CE : OUT STD_LOGIC
);
end habilitador;

architecture Behavioral of habilitador is
begin

    if (word= "000000000") then
        CE <= '0';
    else
        CE <= '1';
    end if;

end Behavioral;