library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplicador is
generic(
    n:integer:=8
);
port(
    numero: in STD_LOGIC_VECTOR(n-1 downto 0);
    indice: in STD_LOGIC_VECTOR(3 downto 0);
    resultado:  out STD_LOGIC_VECTOR(11 downto 0)
);
end multiplicador;
	  
architecture Behavioral of multiplicador is
    begin
        process (numero,indice)	
		variable P: signed (11 downto 0);
        begin	   
		P:= signed(numero) *signed(indice);
        resultado <= STD_LOGIC_VECTOR(P);
        end process;
end Behavioral;
