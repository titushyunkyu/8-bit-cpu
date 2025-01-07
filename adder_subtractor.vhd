LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;

ENTITY adder_subtractor is
	port
		(
			cin: in std_logic;
			sel: in std_logic;
			a: in std_logic_vector(7 downto 0);
			b: in std_logic_vector(7 downto 0);
			cout: out std_logic;
			sum: out std_logic_vector(7 downto 0)
		);
end adder_subtractor;

architecture rtl of adder_subtractor is
	
	component fulladder is 
		port 
			(
				A	: 	IN STD_LOGIC;
				B	:	IN STD_LOGIC;
				CIN:	IN STD_LOGIC;
				S	:	OUT STD_LOGIC;
				Cout	:	OUT STD_LOGIC
			);
	end component;
	
	signal b_0: std_logic_vector(7 downto 0);
	signal c_in: std_logic_vector(7 downto 0);
	signal c_out: std_logic_vector(7 downto 0);
	
begin
	
	b_0 <= b xor (sel & sel & sel & sel & sel & sel & sel & sel);
	
	adder0 : fulladder
		port map
			(
				A => a(0),
				B => b_0(0),
				CIN => sel,
				S => sum(0),
				Cout => c_out(0)
			);
	
	adder1 : fulladder
		port map
			(
				A => a(1),
				B => b_0(1),
				CIN => c_out(0),
				S => sum(1),
				Cout => c_out(1)
			);
			
	adder2 : fulladder
		port map
			(
				A => a(2),
				B => b_0(2),
				CIN => c_out(1),
				S => sum(2),
				Cout => c_out(2)
			);
			
	adder3 : fulladder
		port map
			(
				A => a(3),
				B => b_0(3),
				CIN => c_out(2),
				S => sum(3),
				Cout => c_out(3)
			);
			
	adder4 : fulladder
		port map
			(
				A => a(4),
				B => b_0(4),
				CIN => c_out(3),
				S => sum(4),
				Cout => c_out(4)
			);
			
	adder5 : fulladder
		port map
			(
				A => a(5),
				B => b_0(5),
				CIN => c_out(4),
				S => sum(5),
				Cout => c_out(5)
			);
			
	adder6 : fulladder
		port map
			(
				A => a(6),
				B => b_0(6),
				CIN => c_out(5),
				S => sum(6),
				Cout => c_out(6)
			);
			
	adder7 : fulladder
		port map
			(
				A => a(7),
				B => b_0(7),
				CIN => c_out(6),
				S => sum(7),
				Cout => cout
			);
			
end rtl;