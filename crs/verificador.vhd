library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity verificador 
is generic(
    n:integer:=8
);
is port(
    A: in STD_LOGIC_VECTOR(n-1 downto 0);
    B: in STD_LOGIC_VECTOR(n-1 downto 0);
    Bool: out STD_LOGIC
);
end verificador;

architecture Behavioral of verificador is
    begin
        process (numero,indice)
        begin
            if( A = B) then
            Bool<= '1';
            else
            Bool <='0';
            end if;
        end process;
end Behavioral;