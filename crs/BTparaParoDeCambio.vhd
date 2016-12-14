library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
---------------------------------------------------
entity BasedeTCambio is
	port(
		clk         : in    std_logic;
		rst_in      : in    std_logic;
        cambioOn    : in    std_logic;--señal que indica que el cambio se tiene que ejecutar
		Cambio  : out   std_logic -- señal que se va embiar para parar el cambio
	);
end BasedeTCambio;
---------------------------------------------------
architecture Behavioral of BasedeTCambio is
-------------------Signals-------------------------
	signal N_S : std_logic_vector(27 downto 0); --27 downto 0
	signal P_S : std_logic_vector(27 downto 0); --27 downto 0
-------------------Process-------------------------
begin
	comb : process(P_S)
	begin
        if(cambioOn='1')then
		if(P_S = "1000111100001101000110000000") then
		--3 segundos para dajar de grabar valores en la cola			
		--if(P_S = "0011") then
			N_S <= (others => '0');
		    Cambio <= '1';  
		else 
			N_S <= P_S + '1';
			Cambio <= '0';
		end if;
        end if;
        else 
        N_S <= (others => '0');
        P_S <= (others => '0');
        Cambio <= '0';

	end process comb; 	
	
	sequ : process(clk,rst_in,rst_in)
	begin
        if(cambioOn='1') then 
		if( rst_in = '1' ) then
			P_S <= (others => '0');
		elsif ( clk'event AND clk = '1') then
			P_S <= N_S;
		end if;
        end if;
        else 
        N_S <= (others => '0');
        P_S <= (others => '0');
        Cambio <= '0';
	end process sequ; 
end Behavioral;