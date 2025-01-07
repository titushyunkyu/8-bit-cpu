Library ieee;
use ieee.std_logic_1164.all;

entity opcode_decoder is
	port
		( 
			execute: in std_logic;
			opcode: in std_logic_vector(2 downto 0);
			load: out std_logic;
			store: out std_logic;
			add: out std_logic;
			sub: out std_logic;
			inc: out std_logic;
			dec: out std_logic;
			bra: out std_logic;
			beq: out std_logic
			);
end opcode_decoder;

architecture bdf_type of opcode_decoder is

signal synthesized_wire_load : std_logic;
signal synthesized_wire_store : std_logic;
signal synthesized_wire_add : std_logic;
signal synthesized_wire_sub : std_logic;
signal synthesized_wire_inc : std_logic;
signal synthesized_wire_dec : std_logic;
signal synthesized_wire_bra : std_logic;
signal synthesized_wire_beq : std_logic;

begin 

synthesized_wire_load <= execute and not opcode(0) and not opcode(1) and not opcode(2);
synthesized_wire_store <= execute and opcode(0) and not opcode(1) and not opcode(2);
synthesized_wire_add <= execute and opcode(1) and not opcode(2) and not opcode(0);
synthesized_wire_sub <= execute and opcode(0) and opcode(1) and not opcode(2);
synthesized_wire_inc <= execute and opcode(2) and not opcode(1) and not opcode(0);
synthesized_wire_dec <= execute and opcode(2) and opcode(0) and not opcode(1);
synthesized_wire_bra <= execute and opcode(2) and opcode(1) and not opcode(0);
synthesized_wire_beq <= execute and opcode(2) and opcode(1) and opcode(0);


load <= synthesized_wire_load;
store <= synthesized_wire_store;
add <= synthesized_wire_add;
sub <= synthesized_wire_sub;
inc <= synthesized_wire_inc;
dec <= synthesized_wire_dec;
bra <= synthesized_wire_bra;
beq <= synthesized_wire_beq;

end bdf_type;
	
			