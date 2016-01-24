--Ayokunle Adeosun 11485192
-- Module Name:    CarryRippleAdder - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CarryRippleAdder is
    Port ( CR_in : in  std_logic;
           input_A : in  std_logic_vector(15 downto 0);
           input_B : in  std_logic_vector(15 downto 0);
			  Sum_out : out std_logic_vector(15 downto 0);
			  	S0, S1 : in std_logic;
           CR_out : out  std_logic);
end CarryRippleAdder;

architecture Behavioral of CarryRippleAdder is

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


	signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16 : std_logic;
	signal y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16 : std_logic; 

begin
y1 <= (S0 and input_B(0)) or (not input_B(0) and S1);
-- FullAdder0
	FA0: FullAdder PORT MAP(
			  C_in => CR_in,
			  A_in => input_A(0),
           B_in => y1,
           C_out => c1,
			  S_out => Sum_out(0)
	);
	
y2 <= (S0 and input_B(1)) or (not input_B(1) and S1);	
-- FullAdder1
	FA1: FullAdder PORT MAP(
			  C_in => c1,
			  A_in => input_A(1),
           B_in => y2,
           C_out => c2,
			  S_out => Sum_out(1)
	);
	
y3 <= (S0 and input_B(2)) or (not input_B(2) and S1);	
-- FullAdder2
	FA2: FullAdder PORT MAP(
			  C_in => c2,
			  A_in => input_A(2),
           B_in => y3,
           C_out => c3,
			  S_out => Sum_out(2)
	);
	
y4 <= (S0 and input_B(3)) or (not input_B(3) and S1);	
-- FullAdder3
	FA3: FullAdder PORT MAP(
			  C_in => c3,
			  A_in => input_A(3),
           B_in => y4,
           C_out => c4,
			  S_out => Sum_out(3)
	);
	
y5 <= (S0 and input_B(4)) or (not input_B(4) and S1);	
-- FullAdder4
	FA4: FullAdder PORT MAP(
			  C_in => c4,
			  A_in => input_A(4),
           B_in => y5,
           C_out => c5,
			  S_out => Sum_out(4)
	);

y6 <= (S0 and input_B(5)) or (not input_B(5) and S1);	
-- FullAdder5
	FA5: FullAdder PORT MAP(
			  C_in => c5,
			  A_in => input_A(5),
           B_in => y6,
           C_out => c6,
			  S_out => Sum_out(5)
	);

y7 <= (S0 and input_B(6)) or (not input_B(6) and S1);	
-- FullAdder6
	FA6: FullAdder PORT MAP(
			  C_in => c6,
			  A_in => input_A(6),
           B_in => y7,
           C_out => c7,
			  S_out => Sum_out(6)
	);

y8 <= (S0 and input_B(7)) or (not input_B(7) and S1);	
-- FullAdder7
	FA7: FullAdder PORT MAP(
			  C_in => c7,
			  A_in => input_A(7),
           B_in => y8,
           C_out => c8,
			  S_out => Sum_out(7)
	);

y9 <= (S0 and input_B(8)) or (not input_B(8) and S1);	
-- FullAdder8
	FA8: FullAdder PORT MAP(
			  C_in => c8,
			  A_in => input_A(8),
           B_in => y9,
           C_out => c9,
			  S_out => Sum_out(8)
	);

y10 <= (S0 and input_B(9)) or (not input_B(9) and S1);	
-- FullAdder9
	FA9: FullAdder PORT MAP(
			  C_in => c9,
			  A_in => input_A(9),
           B_in => y10,
           C_out => c10,
			  S_out => Sum_out(9)
	);

y11 <= (S0 and input_B(10)) or (not input_B(10) and S1);	
-- FullAdder10
	FA10: FullAdder PORT MAP(
			  C_in => c10,
			  A_in => input_A(10),
           B_in => y11,
           C_out => c11,
			  S_out => Sum_out(10)
	);

y12 <= (S0 and input_B(11)) or (not input_B(11) and S1);	
-- FullAdder11
	FA11: FullAdder PORT MAP(
			  C_in => c11,
			  A_in => input_A(11),
           B_in => y12,
           C_out => c12,
			  S_out => Sum_out(11)
	);
	
y13 <= (S0 and input_B(12)) or (not input_B(12) and S1);	
-- FullAdder12
	FA12: FullAdder PORT MAP(
			  C_in => c12,
			  A_in => input_A(12),
           B_in => y13,
           C_out => c13,
			  S_out => Sum_out(12)
	);
	
y14 <= (S0 and input_B(13)) or (not input_B(13) and S1);	
-- FullAdder13
	FA13: FullAdder PORT MAP(
			  C_in => c13,
			  A_in => input_A(13),
           B_in => y14,
           C_out => c14,
			  S_out => Sum_out(13)
	);
	
y15 <= (S0 and input_B(14)) or (not input_B(14) and S1);	
-- FullAdder14
	FA14: FullAdder PORT MAP(
			  C_in => c14,
			  A_in => input_A(14),
           B_in => y15,
           C_out => c15,
			  S_out => Sum_out(14)
	);
	
	
y16 <= (S0 and input_B(15)) or (not input_B(15) and S1);	
-- FullAdder15
	FA15: FullAdder PORT MAP(
			  C_in => c15,
			  A_in => input_A(15),
           B_in => y16,
           C_out => CR_out,
			  S_out => Sum_out(15)
	);
	
end Behavioral;

