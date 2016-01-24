--Ayokunle Adeosun 11485192
-- Shifter Entity

library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY Shifter IS
PORT(
	Binter : in std_ulogic_vector(15 downto 0);
	S : in std_ulogic_vector(1 downto 0);
	InRight : in std_logic;
	InLeft : in std_logic;
	Shift_Output : out std_ulogic_vector(15 downto 0)
);
END Shifter;	

ARCHITECTURE Behavioral OF Shifter IS

begin	
	process(S, Binter)
	
	begin
		if(S = "00") then
			Shift_Output <= Binter;
		elsif(S = "11")then
			Shift_Output <= Binter;
		elsif (S = "01") then
			Shift_Output(14 downto 0) <= Binter(15 downto 1);
			Shift_Output(15) <= InRight;
		elsif (S = "10") then
			Shift_Output(15 downto 1) <= Binter(14 downto 0);
			Shift_Output(0) <= InLeft;
		end if;
	end process;
END Behavioral;
			