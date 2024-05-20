library IEEE;
use IEEE.Std_Logic_1164.all;
entity modb is
port (B: in std_logic;
		C0: in std_logic;
		C1: in std_logic;
		S: out std_logic
		);
end modb;
architecture jesusnacruz of modb is
begin
S <= (not(C0) and B) or (not(B) and C1);
end jesusnacruz;