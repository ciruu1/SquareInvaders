library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 use ieee.math_real.all;

entity invader is
  Port (clk, rst: in std_logic;
        xIn: in natural range 0 to 1280; 
        yIn: in natural range 0 to 1024;
        xOut: out natural range 0 to 1280;
        yOut: out natural range 0 to 1024;
        inverse: in std_logic
        );
end invader;

architecture Behavioral of invader is

signal x: natural range 0 to 1280;
signal y: natural range 0 to 1024;
signal stepInt: std_logic := '0';

begin

CLOCK: process (clk)
begin
    -- Reseteamos la posición del invasor
    if (rst = '1') then
        x <= xIn;
        y <= yIn;
    else
        if(rising_edge (clk)) then
            -- Movimiento a la izquierda de la pantalla
            if (inverse = '1') then
                x <= x - 1;
            -- Movimiento a la derecha de la pantalla
            else
                x <= x + 1;
            end if;
            -- Si algún invasor ha tocado la parte derecha de la pantalla se mueve hacia abajo y se invierte la 
            -- variable step para realizar el movimiento al otro lado cuando toque la pantalla de nuevo
            if(inverse = '1' and stepInt = '0') then
                stepInt <= '1';
                y <= y + 30;
            elsif(inverse = '0' and stepInt = '1') then
                stepInt <= '0';
                y <= y + 30;
            end if;
            
        end if;
    end if;
        

end process;

xOut <= x;
yOut <= y;

end Behavioral;
