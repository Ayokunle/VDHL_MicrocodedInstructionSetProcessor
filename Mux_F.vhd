--Ayokunle Adeosun 11485192
-- Module Name:    Mux_F - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_F is
    Port ( MF_in0 : in  std_ulogic_vector(15 downto 0);
           MF_in1 : in  std_ulogic_vector(15 downto 0);
           MF_sel : in  STD_LOGIC;
           MF_out : out  std_ulogic_vector(15 downto 0));
end Mux_F;

architecture Behavioral of Mux_F is

begin


MF_out <= MF_in0 after 5 ns when MF_sel='0' else
			 MF_in1 after 5 ns when MF_sel='1' else
				  "0000000000000000" after 5 ns;

end Behavioral;

