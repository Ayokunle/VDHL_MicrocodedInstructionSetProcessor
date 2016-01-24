
-- Module Name:    Memory_Cell - Behavioral 

use IEEE.STD_LOGIC_1164.ALL;



entity Memory_Cell is
    Port ( S : in  STD_LOGIC;
           Read_Write : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           Q : out  STD_LOGIC;
			  Q_C : out  STD_LOGIC);
end Memory_Cell;

architecture Behavioral of Memory_Cell is

signal input_inv, to_S, to_R, read_write_inv : std_logic;
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

