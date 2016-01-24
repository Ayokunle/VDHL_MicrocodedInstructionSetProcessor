
-- Module Name:    Mux_barrel - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_barrel is
    Port ( in_0 : in  std_ulogic_vector(15 downto 0);
           in_1 : in  std_ulogic_vector(15 downto 0);
           in_2 : in  std_ulogic_vector(15 downto 0);
           in_3 : in  std_ulogic_vector(15 downto 0);
			  Select0 : in STD_LOGIC;
			  Select1 : in STD_LOGIC;
           out_0 : out  std_ulogic_vector(15 downto 0));
end Mux_barrel;

architecture Behavioral of Mux_barrel is

begin

out_0 <= in_0 after 5 ns when Select1='0' and Select0='0' else
			in_1 after 5 ns when Select1='0' and Select0='1' else
			in_2 after 5 ns when Select1='1' and Select0='0' else
			in_3 after 5 ns when Select1='1' and Select0='1' else
			"0000000000000000" after 5 ns;
			
end Behavioral;

