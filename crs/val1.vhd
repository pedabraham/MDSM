library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity val1 is
 generic(
        n:integer:=9
    );
    port(
    NewWord         :   IN  STD_LOGIC_VECTOR(n-1 downto 0);	--cadena recien hecha
    Clk             :   IN  STD_LOGIC;
	 rst				  :	IN  STD_LOGIC;
    GoodWord        :   OUT STD_LOGIC_VECTOR(n-1 downto 0)	--palabra que saldra si pasa los filtros
    );
end val1;

architecture Behavioral of val1 is 

   signal AlreadyInWord    :   STD_LOGIC_VECTOR(n-1 downto 0); --cadena de comprobacion o estado presente
    signal FinalWord        :   STD_LOGIC_VECTOR(n-1 downto 0); --cadena de comprobacion nueva o proximo estado
	signal GoodWord2        :   STD_LOGIC_VECTOR(n-1 downto 0);

begin
    comb: process (NewWord,AlreadyInWord)
    begin
        for I in 0 to n-1 loop
            if(AlreadyInWord(I)='0') then
                GoodWord2(I)<=NewWord(I);
            else
                GoodWord2(I)<='0';
            end if;

            FinalWord(I) <= NewWord(I) OR AlreadyInWord(I);



        end loop;
    end process; 

    sequ: process(Clk,FinalWord,rst) 
    begin
	if(rst = '1') then
		AlreadyInWord <= "000000000";
    elsif(Clk'event AND Clk='1') then 		
				AlreadyInWord<=FinalWord;	
				GoodWord<=GoodWord2;
	end if;
    end process; 


end Behavioral;
    
