library IEEE;
use IEEE.STD_LOGIC_1164.ALL

entity Diseno is
	port(

    sensores: IN STD_LOGIC_VECTOR(8 downto 0);
    clk     : IN STD_LOGIC;
    abre    : OUT STD_LOGIC
    );
end Diseno;

architecture Behavioral of Diseno is

component BaseDeTiempo is
	generic(
		n : integer := 9
	);
	port(
		CLK : IN STD_LOGIC;
		NewWord : IN STD_LOGIC_VECTOR(n-1 downto 0);
		CE  : OUT STD_LOGIC
	);
end component;

component  bitsToNumbers is port(
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

component comparador 
is generic(
    n:integer:=4
);
 port(
    A: in STD_LOGIC_VECTOR(n-1 downto 0);
    B: in STD_LOGIC_VECTOR(n-1 downto 0);
    Bool: out STD_LOGIC
);
end component;

component Verificador1 is
	port(
		bool : in STD_LOGIC;
		Count : in STD_LOGIC;
		CLK : in STD_LOGIC;
		CE : in STD_LOGIC;
		Salida : out STD_LOGIC
	);
end component;

component Contador is
	generic(
		n : INTEGER := 4
	); 
	port(
		clk : IN STD_LOGIC;
		CE  : IN STD_LOGIC;
		Count : OUT STD_LOGIC_VECTOR(n-1 downto 0) --Indica el turno en que se detecto un sensor.
	);
end component;

--SIGNALS--

signal CE,bool :STD_LOGIC;   
signal numero,valor,count: STD_LOGIC_VECTOR(3 downto 0);


begin

--port map--

TimeBasis: BaseDeTiempo port map(CLK<=CLK,NewWord<=sensores,CE<=CE);
BTN:       bitsToNumbers port map(cadenaOriginalDeBits<=sensores,numero<=numero);
Comp:      comparador port map(A<=valor,B<=numero,bool<=bool);
Cont:      Contador port map(clk<=CLK,CE<=CE,)count<=count);
Ro:        ROM port map (Count<=count ,valor<=valor);  
Verifica:  Verificador1 port map (bool<=bool,count<=count,clk<=clk,CE<=CE,Salida<=abre);


end Behavioral;