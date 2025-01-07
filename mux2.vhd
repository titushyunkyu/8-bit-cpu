LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux2 is
	port (
		in_1 : in std_logic;
		in_0 : in std_logic;
		sel : in std_logic;
		result : out std_logic
		);
end mux2;

ARCHITECTURE rt1 of mux2 IS

begin
	
	result <= (sel and in_1) or (not(sel) and in_0);

end rt1;
