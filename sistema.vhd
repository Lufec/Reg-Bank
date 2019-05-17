library ieee;
use ieee.std_logic_1164.all;
entity sistema is
	port(
		clk: in std_logic;
		ent: in std_logic_vector(3 downto 0);
		keyW: in std_logic_vector (2 downto 0);
		keyR: in std_logic_vector (2 downto 0);
		W : in std_logic;
		R: in std_logic;
		reset: in std_logic;
		disp: out std_logic_vector(6 downto 0);
		C_out: out std_logic_vector(3 downto 0);
	   Regist0, Regist1, Regist2, Regist3,
		Regist4, Regist5, Regist6, Regist7: out std_logic_vector(3 downto 0);
		led_R: out std_logic_vector(7 downto 0);
		led_W: out std_logic_vector(7 downto 0)
	);
end sistema;

architecture comportamento of sistema is
	component latchD is
		port(
			clk: in std_logic;
			ld: in std_logic;
			reset: in std_logic;
			d: in std_logic_vector(3 downto 0);
			q: out std_logic_vector(3 downto 0)		
		);
	end component;
	component muxW is
		port(
		  W: in std_logic;
		  key: in std_logic_vector(2 downto 0);
		  S_out: out std_logic_vector(7 downto 0)
		  );
   end component;
	component demuxR is
		port(
		  S_in0,S_in1,S_in2,S_in3,
		  S_in4,S_in5,S_in6,S_in7: in std_logic_vector(3 downto 0);
		  R: in std_logic;
		  key: in std_logic_vector(2 downto 0);
		  led_out: out std_logic_vector (7 downto 0);
		  C_out: out std_logic_vector(3 downto 0)
		  );
   end component;
	component display is
		port(y: in std_logic_vector(3 downto 0); 
		     R: in std_logic; 
		     dsp: out std_logic_vector(6 downto 0));
   end component;	
	

	signal load:std_logic_vector(7 downto 0);
	signal result0,result1,result2,result3,
	       result4,result5,result6,result7: std_logic_vector(3 downto 0);
	signal cout : std_logic_vector(3 downto 0);
	
   begin
		mux: muxW port map(key => keyW, S_out => load , W=>W );
		reg0: latchD port map(clk => clk, ld => load(0), d => ent, q => result0, reset=> reset);
		reg1: latchD port map(clk => clk, ld => load(1), d => ent, q => result1, reset=> reset);
		reg2: latchD port map(clk => clk, ld => load(2), d => ent, q => result2, reset=> reset);
		reg3: latchD port map(clk => clk, ld => load(3), d => ent, q => result3, reset=> reset);
		reg4: latchD port map(clk => clk, ld => load(4), d => ent, q => result4, reset=> reset);
		reg5: latchD port map(clk => clk, ld => load(5), d => ent, q => result5, reset=> reset);
		reg6: latchD port map(clk => clk, ld => load(6), d => ent, q => result6, reset=> reset);
		reg7: latchD port map(clk => clk, ld => load(7), d => ent, q => result7, reset=> reset);
		demux:demuxR port map(S_in0 => result0,S_in1 => result1,S_in2 => result2,S_in3 => result3,
									 S_in4 => result4,S_in5 => result5,S_in6 => result6,S_in7 => result7,
									 led_out => led_R, R => R, key => keyR, c_out => cout);
		show: display port map(y => cout, R=>R, dsp => disp);
		C_out <= cout;
		led_W(0) <= load(0) and W;		
		led_W(1) <= load(1) and W;
		led_W(2) <= load(2) and W;
		led_W(3) <= load(3) and W;
		led_W(4) <= load(4) and W;
		led_W(5) <= load(5) and W;
		led_W(6) <= load(6) and W;
		led_W(7) <= load(7) and W;
		Regist0 <= result0;
		Regist1 <= result1;							  
		Regist2 <= result2;
		Regist3 <= result3;
		Regist4 <= result4;
		Regist5 <= result5;
		Regist6 <= result6;
		Regist7 <= result7;
	end comportamento;
	