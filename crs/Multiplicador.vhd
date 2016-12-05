library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity multiplicador is
    port(
        numero: in STD_LOGIC_VECTOR(3 downto 0);
        indice: in STD_LOGIC_VECTOR(3 downto 0);
        resultado:  out STD_LOGIC_VECTOR(11 downto 0)
    );
end multiplicador;
	  
architecture Behavioral of multiplicador is
    signal temp : INTEGER;
begin
    process(numero, indice)
    begin
        temp <= conv_integer(numero) * (10**conv_integer(indice) );      --Para usar el operador ** (exponente) solo se deben usar INTEGER.
        resultado <= STD_LOGIC_VECTOR(to_unsigned(temp, resultado'length)); -- Se convierte de INTEGER a STD_LOGIC_VECTOR para mandarlo a la salida. 
    end process;
end Behavioral;