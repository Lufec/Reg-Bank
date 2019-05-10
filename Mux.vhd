library ieee;
use ieee.std_logic_1164.all;
entity muxW is
	port(key: in std_logic_vector(2 downto 0);
		  W: in std_logic;
		  S_out: out std_logic_vector(7 downto 0));
end muxW;

architecture choice of muxW is
begin 
	S_out(0)<=W and not key(2) and not key (1) and not key(0);
	S_out(1)<=W and not key(2) and not key (1) and key(0);
	S_out(2)<=W and not key(2) and key (1) and not key(0);
	S_out(3)<=W and not key(2) and key (1) and key(0);
	S_out(4)<=W and key(2) and not key (1) and not key(0);
	S_out(5)<=W and key(2) and not key (1) and key(0);
	S_out(6)<=W and key(2) and key (1) and not key(0);
	S_out(7)<=W and key(2) and key (1) and key(0);
end choice;