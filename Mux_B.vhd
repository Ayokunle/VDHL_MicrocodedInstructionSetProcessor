--Ayokunle Adeosun 11485192
-- Module Name:    Mux_B - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_B is
    Port ( MB_in0 : in  std_ulogic_vector(15 downto 0);
           MB_in1 : in  std_ulogic_vector(15 downto 0);
           MB_sel : in  STD_LOGIC;
           MB_out : out  std_ulogic_vector(15 downto 0));
end Mux_B;

architecture Behavioral of Mux_B is

begin


MB_out <= MB_in0 after 5 ns when MB_sel='0' else
			 MB_in1 after 5 ns when MB_sel='1' else
				  "0000000000000000" after 5 ns;

end Behavioral;

