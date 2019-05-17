library ieee;
use ieee.std_logic_1164.all;
entity regist is
    port(clk: in std_logic;
	       ld: in std_logic;
			 reset: in std_logic;
          d: in std_logic;
          q: out std_logic);
end regist;

architecture ffd of regist is
    begin
    process (clk)
        begin
        if clk'event and clk='1' and ld='1' then
            q<=d;
        end if;
		  if clk'event and clk='1' and reset='1' then
				q<='0';
		  end if;
    end process;
end ffd;