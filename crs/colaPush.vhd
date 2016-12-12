library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity colaPush is 
    generic(
        n:integer:=4
    );
    port(
        numero      : in    STD_LOGIC_VECTOR(3 downto 0);
        CLK         : in    STD_LOGIC;
        Clr         : in    STD_LOGIC;
        cambio      : in    std_logic;
        Count       : in    STD_LOGIC_VECTOR(3 downto 0);
        cadenaActu  : in    std_logic_vector(35 downto 0) ;   
        cadenaFinal : out   STD_LOGIC_VECTOR(35 downto 0);
    );
end colaPush;

architecture Behavioral of colaPush is
signal cola : std_logic_vector(35 downto 0);
begin
    process (A,B,CLK,Clr,Count)
    begin
        if(CLK'event AND CLK = '1'AND cambio='1') then        
            cola(conv_integer(Count)+1*4 downto conv_integer(Count)*4) <= numero;
            cadenaFinal <= cola;
        elsif(Clr = '1')then
            cola <= (others => '0');
        else
            cadenaFinal <= cadenaAct;

        end if;
    end process;
end Behavioral;