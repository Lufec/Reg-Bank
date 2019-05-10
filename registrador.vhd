library ieee;
use ieee.std_logic_1164.all;
entity latchD is
    port(clk: in std_logic;
			 ld: in std_logic;
          d: in std_logic_vector (3 downto 0);
          q: out std_logic_vector(3 downto 0));
end latchD;

architecture reg of latchD is
    component regist is
        port(d,clk, ld: in std_logic;
              q: out std_logic);
    end component;
        begin
            gen: for i in 0 to 3 generate
                ut: regist port map (d => d(i) , q => q(i), clk =>clk , ld=>ld);
            end generate gen;
end reg;