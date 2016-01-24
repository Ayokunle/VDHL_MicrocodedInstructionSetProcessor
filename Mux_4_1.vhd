--Ayokunle Adeosun 11485192
-- Module Name:    Mux_9_1 - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_9_1 is
    Port (input0, input1, input2, input3, input4,
			  input5, input6, input7, input8 : in std_ulogic_vector(15 downto 0);
			  S0, S1, S2, S3 : in std_logic;
           output0 : out  std_ulogic_vector(15 downto 0));
end Mux_9_1;

architecture Behavioral of Mux_9_1 is

begin
output0 <= input0 after 5 ns when S3='0' and S2='0' and S1 = '0' and S0 = '0' else
			  input1 after 5 ns when S3='0' and S2='0' and S1 = '0' and S0 = '1' else
			  input2 after 5 ns when S3='0' and S2='0' and S1 = '1' and S0 = '0' else
			  input3 after 5 ns when S3='0' and S2='0' and S1 = '1' and S0 = '1' else
			  input4 after 5 ns when S3='0' and S2='1' and S1 = '0' and S0 = '0' else
			  input5 after 5 ns when S3='0' and S2='1' and S1 = '0' and S0 = '1' else
			  input6 after 5 ns when S3='0' and S2='1' and S1 = '1' and S0 = '0' else
			  input7 after 5 ns when S3='0' and S2='1' and S1 = '1' and S0 = '1' else
			  input8 after 5 ns when S3='1' and S2='0' and S1 = '0' and S0 = '0' else
			  "0000000000000000" after 5 ns;

end Behavioral;