
-- Module Name:   U:/Comp Arch/MicrocodedInstructionSetProcessor/Adder_8bit_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Adder_8bit_tb IS
END Adder_8bit_tb;
 
ARCHITECTURE behavior OF Adder_8bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder_8bit
    PORT(
         A_in : IN  std_logic_vector(7 downto 0);
         B_in : IN  std_logic_vector(7 downto 0);
         Carry_in : IN  std_logic;
         Carry_out : OUT  std_logic;
         Adder_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_in : std_logic_vector(7 downto 0) := (others => '0');
   signal B_in : std_logic_vector(7 downto 0) := (others => '0');
   signal Carry_in : std_logic := '0';

 	--Outputs
   signal Carry_out : std_logic;
   signal Adder_out : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder_8bit PORT MAP (
          A_in => A_in,
          B_in => B_in,
          Carry_in => Carry_in,
          Carry_out => Carry_out,
          Adder_out => Adder_out
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 

		A_in <= "00000010";
		B_in <= "00000000";
		Carry_in <= '1';

      wait;
   end process;

END;
