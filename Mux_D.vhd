--Ayokunle Adeosun 11485192
-- Module Name:    Mux_D - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_D is
    Port ( Data_in : in std_ulogic_vector(15 downto 0);
           FU_in : in  std_ulogic_vector(15 downto 0);
           M_out : out  std_ulogic_vector(15 downto 0);
           MD_sel : in  STD_LOGIC);
end Mux_D;

architecture Behavioral of Mux_D is

begin

M_out <= Data_in after 5 ns when MD_sel='0' else
				  FU_in after 5 ns when MD_sel='1' else
				  "0000000000000000" after 5 ns;

end Behavioral;

