-- Registro de 10 bits con entrada reset
-- Se resetea al número: numberInit

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regF is
  Port (signal clk, rst: in std_logic;
        signal numberIn: in std_logic_vector(9 downto 0);
        signal numberInit: in std_logic_vector(9 downto 0);
        signal numberOut: out std_logic_vector(9 downto 0)
         );
end regF;

architecture Behavioral of regF is

signal number: std_logic_vector(9 downto 0);

begin

process 
begin 
    if(rising_edge(clk)) then
        if(rst = '1') then
            number <= numberInit;
        else
            number <= numberIn;
        end if;
    end if;

end process;

numberOut <= number;


end Behavioral;
