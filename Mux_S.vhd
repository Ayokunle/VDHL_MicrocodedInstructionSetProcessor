--Ayokunle Adeosun 11485192
-- Module Name:    Mux_S - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_S is
    Port ( Z_ : in  STD_LOGIC;
           C_ : in  STD_LOGIC;
           N : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           V : in  STD_LOGIC;
           C : in  STD_LOGIC;
           ONE : in  STD_LOGIC;
           ZER0 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
			  S1 : in  STD_LOGIC;
			  S2 : in  STD_LOGIC;
			  output : out STD_LOGIC);
end Mux_S;

architecture Behavioral of Mux_S is

begin
output <= ZERO after 5 ns when S2='0' and S1 = '0' and S0 = '0' else
			  ONE after 5 ns when S2='0' and S1 = '0' and S0 = '1' else
			  C after 5 ns when S2='0' and S1 = '1' and S0 = '0' else
			  V after 5 ns when S2='0' and S1 = '1' and S0 = '1' else
			  Z after 5 ns when S2='1' and S1 = '0' and S0 = '0' else
			  N after 5 ns when S2='1' and S1 = '0' and S0 = '1' else
			  C_ after 5 ns when S2='1' and S1 = '1' and S0 = '0' else
			  Z_ after 5 ns when S2='1' and S1 = '1' and S0 = '1' else
			  "0000000000000000" after 5 ns;

end Behavioral;

