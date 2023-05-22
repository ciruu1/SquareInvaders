library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ship is
  Port ( mvR, mvL, rst, clk: in std_logic ;
         x: out natural range 0 to 1280;
         y: out natural range 0 to 1024);
end ship;

architecture Behavioral of ship is

signal xIn: natural range 0 to 1280 := 640;
signal yIn : natural range 0 to 1024 := 950;

constant centerX: natural := 640;
constant centerY: natural := 512;

begin

X <= xIn;
Y <= yIn;

process(mvR, mvL, rst, clk)
begin 
    -- Reset
    if (rst = '1') then
        xIn <= centerX - 25;
        yIn <= 950;
    elsif(rising_edge(clk)) then
        -- Right movement
        if(mvR = '1' and xIn < (1280 - 50)) then
            xIn <= xIn + 1;
        -- Left movement
        elsif(mvL = '1' and xIn > 0) then
            xIn <= xIn - 1;
        end if;
    end if;
    
        
end process;

end Behavioral;
