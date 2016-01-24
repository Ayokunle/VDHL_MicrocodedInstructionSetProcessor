--Ayokunle Adeosun 11485192
-- Module Name:    FuctionUnit - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FuctionUnit is
    Port ( Mux_B_in : in  std_ulogic_vector(15 downto 0); --B
           FU_A_in : in  std_ulogic_vector(15 downto 0); --A
			  C_in : in STD_LOGIC;
			  sel0 : in  STD_LOGIC;
			  sel1 : in  STD_LOGIC;
			  sel2 : in  STD_LOGIC;
			  sel3 : in STD_LOGIC;
			  sel4 : in std_ulogic_vector(1 downto 0);
			  C_out : out  STD_LOGIC;
			  N_out : out  STD_LOGIC;
			  Z_out : out  STD_LOGIC;
			  V_out : out  STD_LOGIC;
           Mux_F_out : out  std_ulogic_vector(15 downto 0));
end FuctionUnit;

architecture Behavioral of FuctionUnit is

COMPONENT ALU
PORT ( Carry_in : in  STD_LOGIC;
		A : in  std_ulogic_vector(15 downto 0);
		B : in  std_ulogic_vector(15 downto 0);
      sel_0 : in  STD_LOGIC;
      sel_1 : in  STD_LOGIC;
      sel_2 : in  STD_LOGIC;
      Carry_out : out  STD_LOGIC;
      G_out : out  std_ulogic_vector(15 downto 0));
end COMPONENT;

COMPONENT Shifter
PORT ( Binter : in std_ulogic_vector(15 downto 0);
	S : in std_ulogic_vector(1 downto 0);
	InRight : in std_logic;
	InLeft : in std_logic;
	Shift_Output : out std_ulogic_vector(15 downto 0)
		 );
end COMPONENT;

COMPONENT Mux_F
PORT ( MF_in0 : in  std_ulogic_vector(15 downto 0);
       MF_in1 : in  std_ulogic_vector(15 downto 0);
       MF_sel : in  STD_LOGIC;
       MF_out : out  std_ulogic_vector(15 downto 0));
end COMPONENT;

signal iR, iL :  STD_LOGIC;
signal alu_to_mux, MF_input : std_ulogic_vector(15 downto 0);
begin

	--ALU
	ALU_comp: ALU PORT MAP(
		Carry_in => C_in,
		A => FU_A_in ,
		B => Mux_B_in,
      sel_0 => sel0,
      sel_1 => sel1,
      sel_2 => sel2,
      Carry_out => C_out,
		G_out => alu_to_mux
		);
		
--Z flag
Z_out <= '1' when (alu_to_mux = "0000000000000000") else 
			'0';
--N flag
N_out <= '1' when (alu_to_mux(15) = '1') else
			'0';
--V flag		
V_out <= '1' when (FU_A_in(15) = '1') and (Mux_B_in(15) = '1') and (alu_to_mux(15) = '0') else
         '0';
--V flag		
V_out <= '1' when (FU_A_in(15) = '0') and (Mux_B_in(15) = '0') and (alu_to_mux(15) = '1') else
         '0';

iR <= '0';
iL <= '0';
--Shifter
	Shifter_comp: Shifter PORT MAP(
		Binter => Mux_B_in,
		S =>	sel4,
		InRight => iR,
		InLeft => iL,
		Shift_Output => MF_input
		);
	
	--Mux_F
	Mux_F_comp: Mux_F PORT MAP(
		MF_in0 => alu_to_mux,
		MF_in1 => MF_input,
		MF_sel => sel3,
		MF_out => Mux_F_out
	);


	
end Behavioral;

