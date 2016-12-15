library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comparador is 
    generic(
        n:integer:=4
    );
    port(
        A       : in    STD_LOGIC_VECTOR(n-1 downto 0);
        B       : in    STD_LOGIC_VECTOR(n-1 downto 0);
        CLK     : in    STD_LOGIC;
        Clr     : in    STD_LOGIC;
        longCad : in    STD_LOGIC;
        Count   : in    STD_LOGIC_VECTOR(3 downto 0);
        Bool    : out   STD_LOGIC
    );
end comparador;

architecture Behavioral of comparador is
signal N_S : std_logic_vector(9 downto 0);
signal cadenaComparacion    :   std_logic_vector(8 downto 0) ;
begin
    process (A,B,CLK,Clr,Count)
    begin 
        cadenaComparacion <= (8 downto conv_integer(longCad)  => '0') & (others => '1');    
        if(Clr = '1')then
            N_S <= (others => '0');
            Bool <= '0';--
        elsif(CLK'event AND CLK = '1') then        
            if( A = B) then
                N_S(conv_integer(Count)) <= '1';
            else
                N_S(conv_integer(Count)) <= '0';
            end if;
            end if;
        if(N_S(8 downto 0) = cadenaComparacion )then
            Bool <= '1';
        
        else
            Bool <= '0';
        end if;
    end process;
end Behavioral;