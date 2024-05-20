library ieee;
use ieee.std_logic_1164.all;
entity seila is
end seila;
architecture tb of seila is
signal SA, SB, SC, SY : std_logic;
component majority is port (
A,B,C: in std_logic;
Y: out std_logic );
end component;
begin
DUT : majority port map (A => SA, B => SB, C => SC, Y => SY);
SA <= '0', '1' after 20 ns, '0' after 40 ns;
SB <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
SC <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
end tb;