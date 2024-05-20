--tipo A
-- Guilherme Lettmann e Leonardo Cisz
library IEEE; 
use IEEE.Std_Logic_1164.all; 

entity circuito_multi 
is port (SW: in std_logic_vector(3 downto 0);
			LEDR: out std_logic_vector(3 downto 0));
end circuito_multi; 
architecture circuito of circuito_multi is
begin
	LEDR(3) <= (not (SW(3)) and not (SW(2)) and SW(1) and SW(0)) or (SW(2) and SW(1) and not (SW(0))) or (SW(3) and not (SW(1)) and SW(0)) or (SW(3) and SW(2));
   LEDR(2)<= not(SW(0));
   LEDR(1)<= SW(3) or (SW(2) and SW(1));
   LEDR(0)<= (SW(2) and SW(0)) or (SW(1) and SW(0)) or (not(SW(3)) and not(SW(2)) and SW(1));
end circuito; 