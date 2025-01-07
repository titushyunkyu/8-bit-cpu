library ieee;
use ieee.std_logic_1164.all;

ENTITY parser is
	port
		(
			f1: in std_logic;
			p: in std_logic_vector(7 downto 0);
			q: in std_logic_vector(7 downto 0);
			a_out: out std_logic_vector(7 downto 0);
			b_out: out std_logic_vector(7 downto 0)
		);
end parser;

architecture rtl of parser is

	
begin
	
	a_out(0) <= ((not f1) and p(0)) or (f1 and q(0));
	a_out(1) <= ((not f1) and p(1)) or (f1 and q(1));
	a_out(2) <= ((not f1) and p(2)) or (f1 and q(2));
	a_out(3) <= ((not f1) and p(3)) or (f1 and q(3));
	a_out(4) <= ((not f1) and p(4)) or (f1 and q(4));
	a_out(5) <= ((not f1) and p(5)) or (f1 and q(5));
	a_out(6) <= ((not f1) and p(6)) or (f1 and q(6));
	a_out(7) <= ((not f1) and p(7)) or (f1 and q(7));
	
	b_out(0) <= ((not f1) and q(0)) or (f1 and '1');
	b_out(1) <= (not f1) and q(1);
	b_out(2) <= (not f1) and q(2);
	b_out(3) <= (not f1) and q(3);
	b_out(4) <= (not f1) and q(4);
	b_out(5) <= (not f1) and q(5);
	b_out(6) <= (not f1) and q(6);
	b_out(7) <= (not f1) and q(7);

end rtl;
	