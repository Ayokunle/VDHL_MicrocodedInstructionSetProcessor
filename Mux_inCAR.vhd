
-- Module Name:    Mux_inCAR - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_inCAR is
    Port ( in0 : in  STD_ULOGIC_VECTOR(7 DOWNTO 0);
           in1 : in  STD_ULOGIC_VECTOR(7 DOWNTO 0);
           s0 : in  STD_LOGIC;
           out0 : out  STD_ULOGIC_VECTOR(7 DOWNTO 0));
end Mux_inCAR;

architecture Behavioral of Mux_inCAR is

begin

out0 <= in0 after 5 ns when s0 = '0' else
			in1 after 5 ns when s0 = '1' else
			"00000000";

end Behavioral;

