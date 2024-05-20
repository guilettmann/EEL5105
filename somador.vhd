library IEEE;
use IEEE.Std_Logic_1164.all;
entity somador is
port (SW: in std_logic_vector(7 downto 0);
		LEDR: out std_logic_vector(4 downto 0)
		);
end somador;
architecture soma4 of somador is
signal C0,C1,C2: std_logic;
component halfadder is
port (A: in std_logic;
		B: in std_logic;
		Sum: out std_logic;
		Cout: out std_logic
		);
end component;
component fulladder is
port (A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		Sum: out std_logic;
		Cout: out std_logic
		);
end component;
begin
HA: halfadder port map (SW(0), SW(4), LEDR(0), C0);
FA1: fulladder port map(SW(1), SW(5), C0, LEDR(1), C1);
FA2: fulladder port map(SW(2), SW(6), C1, LEDR(2), C2);
FA3: fulladder port map(SW(3), SW(7), C2, LEDR(3), LEDR(4));
end soma4;