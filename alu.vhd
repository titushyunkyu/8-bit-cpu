library ieee;
use ieee.std_logic_1164.all;

ENTITY alu is
	port
		(
			f0: in std_logic;
			f1: in std_logic;
			p: in std_logic_vector(7 downto 0);
			q: in std_logic_vector(7 downto 0);
			z: out std_logic;
			alu_out: out std_logic_vector(7 downto 0)
		);
end alu;

architecture rtl of alu is
	
	component adder_subtractor is
		port
			(
				cin: in std_logic;
				sel: in std_logic;
				a: in std_logic_vector(7 downto 0);
				b: in std_logic_vector(7 downto 0);
				cout: out std_logic;
				sum: out std_logic_vector(7 downto 0)
			);
	end component;
	
	component parser is
		port
		(
			f1: in std_logic;
			p: in std_logic_vector(7 downto 0);
			q: in std_logic_vector(7 downto 0);
			a_out: out std_logic_vector(7 downto 0);
			b_out: out std_logic_vector(7 downto 0)
			);
	end component;
	
	signal a_in: std_logic_vector(7 downto 0);
	signal b_in: std_logic_vector(7 downto 0);
	signal alu_out0: std_logic_vector(7 downto 0);
				
begin

	parser0 : parser
		port map
			(
				f1 => f1,
				p => p,
				q => q,
				a_out => a_in,
				b_out => b_in
			);
	
	adder_subtractor0 : adder_subtractor
		port map
			(
				cin => f0,
				sel => f0,
				a => a_in,
				b => b_in,
				sum => alu_out0
			);
	alu_out <= alu_out0;	
	z <= NOT (alu_out0(0) or alu_out0(1) or alu_out0(2) or alu_out0(3) or alu_out0(4) or alu_out0(5) or alu_out0(6) or alu_out0(7));
				
end rtl;
	