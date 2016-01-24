
-- VHDL Test Bench Created by ISE for module: Shifter

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY Shifter_tb IS
END Shifter_tb;
 
ARCHITECTURE behavior OF Shifter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Shifter
    PORT(
         Binter : IN  std_ulogic_vector(15 downto 0);
         S : IN  std_ulogic_vector(1 downto 0);
         InRight : IN  std_logic;
         InLeft : IN  std_logic;
         Shift_Output : OUT  std_ulogic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Binter : std_ulogic_vector(15 downto 0) := (others => '0');
   signal S : std_ulogic_vector(1 downto 0) := (others => '0');
   signal InRight : std_logic := '0';
   signal InLeft : std_logic := '0';

 	--Outputs
   signal Shift_Output : std_ulogic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shifter PORT MAP (
          Binter => Binter,
          S => S,
          InRight => InRight,
          InLeft => InLeft,
          Shift_Output => Shift_Output
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		Binter <= "0000000000000001";
		S <= "11";

      wait;
   end process;

END;
