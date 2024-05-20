library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all; -- Para poder usar o operador +

entity usertop is
port(SW:in std_logic_vector(17 downto 0);
     LEDR:out std_logic_vector(17 downto 0);
     HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0));
end usertop;

architecture circuito_exe2 of usertop is
signal Igual, Menos, Mais, Deslig: std_logic_vector (6 downto 0);
signal A, F, F1, F2, F3, F4: std_logic_vector (3 downto 0);
signal C: std_logic_vector (1 downto 0);

component mux4_1 is
port (F1,F2,F3,F4: in std_logic_vector(3 downto 0);
sel: in std_logic_vector(1 downto 0);
F: out std_logic_vector(3 downto 0)
);
end component;

component mux2_1 is
port (
F1: in std_logic_vector(6 downto 0);
F2: in std_logic_vector(6 downto 0);
sel: in std_logic;
F: out std_logic_vector(6 downto 0)
);
end component;

component decod_C2 is
port (G: in std_logic_vector(3 downto 0);
F: out std_logic_vector(6 downto 0)
);
end component;

component  decod is
port (
G: in std_logic_vector(1 downto 0);
F: out std_logic_vector(6 downto 0)

);
end component;

begin
Igual <= "0110111";
Menos <= "0111111";
Mais <= "0001111";
Deslig <= "1111111";
A <= SW(3 downto 0);
C <= SW(9 downto 8);

F1 <= A+"0100";
F2 <= A+"0101";
F3 <= A+"1110";
F4 <= A+"1111"; --circuito1

M4: mux4_1 port map (F1, F2, F3, F4, C, F);
M21: mux2_1 port map (Deslig, Menos, A(3), HEX6);
DC21: decod_C2 port map (A, HEX5);
M22: mux2_1 port map (Mais, Menos, C(1), HEX4);
DEC: decod port map (C, HEX3);
HEX2 <= Igual;
M23: mux2_1 port map (Deslig, Menos, F(3), HEX1);
DC22: decod_C2 port map (F, HEX0);


end circuito_exe2;