
-- Module Name:    Mux_4to1 - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_4to1 is
    Port ( 
			  a : in  std_ulogic_vector(15 downto 0);
			  b : in  std_ulogic_vector(15 downto 0);
           SEL_0 : in  STD_LOGIC;
           SEL_1 : in  STD_LOGIC;
           output_mux : out  std_ulogic_vector(15 downto 0));
end Mux_4to1;

architecture Behavioral of Mux_4to1 is


signal into0, into1, into2, into3 : std_ulogic_vector(15 downto 0); 

begin
into0 <= (a and b);
into1 <= (a or b);
into2 <= (a xor b);
into3 <=  (not a);

output_mux <= into0 after 5 ns when SEL_0='0' and SEL_1='0' else
					into1 after 5 ns when SEL_0='0' and SEL_1='1' else
					into2 after 5 ns when SEL_0='1' and SEL_1='0' else
					into3 after 5 ns when SEL_0='1' and SEL_1='1' else
					"0000000000000000" after 5 ns;

end Behavioral;

