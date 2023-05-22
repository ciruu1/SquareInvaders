library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity JK is
  Port (ck : in std_logic;
        j_i : in std_logic;
        k_i : in std_logic;
        Cl : in std_logic;
        Pr : in std_logic;
        q_i : out std_logic;
        not_q_i : out std_logic);
        
end JK;

architecture FlipFlop of JK is

signal q : std_logic;
begin

  process(ck,Pr, Cl)
    begin
        if(Cl = '1')then
            q <= '0';
         elsif (Pr = '1')then
             q <= '1';
         elsif (ck 'event and ck ='1') then
               if(j_i = '0' and k_i ='1')then
                    q <= '0';
               elsif(j_i='1'and k_i = '0')then
                q <= '1';
               elsif(j_i = '1' and k_i = '1')then
                q <= not q;
               end if;
         end if;   
  end process;
  
 q_i <= q;
 not_q_i <= not q; 

end FlipFlop;

