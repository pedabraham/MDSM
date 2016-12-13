library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity colaPush is 
    port(
        numero      : in    STD_LOGIC_VECTOR(3  downto 0);
        CLK         : in    STD_LOGIC;
        Clr         : in    STD_LOGIC;
        cambio      : in    std_logic;
        Count       : in    STD_LOGIC_VECTOR(3  downto 0);
        cadenaActu  : in    STD_LOGIC_VECTOR(35 downto 0);   
        cadenaFinal : out   STD_LOGIC_VECTOR(35 downto 0);
        longitud    : out   std_logic_vector(3 downto 0)
    );
end colaPush;

architecture Behavioral of colaPush is
signal cola : std_logic_vector(35 downto 0);
signal N_S : std_logic_vector(4 downto 0);
signal P_S : std_logic_vector(4 downto 0);
begin
    comb : process(P_S)
	begin 
		if ( P_S = "1001" ) then
			N_S <= "0000";
		else
			N_S <= P_S + 1;
		end if;				

		longitud <= P_S;

	end process comb;

    seq: process (CLK,Clr,Count,numero,cambio)
    begin
        if(CLK'event AND CLK = '1'AND cambio='1') then        
            cola(conv_integer(Count)+1*4 downto conv_integer(Count)*4) <= numero;
            cadenaFinal <= cola;
            P_S<=N_S;
        elsif(Clr = '1')then
            cola <= (others => '0');
            P_S  <= (others => '0');
        else
            cadenaFinal <= cadenaAct;

        end if;
    end process;
end Behavioral;