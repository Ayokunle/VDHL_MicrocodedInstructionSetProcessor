--Ayokunle Adeosun 11485192
-- Module Name:    Reg - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC_reg is
    Port ( D : in  std_logic_vector(15 downto 0);
           Clk : in  STD_LOGIC;
           Reg_Out : out  std_logic_vector(15 downto 0));
end PC_reg;

architecture Behavioral of PC_reg is

begin
process(Clk)
begin
	if (rising_edge(Clk)) then
		Reg_Out<=D after 5 ns;
	end if;
end process;

end Behavioral;


