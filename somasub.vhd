library IEEE;
use IEEE.Std_Logic_1164.all;
entity somasub is
port (SW: in std_logic_vector(9 downto 0);
		LEDR: out std_logic_vector(9 downto 0)
);
end somasub;
architecture AAA of somasub is
signal S0,S1,S2,S3, C0, C1, C2, C3: std_logic;
component modb is
port (B: in std_logic;
		C0: in std_logic;
		C1: in std_logic;
		S: out std_logic
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
M0: modb port map (SW(4), SW(8), SW(9), S0);
FA0: fulladder port map(SW(0), S0, SW(8), LEDR(0), C0);
M1: modb port map (SW(5), SW(8), SW(9), S1);
FA1: fulladder port map(SW(1), S1, C0, LEDR(1), C1);
M2: modb port map (SW(6), SW(8), SW(9), S2);
FA2: fulladder port map(SW(2), S2, C1, LEDR(2), C2);
M3: modb port map (SW(7), SW(8), SW(9), S3);
FA3: fulladder port map(SW(3), S3, C2, LEDR(3), C3);
LEDR(9) <= C3 xor C2;

end AAA;