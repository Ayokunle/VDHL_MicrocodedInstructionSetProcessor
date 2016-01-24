
-- Module Name:    ProgramCounter - Behavioral 

library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( PC_in : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           PI : in  STD_LOGIC;
           PL : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR(15 DOWNTO 0)
			  );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

-- components
-- 16 bit Register for register file
COMPONENT Reg
PORT(
	D : IN std_logic_vector(15 downto 0);
	Clk : in std_logic;    
	load : in std_logic;
	Reg_Out : OUT std_logic_vector(15 downto 0)
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

--PC MUX
COMPONENT Mux_inCAR
PORT(
	in0 : std_logic_vector(15 downto 0);
	in1 : std_logic_vector(15 downto 0);
	sel : in std_logic;
	out0 : out std_logic_vector(15 downto 0)
);
END COMPONENT;

signal zeros, mux_1, mux_2, adder_mux, from_reg : std_logic_vector(15 downto 0) ;

begin
zeros <= "0000000000000000";

--Mux
	Mux1 : Mux_inCAR PORT MAP(
		in0 => PC_in,
		in1 => zeros,
		sel => PL,
		out0 => mux_1
		);

--Mux
	Mux2 : Mux_inCAR PORT MAP(
		in0 => adder_mux,
		in1 => zeros,
		sel => sel_0,
		out0 => mux_2
		);
		
from_reg <= RegOut;
--Adder
	Adder0 : Adder_8bit PORT MAP(
		A_in => from_reg,
		B_in =>  mux_1,
		Carry_in => C,
		Adder_out => adder_mux
		);
		
-- register 
	reg0: Reg PORT MAP(
		D => mux_2,
		Load => PI,
		Clk => Clk,
		Reg_Out => PC_out 
	);

end Behavioral;

