library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity plusOne is port(
    i : in STD_LOGIC_VECTOR(3 downto 0);
    newI: out STD_LOGIC_VECTOR(3 downto 0)
);
end plusOne;

architecture Behavioral of plusOne is
begin
    process (i)
    begin
        newI <=  signed(i) + 1;
    end process;
end Behavioral;