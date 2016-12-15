library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comparador is 
    generic(
        n:integer:=4
    );
    port(
        A: in STD_LOGIC_VECTOR(n-1 downto 0);
        B: in STD_LOGIC_VECTOR(n-1 downto 0);
        CLK: in STD_LOGIC;
        Clr : in STD_LOGIC;
        Count : in STD_LOGIC_VECTOR(3 downto 0);
		--A_out : out std_logic_vector(n-1 downto 0);
		--B_out : out std_logic_vector(n-1 downto 0);
        Bool: out STD_LOGIC
    );
end comparador;

architecture Behavioral of comparador is
signal N_S : std_logic_vector(9 downto 0);
begin
    process (A,B,CLK,Clr,Count,N_S)
    begin
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
			
		  if(N_S(6 downto 0) = "1111111" )then
            Bool <= '1';
		  else
				Bool <= '0';
        end if;
		
		--A_out <= A;
		--B_out <= B;
        --else
          --  Bool <= '0';
      
    end process;
end Behavioral;
