
-- Module Name:    Adder_8bit - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Adder_8bit is
    Port ( A_in : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B_in : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Carry_in : in  STD_LOGIC;
			  Carry_out : out STD_LOGIC;
           Adder_out : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end Adder_8bit;

architecture Behavioral of Adder_8bit is

-- FullAdder
COMPONENT FullAdder
PORT(
	A_in : IN std_logic;
	B_in : IN std_logic;
	C_in: IN std_logic;
	C_out : out  std_logic;
	S_out : out  std_logic
	);
END COMPONENT;


	signal c1, c2, c3, c4, c5, c6, c7 : std_logic;
	signal y1, y2, y3, y4, y5, y6, y7 : std_logic; 

begin

-- FullAdder0
	FA0: FullAdder PORT MAP(
			  C_in => Carry_in,
			  A_in => A_in(0),
           B_in => B_in(0),
           C_out => c1,
			  S_out => Adder_out(0)
	);
	
-- FullAdder1
	FA1: FullAdder PORT MAP(
			  C_in => c1,
			  A_in => A_in(1),
           B_in => B_in(1),
           C_out => c2,
			  S_out => Adder_out(1)
	);
	
-- FullAdder2
	FA2: FullAdder PORT MAP(
			  C_in => c2,
			  A_in => A_in(2),
           B_in => B_in(2),
           C_out => c3,
			  S_out => Adder_out(2)
	);
	
-- FullAdder3
	FA3: FullAdder PORT MAP(
			  C_in => c3,
			  A_in => A_in(3),
           B_in => B_in(3),
           C_out => c4,
			  S_out => Adder_out(3)
	);
	
-- FullAdder4
	FA4: FullAdder PORT MAP(
			  C_in => c4,
			  A_in => A_in(4),
           B_in => B_in(4),
           C_out => c5,
			  S_out => Adder_out(4)
	);

-- FullAdder5
	FA5: FullAdder PORT MAP(
			  C_in => c5,
			  A_in => A_in(5),
           B_in => B_in(5),
           C_out => c6,
			  S_out => Adder_out(5)
	);

-- FullAdder6
	FA6: FullAdder PORT MAP(
			  C_in => c6,
			  A_in => A_in(6),
           B_in => B_in(6),
           C_out => c7,
			  S_out => Adder_out(6)
	);

-- FullAdder7
	FA7: FullAdder PORT MAP(
			  C_in => c7,
			  A_in => A_in(7),
           B_in => B_in(7),
           C_out => Carry_out,
			  S_out => Adder_out(7)
	);



end Behavioral;

