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
		disp: out std_logic_vector(6 downto 0);
		C_out: out std_logic_vector(3 downto 0);
	   Regist0 : out std_logic_vector(3 downto 0);
	   Regist1 : out std_logic_vector(3 downto 0);
	   Regist2 : out std_logic_vector(3 downto 0);
	   Regist3 : out std_logic_vector(3 downto 0);
	   Regist4 : out std_logic_vector(3 downto 0);
	   Regist5 : out std_logic_vector(3 downto 0);
	   Regist6 : out std_logic_vector(3 downto 0);
	   Regist7 : out std_logic_vector(3 downto 0)
	);
end sistema;

architecture comportamento of sistema is
	component latchD is
		port(
			clk: in std_logic;
			ld: in std_logic;
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
		  C_out: out std_logic_vector(3 downto 0)
		  );
   end component;
	component display is
		port(y: in std_logic_vector(3 downto 0); 
		dsp: out std_logic_vector(6 downto 0));
   end component;	
	
   signal load:std_logic_vector(7 downto 0);
	signal result0,result1,result2,result3,
	       result4,result5,result6,result7: std_logic_vector(3 downto 0);
	signal cout : std_logic_vector(3 downto 0);
	
   begin
		mux: muxW port map(key => keyW, S_out => load , W=>W);
		reg0: latchD port map(clk => clk, ld => load(0), d => ent, q => result0);
		reg1: latchD port map(clk => clk, ld => load(1), d => ent, q => result1);
		reg2: latchD port map(clk => clk, ld => load(2), d => ent, q => result2);
		reg3: latchD port map(clk => clk, ld => load(3), d => ent, q => result3);
		reg4: latchD port map(clk => clk, ld => load(4), d => ent, q => result4);
		reg5: latchD port map(clk => clk, ld => load(5), d => ent, q => result5);
		reg6: latchD port map(clk => clk, ld => load(6), d => ent, q => result6);
		reg7: latchD port map(clk => clk, ld => load(7), d => ent, q => result7);
		demux:demuxR port map(S_in0 => result0,S_in1 => result1,S_in2 => result2,S_in3 => result3,
									  S_in4 => result4,S_in5 => result5,S_in6 => result6,S_in7 => result7,
									  R => R, key => keyR, c_out => cout);
		show: display port map(y => cout, dsp => disp);
		
		C_out <= cout;		
		Regist0 <= result0;
		Regist1 <= result1;							  
		Regist2 <= result2;
		Regist3 <= result3;
		Regist4 <= result4;
		Regist5 <= result5;
		Regist6 <= result6;
		Regist7 <= result7;
	end comportamento;
	