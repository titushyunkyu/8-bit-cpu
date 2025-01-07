library ieee;
use ieee.std_logic_1164.all;

ENTITY instruction_sequencer IS 
    PORT
      (
        opcode : in std_logic_vector(2 downto 0);
        reset : in std_logic;
        clock : in std_logic;
        t0 : out std_logic;
        t1 : out std_logic;
        t2 : out std_logic;
        t3 : out std_logic;
        t4 : out std_logic;
        t5 : out std_logic;
        t6 : out std_logic;
        t7 : out std_logic;
        execute : out std_logic
    );
END instruction_sequencer;

architecture bdf_type of instruction_sequencer is

component d_ff
	port(
		reset : in std_logic;
		clock : in std_logic;
		d : in std_logic;
		q : out std_logic
		);
end component;

signal	t0_next : std_logic;
signal	t1_next : std_logic;
signal	t2_next : std_logic;
signal	o1_n : std_logic;
signal	o2_n : std_logic;
signal	t0_n : std_logic;
signal	t1_n : std_logic;
signal	t2_n : std_logic;
signal	o1 : std_logic;
signal	o2 : std_logic;
signal	t0_c : std_logic;
signal	t1_c : std_logic;
signal	t2_c : std_logic;


begin

-- current state logic
t0_ff : d_ff
	port map(
		reset => reset,
		clock => clock,
		d => t0_next,
		q => t0_c
		);
		
t1_ff : d_ff
	port map(
		reset => reset,
		clock => clock,
		d => t1_next,
		q => t1_c
		);
		
t2_ff : d_ff
	port map(
		reset => reset,
		clock => clock,
		d => t2_next,
		q => t2_c
		);

-- next-state logic
o1 <= opcode(1);
o2 <= opcode(2);
o1_n <= not(opcode(1));
o2_n <= not(opcode(2));
t0_n <= not(t0_c);
t1_n <= not(t1_c);
t2_n <= not(t2_c);

t0_next <= (o1_n and t0_n) or (o1 and t2_n and t0_n) or (o2_n and o1 and t2_c and t0_n);
t1_next <= (t1_c and t0_n) or (o1 and t1_n and t0_c) or (t2_n and t1_n and t0_c) or (o2 and t1_n and t0_c);
t2_next <= (t2_n and t1_c and t0_c) or (o2_n and o1 and t2_c and t1_n) or (t2_c and t1_c and t0_n) or (o1_n and t2_c and t0_n) 
or (o2 and o1_n and t2_c and t1_n);

-- output logic
t0 <= t2_n and t1_n and t0_n;
t1 <= t2_n and t1_n and t0_c;
t2 <= t2_n and t1_c and t0_n;
t3 <= t2_n and t1_c and t0_c;
t4 <= t2_c and t1_n and t0_n;
t5 <= t2_c and t1_n and t0_c;
t6 <= t2_c and t1_c and t0_n;
t7 <= t2_c and t1_c and t0_c;
execute <= t2_c;

end bdf_type;
