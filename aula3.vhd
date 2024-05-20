library ieee;
use ieee.std_logic_1164.all;
entity aula3 is port (
A,B: in std_logic;
Sum,Cout: out std_logic );
end aula3;
architecture hadder of aula3 is
begin
Sum <= A xnor B;
Cout <= A and B;
end hadder;
