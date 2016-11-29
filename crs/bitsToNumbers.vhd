library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitsToNumbers is port(
    cadenaOriginalDeBits:   IN   STD_LOGIC_VECTOR(8 downto 0);
    numero              :   OUT  STD_LOGIC_VECTOR(3 downto 0)

);
end bitsToNumbers;

architecture Behavioral of bitsToNumbers is
begin
    process(cadenaOriginalDeBits)
    begin
    case cadenaOriginalDeBits is
        when "100000000" => numero <= "0001";
        when "010000000" => numero <= "0010";
        when "001000000" => numero <= "0011";
        when "000100000" => numero <= "0100";
        when "000010000" => numero <= "0101";
        when "000001000" => numero <= "0110";
        when "000000100" => numero <= "0111";
        when "000000010" => numero <= "1000";
        when "000000001" => numero <= "1000";
        when others => numero <= "0000";
    end case;
    end process;
end architecture;

