library ieee;
use ieee.std_logic_1164.all;
entity display is
	port(y: in std_logic_vector(3 downto 0); 
		  R:in std_logic;
		  dsp: out std_logic_vector(6 downto 0));
end display;

architecture mostrar of display is
begin  
p_disp : process(y,R)
   begin
	case R is
		when '1' => case y is
			when "0000" => dsp <="1000000";
			when "0001" => dsp <="1111100";
			when "0010" => dsp <="0100010";
			when "0011" => dsp <="0110000";
			when "0100" => dsp <="0011001";
			when "0101" => dsp <="0010010";
			when "0110" => dsp <="0000010";
			when "0111" => dsp <="1111000";
			when "1000" => dsp <="0000000";
			when "1001" => dsp <="0010000";
			when "1010" => dsp <="0001000";
			when "1011" => dsp <="0000011";
			when "1100" => dsp <="1000110";
			when "1101" => dsp <="0100001";
			when "1110" => dsp <="0000110";
			when "1111" => dsp <="0001110";
		end case;
		when '0' => dsp <="0111111";
	end case;
	end process p_disp;
end mostrar;