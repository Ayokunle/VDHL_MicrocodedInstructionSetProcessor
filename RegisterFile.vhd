--Ayokunle Adeosun 11485192
-- Module Name:    RegisterFile - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile is
    Port ( 	Mux_D : in std_ulogic_vector(15 downto 0); --Coming from Mux D
				des_A0 : in std_logic;
				des_A1 : in std_logic;
				des_A2 : in std_logic;
				des_A3 : in std_logic;
				Load_enable : in STD_LOGIC;
				SEL_muxA_0 : in STD_LOGIC;
				SEL_muxA_1 : in STD_LOGIC;
				SEL_muxA_2 : in STD_LOGIC;
				SEL_muxA_3 : in STD_LOGIC;
				SEL_muxB_0 : in STD_LOGIC;
				SEL_muxB_1 : in STD_LOGIC;
				SEL_muxB_2 : in STD_LOGIC;
				SEL_muxB_3 : in STD_LOGIC;
				Clk : in std_logic;
				A_data : out std_ulogic_vector(15 downto 0);
				B_data : out std_ulogic_vector(15 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

-- components
-- 16 bit Register for register file
COMPONENT Reg
PORT(
	D : IN std_ulogic_vector(15 downto 0);
	load : IN std_logic;
	Clk : IN std_logic;          
	RegOut : OUT std_ulogic_vector(15 downto 0)
	);
END COMPONENT;

-- 4 to 9 Decoder
COMPONENT Decoder
PORT(
in0 : IN std_logic;
in1 : IN std_logic;
in2 : IN std_logic;  
in3 : IN std_logic;   
out0 : OUT std_logic;     
out1 : OUT std_logic;
out2 : OUT std_logic;
out3 : OUT std_logic;
out4 : OUT std_logic;
out5 : OUT std_logic;
out6 : OUT std_logic;
out7 : OUT std_logic;
out8 : OUT std_logic
);
END COMPONENT;

-- 9 to 1 line multiplexer
COMPONENT Mux_9_1
PORT(
input0 : IN std_ulogic_vector(15 downto 0);
input1 : IN std_ulogic_vector(15 downto 0);
input2 : IN std_ulogic_vector(15 downto 0);
input3 : IN std_ulogic_vector(15 downto 0);
input4 : IN std_ulogic_vector(15 downto 0);
input5 : IN std_ulogic_vector(15 downto 0);
input6 : IN std_ulogic_vector(15 downto 0);
input7 : IN std_ulogic_vector(15 downto 0);
input8 : IN std_ulogic_vector(15 downto 0);
S0 : IN std_logic;
S1 : IN std_logic;          
S2 : IN std_logic;
S3 : IN std_logic;
output0 : OUT std_ulogic_vector(15 downto 0)
);
END COMPONENT;


-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, 
load_reg4, load_reg5, load_reg6, load_reg7, load_reg8 : std_logic;
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q,
data_src_mux_out, src_reg : std_ulogic_vector(15 downto 0); 
signal to_loader0, to_loader1, to_loader2, to_loader3, to_loader4, 
to_loader5, to_loader6, to_loader7, to_loader8  : std_logic;

begin

	-- Destination register decoder
	decoder_4to9: Decoder PORT MAP(
		in0 => des_A0,
		in1 => des_A1,
		in2 => des_A2,
		in3 => des_A3,
		out0 => to_loader0,
		out1 => to_loader1,
		out2 => to_loader2,
		out3 => to_loader3,
		out4 => to_loader4,
		out5 => to_loader5,
		out6 => to_loader6,
		out7 => to_loader7,
		out8 => to_loader8
	);

load_reg0 <= to_loader0 and load_enable;

	-- register 0
	reg00: reg PORT MAP(
		D => Mux_D,
		load => load_reg0,
		Clk => Clk,
		RegOut => reg0_q 
	);

load_reg1 <= to_loader1 and load_enable;
	-- register 1
	reg01: reg PORT MAP(
		D => Mux_D,
		load => load_reg1,
		Clk => Clk,
		RegOut => reg1_q 
	);
	
load_reg2 <= to_loader2 and load_enable;
	-- register 2
	reg02: reg PORT MAP(
		D => Mux_D,
		load => load_reg2,
		Clk => Clk,
		RegOut => reg2_q 
	);

load_reg3 <= to_loader3 and load_enable;
	-- register 3
	reg03: reg PORT MAP(
		D => Mux_D,
		load => load_reg3,
		Clk => Clk,
		RegOut => reg3_q 
	);

load_reg4 <= to_loader4 and load_enable;
	-- register 4
	reg04: reg PORT MAP(
		D => Mux_D,
		load => load_reg4,
		Clk => Clk,
		RegOut => reg4_q 
	);

load_reg5 <= to_loader5 and load_enable;
	-- register 5
	reg05: reg PORT MAP(
		D => Mux_D,
		load => load_reg5,
		Clk => Clk,
		RegOut => reg5_q 
	);

load_reg6 <= to_loader6 and load_enable;
	-- register 6
	reg06: reg PORT MAP(
		D => Mux_D,
		load => load_reg6,
		Clk => Clk,
		RegOut => reg6_q 
	);
			
load_reg7 <= to_loader7 and load_enable;		
	-- register 7
	reg07: reg PORT MAP(
		D => Mux_D,
		load => load_reg7,
		Clk => Clk,
		RegOut => reg7_q 
	);

load_reg8 <= to_loader8 and load_enable;		
	-- register 8
	reg08: reg PORT MAP(
		D => Mux_D,
		load => load_reg8,
		Clk => Clk,
		RegOut => reg8_q 
	);
	
	-- 9 to 1 source register multiplexer
	mux_A: Mux_9_1 PORT MAP(
		input0 => reg0_q,
		input1 => reg1_q,
		input2 => reg2_q,
		input3 => reg3_q,
		input4 => reg4_q,
		input5 => reg5_q,
		input6 => reg6_q,
		input7 => reg7_q,
		input8 => reg8_q,
		S0 => SEL_muxA_0,
		S1 => SEL_muxA_1,
		S2 => SEL_muxA_2,
		S3 => SEL_muxA_3,
		output0 => A_data 
	);
	
	-- 8 to 1 source register multiplexer
	mux_B: Mux_9_1 PORT MAP(
		input0 => reg0_q,
		input1 => reg1_q,
		input2 => reg2_q,
		input3 => reg3_q,
		input4 => reg4_q,
		input5 => reg5_q,
		input6 => reg6_q,
		input7 => reg7_q,
		input8 => reg8_q,
		S0 => SEL_muxB_0,
		S1 => SEL_muxB_1,
		S2 => SEL_muxB_2,
		S3 => SEL_muxB_3,
		output0 => B_data
	);
		
end Behavioral;