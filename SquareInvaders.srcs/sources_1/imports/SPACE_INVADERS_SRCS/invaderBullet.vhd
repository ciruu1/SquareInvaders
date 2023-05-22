-- Bala del invasor

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity invaderBullet is
  Port (clk, hide: in std_logic;
        xIn: in natural range 0 to 1280; 
        yIn: in natural range 0 to 1024;
        xOut: out natural range 0 to 1280;
        yOut: out natural range 0 to 1024 );
end invaderBullet;

architecture Behavioral of invaderBullet is

-- Coordenadas en la pantalla
signal x: natural range 0 to 1280;
signal y: natural range 0 to 1024;

begin

process 
begin
    -- Si la bala no está escondida por cada tick de reloj la bala va a ir bajando en la pantalla
    if(hide = '0'
    ) then
        if(rising_edge (clk)) then
            y <= y + 2;
        end if;
    -- Si está escondida actualizamos la posición de la bala a la posición del invasor
    else
        y <= yIn;
        x <= xIn;
    end if;
    
end process;

xOut <= x;
yOut <= y;


end Behavioral;