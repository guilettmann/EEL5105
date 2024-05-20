library IEEE;
use IEEE.Std_Logic_1164.all;
entity fulladder is
port (A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		Sum: out std_logic;
		Cout: out std_logic
		);
end fulladder;
architecture fadder of fulladder is
begin
Sum <= (A xor B) xor Cin;
Cout <= ((A xor B) and Cin) or (A and B);
end fadder;