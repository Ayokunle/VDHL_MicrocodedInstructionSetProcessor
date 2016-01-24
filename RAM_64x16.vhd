
-- Module Name:    RAM_64x16 - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use UNISIM.VComponents.all;

entity RAM_64x16 is
    Port ( Data_In : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			  Address : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           CSel : in  STD_LOGIC;
           WR : in  STD_LOGIC;
           Data_Out : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end RAM_64x16;

architecture Behavioral of RAM_64x16 is

COMPONENT RAM_64K_8
 PORT(
		Input_data : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      Address : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
      Chip_Sel : in  STD_LOGIC;
      ReadWrite : in  STD_LOGIC;
      Output_data : out  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END COMPONENT;

begin

--RAM_64K_8_1
	RAM_64K_8_1: RAM_64K_8 PORT MAP(
		Input_data => Data_In(7 DOWNTO 0),
		Address => Address(15 DOWNTO 0),
		Chip_Sel => CSel,
		ReadWrite => WR,
		Output_data => Data_Out(7 DOWNTO 0)
		);
		
--RAM_64K_8_2
	RAM_64K_8_2: RAM_64K_8 PORT MAP(
		Input_data => Data_In(15 DOWNTO 8),
		Address => Address(15 DOWNTO 0),
		Chip_Sel => CSel,
		ReadWrite => WR,
		Output_data => Data_Out(7 DOWNTO 0)
		);		


end Behavioral;

