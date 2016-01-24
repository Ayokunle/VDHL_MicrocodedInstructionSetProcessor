
-- Project Name:  MicrocodedInstructionSetProcessor
-- VHDL Test Bench Created by ISE for module: SR_Latch

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SR_Latch_tb IS
END SR_Latch_tb;
 
ARCHITECTURE behavior OF SR_Latch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SR_Latch
    PORT(
         S : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SR_Latch PORT MAP (
          S => S,
          R => R,
          Q => Q
			 );


 

   -- Stimulus process
   stim_proc: process
   begin		

	S <= '1';
	R <= '0';
	wait;
	
   end process;

END;
