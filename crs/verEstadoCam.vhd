library ieee ;
    use ieee.std_logic_1164.all ;
    

entity verEstadoCam is
  port (
    bool    :   in  std_logic;
    entraC  :   in  std_logic;
    salidaC :   out std_logic;
    rst     :   out std_logic;
    abre    :   out std_logic
  ) ;
end verEstadoCam ; 

architecture behavioral of verEstadoCam is

begin
    if (bool='1') then
        if (entraC='0') then
        salidaC <= '0';
        abre <= '1';
        rst <= '0';

        else
        salidaC <= '1';
        abre <= '0';
        rst <= '1';
        end if ; 
    else
        salidaC <= '0';
        abre <= '0';
        rst <='0';
           
    end if ;


    

end behavioral ;