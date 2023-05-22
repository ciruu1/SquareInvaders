-- Bala de la nave

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bullet is
  Port (clk, hide--, collision
        : in std_logic;
        xIn: in natural range 0 to 1280; 
        yIn: in natural range 0 to 1024;
        xOut: out natural range 0 to 1280;
        yOut: out natural range 0 to 1024 );
end bullet;

  architecture Behavioral of bullet is

-- Coordenadas en la pantalla
signal x: natural range 0 to 1280;
signal y: natural range 0 to 1024;

begin

process 
begin
    -- Si la bala NO está escondida entonces por cada tick hacemos que vaya subiendo en la pantalla
    if(hide = '0'
    ) then
        if(rising_edge (clk)) then
            y <= y - 2;
        end if;
    else
    -- Si la bala está escondida actualizamos su posición a la de la nave, para que cuando dispare lo haga desde la posición de la nave
        y <= yIn;
        x <= xIn;
    end if;
    
end process;

xOut <= x;
yOut <= y;


end Behavioral;
