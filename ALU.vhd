--Ayokunle Adeosun 11485192
-- Module Name:    ALU - Behavioral 
---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( Carry_in : in  STD_LOGIC;
           A : in  std_logic_vector(15 downto 0);
           B : in  std_logic_vector(15 downto 0);
           sel_0 : in  STD_LOGIC;
           sel_1 : in  STD_LOGIC;
           sel_2 : in  STD_LOGIC;
			  Carry_out : out  STD_LOGIC;
           G_out : out  std_logic_vector(15 downto 0));
end ALU;

architecture Behavioral of ALU is

-- LogicCircuit
COMPONENT LogicCircuit
PORT(	a : in  std_logic_vector(15 downto 0);
      b : in  std_logic_vector(15 downto 0);
      sel0 : in  STD_LOGIC;
      sel1 : in  STD_LOGIC;
      G_Logic_out : out  std_logic_vector(15 downto 0));
END COMPONENT;

-- CarryRippleAdder
COMPONENT CarryRippleAdder
PORT(	CR_in : in  STD_LOGIC;
      input_A : in  std_logic_vector(15 downto 0);
      input_B : in  std_logic_vector(15 downto 0);
		Sum_out : out std_logic_vector(15 downto 0);
		S0, S1 : in std_logic;
      CR_out : out  std_logic);
END COMPONENT;

-- Mux2to1
COMPONENT Mux2to1
PORT( From_adder : in  std_logic_vector(15 downto 0);
	  From_logic : in  std_logic_vector(15 downto 0);
     G_mux_out : out  std_logic_vector(15 downto 0);
     Sel_mux : in  STD_LOGIC);
END COMPONENT;

signal sum_to_mux : std_logic_vector(15 downto 0);
signal G_logic_out_to_mux : std_logic_vector(15 downto 0);

begin
-- CarryRippleAdder
	CRA: CarryRippleAdder PORT MAP(
			  CR_in => Carry_in,
			  input_A => A,
           input_B => B,
			  S0 => sel_0,
			  S1 => sel_1,
           CR_out => Carry_out,
			  Sum_out => sum_to_mux
	);

-- LogicCircuit
	LC: LogicCircuit PORT MAP(	
			  a => A,
           b => B,
           sel0 => sel_0,
           sel1 => sel_1,
           G_Logic_out => G_logic_out_to_mux
);

--Mux2to1
	Mux2_1: Mux2to1 PORT MAP(
		sel_mux => sel_2,
		G_mux_out => G_out,
		From_logic => G_logic_out_to_mux,
		From_adder => sum_to_mux
		);
		


end Behavioral;

