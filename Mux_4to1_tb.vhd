
-- Module Name:   U:/Comp Arch/DatapathDesign/Mux_4to1_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mux_4to1_tb IS
END Mux_4to1_tb;
 
ARCHITECTURE behavior OF Mux_4to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_4to1
    PORT(
         a : IN  std_ulogic_vector(15 downto 0);
         b : IN  std_ulogic_vector(15 downto 0);
         SEL_0 : IN  std_logic;
         SEL_1 : IN  std_logic;
         output_mux : OUT  std_ulogic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_ulogic_vector(15 downto 0) := (others => '0');
   signal b : std_ulogic_vector(15 downto 0) := (others => '0');
   signal SEL_0 : std_logic := '0';
   signal SEL_1 : std_logic := '0';

 	--Outputs
   signal output_mux : std_ulogic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_4to1 PORT MAP (
          a => a,
          b => b,
          SEL_0 => SEL_0,
          SEL_1 => SEL_1,
          output_mux => output_mux
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
	SEL_0 <= '1';
	SEL_1 <= '1';
	 a <= "0000000000000001";
	 b <= "0000000000000000";
	
	
	
      wait;
   end process;

END;
