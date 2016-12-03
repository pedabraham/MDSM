library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador 
is generic(
    n:integer:=30
);
 port(
    A           : in    STD_LOGIC_VECTOR(n-1 downto 0);
    clk         : in    STD_LOGIC;
    CE          : in    STD_LOGIC;
    resultado   : out   STD_LOGIC_VECTOR(n-1 downto 0)
);
end sumador;

architecture Behavioral of sumador is

signal N_S,B: STD_LOGIC_VECTOR(n-1 downto 0); --B es el estado presente

    begin
        comb: process (A,B)
        begin
            resultado <= unsigned(A) +unsigned(B);
            N_S<=resultado
        end process;

        sequ: process
        begin
            if (clk'event AND clk = '1') then
			if (CE = '1') then
				B <=	N_S; 
			end if;
		end if;

end Behavioral;