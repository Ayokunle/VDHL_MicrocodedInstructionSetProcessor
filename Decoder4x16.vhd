
-- Module Name:    Decoder3x8 - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder3x8 is
    Port ( Address0 : in  STD_LOGIC;
           Address1 : in  STD_LOGIC;
           Address2 : in  STD_LOGIC;
			  
			  CS : in STD_LOGIC;
			  
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out  STD_LOGIC;
           Q6 : out  STD_LOGIC;
           Q7 : out  STD_LOGIC
			  );
end Decoder3x8;

architecture Behavioral of Decoder4x16 is

begin
	process(Address0, Address2)
		begin
			if( CS = '0' ) then 
				----
			elsif(CS = '1') then
				Q0 <= ((not Address2) and (not Address1) and (not Address0)) after 5 ns; --0000
		 
				Q1 <= ((not Address2) and (not Address1) and ( Address0)) after 5 ns; --0000
		 
				Q2 <= ((not Address2) and (Address1) and (not Address0)) after 5 ns; --0000
		 
				Q3 <= ((not Address2) and (Address1) and ( Address0)) after 5 ns; --0000
		 
				Q4 <= ((Address2) and (not Address1) and (not Address0)) after 5 ns; --0000
		 
				Q5 <= ((Address2) and (not Address1) and ( Address0)) after 5 ns; --0000
		 
				Q6 <= ((Address2) and (Address1) and (not Address0)) after 5 ns; --0000

				Q7 <= ((Address2) and (Address1) and ( Address0)) after 5 ns; --0000

			end if;
		end process;
end Behavioral;

