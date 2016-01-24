
-- Module Name:    Mux_8_1 - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_8_1 is
    Port ( 
			input0, input1, input2, input3, input4, input5, input6, input7 : in std_logic_vector(15 downto 0);
			S0, S1, S2 : in std_logic;
			Z_out : out std_logic_vector(15 downto 0));
end Mux_8_1;

architecture Behavioral of Mux_8_1 is

begin
Z_out <= input0 after 5 ns when S2='0' and S1='0' and S0 = '0' else
	  input1 after 5 ns when S2='0' and S1='0' and S0 = '1' else
	  input2 after 5 ns when S2='0' and S1='1' and S0 = '0' else
	  input3 after 5 ns when S2='0' and S1='1' and S0 = '1' else
	  input4 after 5 ns when S2='1' and S1='0' and S0 = '0' else
	  input5 after 5 ns when S2='1' and S1='0' and S0 = '1' else
	  input6 after 5 ns when S2='1' and S1='1' and S0 = '0' else
	  input7 after 5 ns when S2='1' and S1='1' and S0 = '1' else
		"0000000000000000" after 5 ns;


end Behavioral;

