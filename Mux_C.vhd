-- Ayokunle Adeosun 11485192
-- Module Name:    Mux_C - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_C is
    Port ( IN0 : in  STD_ULOGIC_VECTOR(7 DOWNTO 0);
           IN1 : in  STD_ULOGIC_VECTOR(7 DOWNTO 0);
           MCsel : in  STD_LOGIC;
           OUT0 : out  STD_ULOGIC_VECTOR(7 DOWNTO 0));
end Mux_C;

architecture Behavioral of Mux_C is

begin
OUT0 <= IN0 after 5 ns when MCsel ='0' else 
		  IN1 after 5 ns when MCsel ='1' else 
		  "00000000";
			

end Behavioral;

