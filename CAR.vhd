
-- Module Name:    CAR - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAR is
    Port ( CAR_in : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Load : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           CAR_out : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end CAR;

architecture Behavioral of CAR is

-- components
-- 8 bit Register for register file
COMPONENT Reg
PORT(
	D : IN std_logic_vector(7 downto 0);
	load : IN std_logic;
	Clk : IN std_logic;          
	RegOut : OUT std_logic_vector(7 downto 0)
	);
END COMPONENT;

--Adder
COMPONENT Adder_8bit
PORT( A_in : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      B_in : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      Carry_in : in  STD_LOGIC;
		Carry_out : out STD_LOGIC;
      Adder_out : out  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END COMPONENT;

--Mux
COMPONENT Mux_inCAR
PORT( in0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
		in1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
		s0 : STD_LOGIC;
		out0 : out  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END COMPONENT;

signal d_mux, adder_mux, B, reg_Adder : std_logic_vector(7 downto 0);
signal Carry : std_logic;
begin

	-- register 
	Reg0: Reg PORT MAP(
		D => d_mux,
		load => Load,
		Clk => Clk,
		RegOut => CAR_out
	);
	
reg_Adder <= RegOut;
B <= "00000000";
Carry <= '1';

	--Adder
	Adder0 : Adder_8bit PORT MAP(
		A_in => reg_Adder,
		B_in => B,
		Carry_in => Carry,
		Adder_out => adder_mux
		);
		
		--Mux
		Mux0 : Mux_inCar PORT MAP(
			in0 => adder_mux,
			in1 => CAR_in,
			s0 => Load,
			out0 => d_mux
			);
end Behavioral;

