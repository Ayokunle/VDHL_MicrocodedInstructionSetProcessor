--Ayokunle Adeosun 11485192
-- Module Name:    LogicCircuit - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LogicCircuit is
    Port ( a : in std_logic_vector(15 downto 0);
           b : in std_logic_vector(15 downto 0);
           sel0 : in  STD_LOGIC;
           sel1 : in  STD_LOGIC;
           G_Logic_out : out std_logic_vector(15 downto 0));
end LogicCircuit;

architecture Behavioral of LogicCircuit is


signal into0, into1, into2, into3 : std_logic_vector(15 downto 0); 

begin
into0 <= (a and b);
into1 <= (a or b);
into2 <= (a xor b);
into3 <=  (not a);

G_Logic_out <= into0 after 5 ns when sel1 = '0' and sel0 = '0' else
			  into1 after 5 ns when sel1 = '0' and sel0 = '1' else
			  into2 after 5 ns when sel1 = '1' and sel0 = '0' else
			  into3 after 5 ns when sel1 = '1' and sel0 = '1' else
			  "0000000000000000" after 5 ns;
	
end Behavioral;

