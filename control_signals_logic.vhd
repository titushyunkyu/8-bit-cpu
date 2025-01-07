LIBRARY IEEE ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity control_signals_logic is
  port (
    load : in std_logic;
    store : in std_logic;
    add : in std_logic;
    sub : in std_logic;
    inc : in std_logic;
    dec : in std_logic;
    bra : in std_logic;
    beq : in std_logic;
    t0 : in std_logic;
    t1 : in std_logic;
    t2 : in std_logic;
    t3 : in std_logic;
    t4 : in std_logic;
    t5 : in std_logic;
    t6 : in std_logic;
    t7 : in std_logic;
    Z : in std_logic;
    r : out std_logic; -- read signal
    w : out std_logic; -- write signal
    cmar : out std_logic;
    cmbr : out std_logic;
    embr : out std_logic;
    cir : out std_logic;
    eir : out std_logic;
    cpc : out std_logic;
    epc : out std_logic;
    cd0 : out std_logic;
    ed0 : out std_logic;
    calu : out std_logic;
    ealu : out std_logic;
    F0 : out std_logic;
    F1 : out std_logic
    );
  
end control_signals_logic;

architecture rtl of control_signals_logic is 

begin  -- rtl
	
		r<= (t1) or (load and t5) or (add and t5) or (sub and t5) or (inc and t5) or (dec and t5);
		w <= (store and t5) or (inc and t7) or (dec and t7);
		cmar <= (t0) or (load and t4) or (add and t4) or (store and t4) or (sub and t4) or (inc and t4) or (dec and t4);
		cmbr <= (add and t5) or (sub and t5) or (inc and t5) or (dec and t5);
		cpc <= (t3) or (bra and t4) or (beq and z and t4);
		cir <= (t1);
		cd0 <= (load and t5) or (add and t7) or (sub and t7);
		calu <= (t2) or (add and t6) or (sub and t6) or (inc and t6) or (dec and t6);
		embr <= (add and t6) or (sub and t6) or (inc and t6) or (dec and t6);
		epc <= (t0) or (t2);
		eir <= (t4) or (store and t4) or (add and t4) or (sub and t4) or (inc and t4) or (dec and t4) or (bra and t4) or (z and t4);
		ed0 <= (store and t5);
		ealu <= (t3) or (add and t7) or (sub and t7) or (dec and t7) or (inc and t7);
		f1 <= (t2) or (inc and t6) or (dec and t6);
		f0 <= (sub and t6) or (dec and t6);
  
end rtl;
