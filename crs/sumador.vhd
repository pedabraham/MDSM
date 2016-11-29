library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador 
is generic(
    n:integer:=8
);
is port(
    A: in STD_LOGIC_VECTOR(n-1 downto 0);
    B: in STD_LOGIC_VECTOR(3 downto 0);
    resultado:  out STD_LOGIC_VECTOR(29 downto 0)
);
end sumador;

architecture Behavioral of sumador is
    begin
        process (numero,indice)
        begin
        resultado <= signed(A) +signed(B);
        end process;
end Behavioral;