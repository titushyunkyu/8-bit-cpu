library ieee; 
use ieee.std_logic_1164.all;
library work;

entity datapath is
	port
	(
		reset: in std_logic;
		clock: in std_logic;
		cmar: in std_logic;
		embr: in std_logic;
		cmbr: in std_logic;
		eir: in std_logic;
		cir: in std_logic;
		epc: in std_logic;
		cpc: in std_logic;
		ed0: in std_logic;
		cd0: in std_logic;
		ealu: in std_logic;
		calu: in std_logic;
		t6: in std_logic;
		dec: in std_logic;
		inc: in std_logic;
		sub: in std_logic;
		add: in std_logic;
		f0: in std_logic;
		f1: in std_logic;
		data_bus: inout std_logic_vector(7 downto 0);
		z: out std_logic;
		address_bus: out std_logic_vector(4 downto 0);
		opcode: out std_logic_vector(2 downto 0)
	);
end datapath;

architecture bdf_type of datapath is

component alu
	port
	(
		f0: in std_logic;
		f1: in std_logic;
		p: in std_logic_vector(7 downto 0);
		q: in std_logic_vector(7 downto 0);
		z: out std_logic;
		alu_out: out std_logic_vector(7 downto 0)
	);
end component;

component tri_state_model
	port
		(
			enable: in std_logic;
			data_in: in std_logic_vector(7 downto 0);
			data_out: out  std_logic_vector(7 downto 0)
		);
end component;

component dreg_e
	port
		(
			reset: in std_logic;
			clock: in std_logic;
			enable: in std_logic;
			d: in std_logic_vector(7 downto 0);
			q: out std_logic_vector(7 downto 0)
		);
end component;

component z_ff
	port
		(
			reset: in std_logic;
			clock: in std_logic;
			add: in std_logic;
			sub: in std_logic;
			inc: in std_logic;
			dec: in std_logic;
			t6: in std_logic;
			z: in std_logic;
			z_out: out std_logic
		);
end component;

signal alu_out: std_logic_vector(7 downto 0);
signal d0_out: std_logic_vector(7 downto 0);
signal fpq_out: std_logic_vector(7 downto 0);
signal ir_out: std_logic_vector(7 downto 0);
signal mar_out: std_logic_vector(7 downto 0);
signal mbr_out: std_logic_vector(7 downto 0);
signal pc_in: std_logic_vector(7 downto 0);
signal pc_out: std_logic_vector(7 downto 0);
signal z_alu: std_logic;
signal synthesized_wire_0: std_logic_vector(7 downto 0);

begin 

alu_0 : alu
port map(f0 => f0,
         f1 => f1,
         p => d0_out,
         q => data_bus,
         z => z_alu,
         alu_out => synthesized_wire_0);

alu_buffer : tri_state_model
port map(enable => ealu,
         data_in => fpq_out,
         data_out => data_bus);

alu_register : dreg_e
port map(reset => reset,
         clock => clock,
         enable => calu,
         d => synthesized_wire_0,
         q => fpq_out);

d0 : dreg_e
port map(reset => reset,
         clock => clock,
         enable => cd0,
         d => data_bus,
         q => d0_out);

d0_buffer : tri_state_model
port map(enable => ed0,
         data_in => d0_out,
         data_out => data_bus);

pc_in(4 downto 0) <= data_bus(4 downto 0);
pc_in(7 downto 5) <= "000";

ir : dreg_e
port map(reset => reset,
         clock => clock,
         enable => cir,
         d => data_bus,
         q => ir_out);

ir_buffer : tri_state_model
port map(enable => eir,
         data_in => ir_out,
         data_out => data_bus);

mar : dreg_e
port map(reset => reset,
         clock => clock,
         enable => cmar,
         d => data_bus,
         q => mar_out);

mbr : dreg_e
port map(reset => reset,
         clock => clock,
         enable => cmbr,
         d => data_bus,
         q => mbr_out);

mbr_buffer : tri_state_model
port map(enable => embr,
         data_in => mbr_out,
         data_out => data_bus);

pc : dreg_e
port map(reset => reset,
         clock => clock,
         enable => cpc,
         d => pc_in,
         q => pc_out);

pc_buffer : tri_state_model
port map(enable => epc,
         data_in => pc_out,
         data_out => data_bus);

z_ff_0 : z_ff
port map(reset => reset,
         clock => clock,
         z => z_alu,
         add => add,
         sub => sub,
         inc => inc,
         dec => dec,
         t6 => t6,
         z_out => z);

address_bus(4 downto 0) <= mar_out(4 downto 0);
opcode(2 downto 0) <= ir_out(7 downto 5);

end bdf_type;
	