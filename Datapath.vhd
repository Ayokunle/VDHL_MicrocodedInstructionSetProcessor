--Ayokunle Adeosun 11485192
-- Module Name:    Datapath - Behavioral 
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Datapath is
    Port ( Load : in  STD_LOGIC;
           Mux_A_sel0 : in  STD_LOGIC;
			  Mux_A_sel1 : in  STD_LOGIC;
			  Mux_A_sel2 : in  STD_LOGIC;
			  Mux_A_sel3 : in  STD_LOGIC;

           Mux_B_sel0 : in  STD_LOGIC;
			  Mux_B_sel1 : in  STD_LOGIC;
			  Mux_B_sel2 : in  STD_LOGIC;
			  Mux_B_sel3 : in  STD_LOGIC;
			  --Decoder Select
           Deco_sel0 : in  STD_LOGIC;
			  Deco_sel1 : in  STD_LOGIC;
			  Deco_sel2 : in  STD_LOGIC;
			  Deco_sel3 : in  STD_LOGIC;
			  
           CarryIn : in  STD_LOGIC;
			  
           Shifter_sel : in  std_ulogic_vector(1 downto 0);
			  
           ALU_sel_0 : in  STD_LOGIC;
           ALU_sel_1 : in  STD_LOGIC;
           ALU_sel_2 : in  STD_LOGIC;
			  ALU_sel_3 : in  STD_LOGIC;
			  
           Data_input : in  std_ulogic_vector(15 downto 0);
           Mux_F_sel : in  STD_LOGIC;
           Mux_D_sel : in  STD_LOGIC;
			  MuxB_sel : in std_logic;
			  MuxM_sel : in std_logic;
			  
			  Clk : in std_logic;
			  Zero_fill : in std_ulogic_vector(15 downto 0);
			  PC : in std_ulogic_vector(15 downto 0);
			  C_flag : out std_logic;
			  N_flag : out std_logic;
			  V_flag : out std_logic;
			  Z_flag : out std_logic;
           Address_Out : out  std_ulogic_vector(15 downto 0); 
           Data_Out : out  std_ulogic_vector(15 downto 0)
			  );
end Datapath;

architecture Behavioral of Datapath is

COMPONENT RegisterFile
PORT (Mux_D : in std_ulogic_vector(15 downto 0); --Coming from Mux D
		des_A0 : in std_logic; -- decoder select
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
		B_data : out std_ulogic_vector(15 downto 0)
		);
END COMPONENT;

COMPONENT FuctionUnit
PORT (Mux_B_in : in  std_ulogic_vector(15 downto 0);
      FU_A_in : in  std_ulogic_vector(15 downto 0);
		C_in : in std_logic;
		sel0 : in  STD_LOGIC;
		sel1 : in  STD_LOGIC;
		sel2 : in  STD_LOGIC;
		sel3 : in STD_LOGIC;
		sel4 : in std_ulogic_vector(1 downto 0);
		C_out : out  STD_LOGIC;
		N_out : out  STD_LOGIC;
		Z_out : out  STD_LOGIC;
		V_out : out  STD_LOGIC;
		Mux_F_out : out  std_ulogic_vector(15 downto 0)
		);
END COMPONENT;
	
COMPONENT Mux_D
PORT (Data_in : in std_ulogic_vector(15 downto 0);
      FU_in : in  std_ulogic_vector(15 downto 0);
      M_out : out  std_ulogic_vector(15 downto 0);
      MD_sel : in  STD_LOGIC
	   );
END COMPONENT;
		
COMPONENT Mux_B
PORT ( MB_in0 : in  std_ulogic_vector(15 downto 0);
       MB_in1 : in  std_ulogic_vector(15 downto 0);
       MB_sel : in  STD_LOGIC;
       MB_out : out  std_ulogic_vector(15 downto 0)
		 );
END COMPONENT;

signal muxD_to_regf, regf_to_muxB, muxB_to_FU,
RegF_to_FU, FU_to_MuxD, FU_to_MuxM : std_ulogic_vector(15 downto 0);
begin


	RegisterFile_comp : RegisterFile PORT MAP(
			Mux_D => muxD_to_regf, 
			des_A0 => Deco_sel0,
			des_A1 => Deco_sel1,
			des_A2 => Deco_sel2,
			des_A3 => Deco_sel3,
			Load_enable => Load,
			SEL_muxA_0 => Mux_A_sel0,
			SEL_muxA_1 => Mux_A_sel1,
			SEL_muxA_2 => Mux_A_sel2,
			SEL_muxA_3 => Mux_A_sel3,
			SEL_muxB_0 => Mux_B_sel0,
			SEL_muxB_1 => Mux_B_sel1,
			SEL_muxB_2 => Mux_B_sel2,
			SEL_muxB_3 => Mux_B_sel3,
			Clk => Clk,
			A_data => RegF_to_FU,
			B_data => regf_to_muxB
			);
			
	FuctionUnit_comp : FuctionUnit PORT MAP(
		Mux_B_in => muxB_to_FU,
      FU_A_in => RegF_to_FU,
		C_in => CarryIn,
		sel0 => ALU_sel_0,
		sel1 => ALU_sel_1,
		sel2 => ALU_sel_2,
		sel3 => ALU_sel_3,
		sel4 => Shifter_sel,
		C_out => C_flag,
		N_out => N_flag,
		Z_out => Z_flag,
		V_out => V_flag,
		Mux_F_out => FU_to_MuxD		);
		
		Mux_B_comp : Mux_B PORT MAP (
			MB_in0 => regf_to_muxB,
			MB_in1 => Zero_fill,
			MB_sel => MuxB_sel,
			MB_out => muxB_to_FU
		);
		
		Mux_D_comp : Mux_D PORT MAP(
			Data_in => Data_input,
			FU_in => FU_to_MuxD,
			M_out => muxD_to_regf,
			MD_sel => Mux_D_sel
		);
		
		Mux_M_comp : Mux_B PORT MAP (
			MB_in0 => FU_to_MuxM,
			MB_in1 => PC,
			MB_sel => MuxM_sel,
			MB_out => Address_out
			);

end Behavioral;

