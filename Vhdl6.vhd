library ieee;
use ieee.std_logic_1164.all;
entity display is
	port(y: in std_logic_vector(3 downto 0); 
		dsp: out std_logic_vector(6 downto 0));
end display;

architecture mostrar of display is
begin  
	dsp(0)<= ((not y(3) and not y(1)) and (y(2) xor y(0))) or ((y(3) and y(0)) and (y(2) xor y(1)));    
	dsp(1)<= (((not y(3) and y(2)) and (y(1) xor y(0))) or (y(3) and not y(2) and y(1) and y(0)) or (y(3) and y(2) and not y(1) and not y(0)) or (y(3) and y(2) and y(1)));
	dsp(2)<= ((not y(3) and not y(2) and y(1) and not y(0)) or (y(3) and y(2) and not y(1) and not y(0)) or (y(3) and y(2) and y(1)));
	dsp(3)<= ((not y(3) and not y(2) and not y(1) and y(0)) or (not y(3) and y(2) and not y(1) and not y(0)) or (not y(3) and y(2) and y(1) and y(0)) or (y(3) and not y(2) and y(1) and not y(0)) or (y(3) and y(2) and y(1) and y(0)));
	dsp(4)<= ((not y(3) and not y(2) and y(0)) or (not y(3) and y(2) and not y(1)) or (not y(3) and y(2) and y(1) and y(0)) or (y(3) and not y(2) and not y(1) and y(0)));
	dsp(5)<= ((not y(3) and not y(2) and not y(1) and y(0)) or (not y(3) and not y(2) and y(1)) or (not y(3) and y(2) and y(1) and y(0)) or (y(3) and y(2) and not y(1) and y(0)));
	dsp(6)<= ((not y(3) and not y(2) and not y(1)) or (not y(3) and y(2) and y(1) and y(0)) or (y(3) and y(2) and not y(1) and not y(0)));
end mostrar;