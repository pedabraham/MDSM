library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity val2 is
 generic(
        n:integer:=9
    );
    port(
    NewWord         :   IN  STD_LOGIC_VECTOR(n-1 downto 0);	--cadena recien hecha
    Clk             :   IN  STD_LOGIC;
    rst				:	IN  STD_LOGIC;
    GoodWord        :   OUT STD_LOGIC_VECTOR(n-1 downto 0)	--palabra que saldra si pasa los filtros
    );
end val2;

architecture Behavioral of val2 is 

    signal AlreadyInWord    :   STD_LOGIC_VECTOR(n-1 downto 0); --cadena de comprobacion o estado presente
    signal FinalWord        :   STD_LOGIC_VECTOR(n-1 downto 0); --cadena de comprobacion nueva o proximo estado	 
	signal GoodWord2        :   STD_LOGIC_VECTOR(n-1 downto 0);

begin


    comb: process (NewWord,AlreadyInWord)
    begin
		if( NewWord /= "000000000")then
        if (NewWord = AlreadyInWord) then
            GoodWord2    <= (others => '0');
            FinalWord   <= AlreadyInWord;
        else
            GoodWord2     <= NewWord; 
            FinalWord    <= NewWord;
        end if ;
		else  
			FinalWord   <= AlreadyInWord;
			GoodWord2    <= (others => '0');
		end if;
	

    end process; 

    sequ: process(Clk,rst) 
    begin
    if(rst = '1') then
			AlreadyInWord <= (others => '0');

    elsif(Clk'event AND Clk='1') then 		
		AlreadyInWord<=FinalWord;
		GoodWord <= GoodWord2;
	end if;
    end process sequ; 


end Behavioral;