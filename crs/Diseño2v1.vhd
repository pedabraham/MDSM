library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Diseno is
	port(
	    sensores	: IN STD_LOGIC_VECTOR(8 downto 0);
	    clk     	: IN STD_LOGIC;
		resetAbsoluto: IN STD_LOGIC; 
	    abre    	: OUT STD_LOGIC
    );
end Diseno;

architecture Behavioral of Diseno is

component BaseDeTiempo is
	generic(
		n : integer := 9
	);
	port(
		NewWord : IN STD_LOGIC_VECTOR(n-1 downto 0);
		CE  : OUT STD_LOGIC
	);
end component;

component BasedeTiempo2 is
	port(
		clk : in std_logic;
		rst_in : in std_logic;
		rst_out : out std_logic
	);
end component;

component  bitsToNumbers is 
	port(
    	cadenaOriginalDeBits:   IN   STD_LOGIC_VECTOR(8 downto 0);
   		numero              :   OUT  STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

component ROM is 
	port(
		Count : in STD_LOGIC_VECTOR(3 downto 0);
		Valor : out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

component comparador is 
	generic(
	    n:integer:=4
	);
	 port(
	    A: in STD_LOGIC_VECTOR(n-1 downto 0);
        B: in STD_LOGIC_VECTOR(n-1 downto 0);
        CLK: in STD_LOGIC;
        Clr : in STD_LOGIC;
        Count : in STD_LOGIC_VECTOR(3 downto 0);
        Bool: out STD_LOGIC
	);
end component;

--component Verificador1 is
--	port(
--		bool : in STD_LOGIC;
--		Count : in STD_LOGIC_VECTOR(3 downto 0);
--		CLK : in STD_LOGIC;
--		Clr : in STD_LOGIC;
--		Salida : out STD_LOGIC
--	);
--end component;

component Contador is
	generic(
		n : INTEGER := 4
	); 
	port(
		clk : IN STD_LOGIC;
		clr : IN STD_LOGIC;
		Count : OUT STD_LOGIC_VECTOR(n-1 downto 0) --Indica el turno en que se detecto un sensor.
	);
end component;

component val2 is
 generic(
        n:integer:=9
    );
    port(
    NewWord         :   IN  STD_LOGIC_VECTOR(n-1 downto 0);	--cadena recien hecha
    Clk             :   IN  STD_LOGIC;
	rst				:	IN  STD_LOGIC;
    GoodWord        :   OUT STD_LOGIC_VECTOR(n-1 downto 0)	--palabra que saldra si pasa los filtros
    );
end component;

--SIGNALS--

signal CE,CE2,rst,rstComp,rstTB2 :	STD_LOGIC;   
signal numero,valor,count: 	STD_LOGIC_VECTOR(3 downto 0); 
signal GoodWord:			STD_LOGIC_VECTOR(8 downto 0);

begin 
	
	
	--port map--
		TimeBasis: 	BaseDeTiempo port map(NewWord=>sensores,CE=>CE2);--genera el clk para el val
		TimeBasis2: BaseDeTiempo2 port map(CLK=>CLK,rst_in=>rstTB2,rst_out=>rstComp);
		BTN:     	bitsToNumbers port map(cadenaOriginalDeBits=>GoodWord,numero=>numero);
		Comp:      	comparador port map(A=>valor,B=>numero,CLK=>CE,Clr=>rst,Count=>Count,Bool=>abre);
		Cont:     	Contador port map(CLK=>CE,clr=>rst,count=>count);
		Ro:       	ROM	port map (Count=>count,valor=>valor);
		Val:		val2 port map(NewWord=>sensores,clk=>CE2,rst=>rst,GoodWord=>GoodWord);--genera la palabra que el timeBasis va a procesar
		TimeBasis12:BaseDeTiempo port map(NewWord=>GoodWord,CE=>CE);--generea el clk del sistema
-- En las prubas con botones se encontraron pulsos inesperados y se espera que el val solucione estos problemas

comb : process( resetAbsoluto,rstComp,CE2)
begin

	if (ResetAbsoluto='1') then
		rst <= ResetAbsoluto;
		rstTB2 <= ResetAbsoluto;
	else
		rst <= rstComp;	
		rstTB2 <= CE2;
																										   
	end if ;
	
end process ; -- comb

--Verifica:  Verificador1 port map (bool=>bool,count=>count,CLK=>CE,clr=>rst,Salida=>abre);


--CE1 <= '0' when RTS = '0' else CE when rising_edge(CLK);

end Behavioral;