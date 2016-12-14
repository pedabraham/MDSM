library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity cadenaSelector is
  port (
    seleccion   :   in  std_logic_vector(1  downto 0) ;
    cadenaCC    :   in  std_logic_vector(35  downto 0) ;    
    cadenaF     :   out std_logic_vector(35 downto 0) 
  ) ;
end cadenaSelector ; 

architecture behavioral of cadenaSelector is

begin

seq : process( cadenaCC )
begin

    case seleccion is
    
        when "0" => cadenaF <= "000000001001100001110101001100100001";
        when others => cadenaF <=cadenaCC;
    
    end case ;
    
end process ; -- seq
    


end behavioral ;