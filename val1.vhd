library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity val1 is
 generic(
        n:integer:=8
    );
    port(
    NewWord         :   IN  STD_LOGIC_VECTOR(n-1 downto 0);	--cadena recien hecha
    AlreadyInWord   :   IN  STD_LOGIC_VECTOR(n-1 downto 0);	--cadena de comprobacion
    FinalWord       :   OUT STD_LOGIC_VECTOR(n-1 downto 0);	--cadena de comprobacion nueva 
    --Great           :   OUT STD_LOGIC;
    GoodWord        :   OUT STD_LOGIC_VECTOR(n-1 downto 0)	--palabra que saldra si pasa los filtros
    );
end val1;

architecture Behavioral of val1 is 
begin
process (NewWord,AlreadyInWord)
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

--process (GoodWord)
--begin
	--if ( GoodWord ="00000000") then
      --      Great<='0';
        --else
          --  Great<='1';
        --end if;
--end process;
end Behavioral;
    