--Ayokunle Adeosun 11485192
-- Module Name:    Mux2to1 - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity Mux2to1 is
    Port ( From_adder : in  std_logic_vector(15 downto 0);
           From_logic : in  std_logic_vector(15 downto 0);
           G_mux_out : out  std_logic_vector(15 downto 0);
           Sel_mux : in  STD_LOGIC);
end Mux2to1;

architecture Behavioral of Mux2to1 is

begin
G_mux_out <= From_adder after 5 ns when Sel_mux='0' else
				 From_logic after 5 ns when Sel_mux='1' else
				 "0000000000000000" after 5 ns;

end Behavioral;

