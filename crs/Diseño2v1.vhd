library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

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
	    Bool: out STD_LOGIC
	);
end component;

component Verificador1 is
	port(
		P 		: in 	STD_LOGIC_VECTOR(8 downto 0);
		Count 	: in 	STD_LOGIC_VECTOR(3 downto 0);
		Salida 	: out 	STD_LOGIC
	);
end component;

component Contador is
	generic(
		n : INTEGER := 4
	); 
	port(
		clk : IN STD_LOGIC;
		CE  : IN STD_LOGIC;
		clr : IN STD_LOGIC;
		Count : OUT STD_LOGIC_VECTOR(n-1 downto 0) --Indica el turno en que se detecto un sensor.
	);
end component;

component SIPO is
    generic(
        n:integer:=9
    );
    port(
    Bool: IN     STD_LOGIC; 
    Clk : IN     STD_LOGIC;
	CE  : IN     STD_LOGIC;
	Clr : IN     STD_LOGIC;
    P   : OUT    STD_LOGIC_VECTOR(n-1 downto 0)

);
end component;

--SIGNALS--

signal CE,bool,rst :STD_LOGIC;   
signal numero,valor,count: STD_LOGIC_VECTOR(3 downto 0); 
signal Verif,P : STD_LOGIC_VECTor(8 downto 0);

begin

--port map--

TimeBasis: 	BaseDeTiempo port map(NewWord=>sensores,CE=>CE);
TimeBasis2: BaseDeTiempo2 port map(CLK=>CLK,rst_in=>CE,rst_out=>rst);
BTN:     	bitsToNumbers port map(cadenaOriginalDeBits=>sensores,numero=>numero);
Comp:      	comparador port map(A=>valor,B=>numero,bool=>bool);
Cont:      	Contador port map(CLK=>CLK,CE=>CE,clr=>rst,count=>count);
Ro:        	ROM	port map (Count=>count,valor=>valor);
Verifica:  	Verificador1 port map (P=>P,count=>count,salida=>abre);
Sip:		SIPO port map(Bool=>bool,clk=>clk,CE=>CE,clr=>rst,P=>P);


end Behavioral;