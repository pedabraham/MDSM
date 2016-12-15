library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arithmetic.all;
use IEEE.std_logic_unsigned.all;

entity Elimina_Rebotes is
port(
	sensor_IN : in std_logic_vector(8 downto 0);
	rst : in std_logic;
	Sensor_OUT  : out std_logic_vector(8 downto 0)
);
end Elimina_Rebotes;

architecture simple of Elimina_Rebotes is
signal L : std_logic;
begin	 
	process(sensor_IN, L, rst)
	begin
		if(sensor_IN > '000000000')then
			L <= '1';
		else 
			L <= '0';
		end if;

		if( L= '1') then
			if(rst = '1')then
				Sensor_OUT <= '0';
			else
				Sensor_OUT <= sensor_IN;
			end if;
		end if;
	end process;
end simple;