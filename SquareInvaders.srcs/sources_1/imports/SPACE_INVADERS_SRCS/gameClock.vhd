-- Divisor de frequencia
-- De este bloque salen 4 salidas que son los relojes de los demás bloques funcionales

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gameClock is
    Port (clk: in std_logic;
         clkShip: out std_logic;
         clkBullet: out std_logic;
         clkInvader: out std_logic;
         clkNumber: out std_logic );
end gameClock;

architecture Behavioral of gameClock is

    component JK is
        Port (ck : in std_logic;
             j_i : in std_logic;
             k_i : in std_logic;
             Cl : in std_logic;
             Pr : in std_logic;
             q_i : out std_logic;
             not_q_i : out std_logic);
    end component;
    signal q_is : std_logic_vector(26 downto 0);
    signal not_q_is : std_logic_vector(26 downto 0);
    signal rst : std_logic;
    signal rst_s : std_logic;

begin

    ff0 : JK
        port map(
            ck => clk,
            j_i => '1',
            k_i => '1',
            cl => rst,
            pr => '0',
            q_i => q_is(0),
            not_q_i => not_q_is(0)
        );

    ff: for i in 1 to 26 generate
        ff_i:JK port map(
                ck => not_q_is(i-1),
                j_i => '1',
                k_i => '1',
                cl => rst,
                pr => '0',
                q_i => q_is(i),
                not_q_i => not_q_is(i)

            );

    end generate;


    clkShip <= q_is(18);
    clkBullet <= q_is(18);
    clkInvader <= q_is(19);
    clkNumber <= q_is(18);

end Behavioral;
