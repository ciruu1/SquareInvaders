-- Generador de números aleatorios
-- Lagged Fibonacci Generator

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity LFG is
  Port (clk: in std_logic;
        number: out integer range 0 to 1023);
end LFG;

architecture Behavioral of LFG is

type regArray is array (9 downto 0) of std_logic_vector (9 downto 0);
signal registers: regArray;
signal initRegisters: regArray;

signal clkOut: std_logic;

begin

    initRegisters(0) <= "0110011010";
    initRegisters(1) <= "0101011101";
    initRegisters(2) <= "1110111011";
    initRegisters(3) <= "0110001000";
    initRegisters(4) <= "1000101001";
    initRegisters(5) <= "0010001010";
    initRegisters(6) <= "1101110100";
    initRegisters(7) <= "1000100010";
    initRegisters(8) <= "0100010011";
    initRegisters(9) <= "1001110100";
    
    -- Usa registros para guardar los datos y por cada tick de reloj genera un nuevo número utilizando la opeación lógica XOR
    REG0: entity work.regF  
            port map(
                clk => clkOut,
                rst => '0',
                numberIn => registers(4) xor registers(7),
                numberOut => registers(0),
                numberInit => initRegisters(0)
            );

    REGS: for i in 1 to 9 generate
        REG: entity work.regF  
            port map(
                clk => clkOut,
                rst => '0',
                numberIn => registers(i - 1),
                numberOut => registers(i),
                numberInit => initRegisters(i)
            );
    end generate;
    
    number <= to_integer(unsigned(registers(9)));

end Behavioral;
