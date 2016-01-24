   
-- Module Name:   U:/Comp Arch/DatapathDesign/FullAdder_tb.vhd
-- Project Name:  DatapathDesign

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY FullAdder_tb IS
END FullAdder_tb;
 
ARCHITECTURE behavior OF FullAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FullAdder
    PORT(
         C_in : IN  std_logic_vector(15 downto 0);
         A_in : IN  std_logic_vector(15 downto 0);
         B_in : IN  std_logic_vector(15 downto 0);
         C_out : OUT  std_logic_vector(15 downto 0);
         S_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal C_in : std_logic_vector(15 downto 0) := (others => '0');
   signal A_in : std_logic_vector(15 downto 0) := (others => '0');
   signal B_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal C_out : std_logic_vector(15 downto 0);
   signal S_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FullAdder PORT MAP (
          C_in => C_in,
          A_in => A_in,
          B_in => B_in,
          C_out => C_out,
          S_out => S_out
        );


   -- Stimulus process
   stim_proc: process
   begin		
	A_in <= "0000000000000000";
	B_in <= "0000000000000001";
	C_in <= "0000000000000001";

      wait;
   end process;

END;
