
library ieee;
use ieee.std_logic_1164.all;
entity usertest is
end usertest;
architecture tb of usertest is
signal SA, SB, SSum, SCout : std_logic;
component aula3 is port (
A,B: in std_logic;
Sum,Cout: out std_logic );
end component;
begin
DUT : aula3 port map (A => SA,
B => SB,
Sum => SSum,
Cout => SCout);
process
constant period: time := 10 ns;
begin
SA <= '0'; SB <= '0';
wait for period;
assert ((SSum = '0') and (SCout = '0'))
report "Failed for 00." severity error;
SA <= '0'; SB <= '1';
wait for period;
assert ((SSum = '1') and (SCout = '0'))
report "Failed for 01." severity error;
SA <= '1'; SB <= '0';
wait for period;
assert ((SSum = '1') and (SCout = '0'))
report "Failed for 10." severity error;
SA <= '1'; SB <= '1';
wait for period;
assert ((SSum = '0') and (SCout = '1'))
report "Failed for 11." severity error;
wait;
end process;
end tb;