
-- Module Name:   U:/Comp Arch/DatapathDesign/LogicCircuit_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY LogicCircuit_tb IS
END LogicCircuit_tb;
 
ARCHITECTURE behavior OF LogicCircuit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LogicCircuit
    PORT(
         a : IN  std_ulogic_vector(15 downto 0);
         b : IN  std_ulogic_vector(15 downto 0);
         sel0 : IN  std_logic;
         sel1 : IN  std_logic;
         G_Logic_out : OUT  std_ulogic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_ulogic_vector(15 downto 0) := (others => '0');
   signal b : std_ulogic_vector(15 downto 0) := (others => '0');
   signal sel0 : std_logic := '0';
   signal sel1 : std_logic := '0';

 	--Outputs
   signal G_Logic_out : std_ulogic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LogicCircuit PORT MAP (
          a => a,
          b => b,
          sel0 => sel0,
          sel1 => sel1,
          G_Logic_out => G_Logic_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
	a <= "0000000000000001";
	b <= "0000000000000000";
	
	sel0 <= '1';
	sel1 <= '1';

      wait;
   end process;

END;
