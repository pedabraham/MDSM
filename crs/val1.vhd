library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity val1 is
 generic(
        n:integer:=9
    );
    port(
    NewWord         :   IN  STD_LOGIC_VECTOR(n-1 downto 0);	--cadena recien hecha
    CE              :   IN  STD_LOGIC;
    Clk             :   IN  STD_LOGIC;
    GoodWord        :   OUT STD_LOGIC_VECTOR(n-1 downto 0)	--palabra que saldra si pasa los filtros
    );
end val1;

architecture Behavioral of val1 is 
begin
    signal AlreadyInWord    :   STD_LOGIC_VECTOR(n-1 downto 0); --cadena de comprobacion o estado presente
    signal FinalWord        :   STD_LOGIC_VECTOR(n-1 downto 0); --cadena de comprobacion nueva o proximo estado

    comb: process (NewWord,AlreadyInWord)
    begin
        for I in 0 to n-1 loop
            if(AlreadyInWord(I)='0') then
                GoodWord(I)<=NewWord(I);
            else
                GoodWord(I)<='0';
            end if;

            FinalWord(I) <= NewWord(I) OR AlreadyInWord(I);



        end loop;
    end process; 

    sequ: process(CE,Clk,FinalWord) 
    begin

    if(Clk'event AND Clk='1') then 
			if (CE = '1') then
				AlreadyInWord<=FinalWord;
			end if;
	end if;
    end process; 


end Behavioral;
    
