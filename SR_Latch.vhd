
-- Module Name:    SR_Latch - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SR_Latch is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q: out  STD_LOGIC);
end SR_Latch;

architecture Behavioral of SR_Latch is

begin
	process(S, R)
	begin
		if(S = '0' and R = '0') then
			--do nothing
		elsif (S = '0' and R = '1') then
			Q <= '0';
		elsif (S = '1' and R = '0') then
			Q <= '1';
		end if;
	end process;
end Behavioral;

