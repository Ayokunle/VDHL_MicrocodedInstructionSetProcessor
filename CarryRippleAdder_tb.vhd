--Ayokunle Adeosun 11485192
-- Module Name:   U:/Comp Arch/DatapathDesign/CarryRippleAdder_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CarryRippleAdder_tb IS
END CarryRippleAdder_tb;
 
ARCHITECTURE behavior OF CarryRippleAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarryRippleAdder
    PORT(
         CR_in : IN  std_logic;
         input_A : IN  std_ulogic_vector(15 downto 0);
         input_B : IN  std_ulogic_vector(15 downto 0);
         Sum_out : OUT  std_ulogic_vector(15 downto 0);
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         CR_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CR_in : std_logic := '0';
   signal input_A : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input_B : std_ulogic_vector(15 downto 0) := (others => '0');
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';

 	--Outputs
   signal Sum_out : std_ulogic_vector(15 downto 0);
   signal Carry_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarryRippleAdder PORT MAP (
          CR_in => CR_in,
          input_A => input_A,
          input_B => input_B,
          Sum_out => Sum_out,
          S0 => S0,
          S1 => S1,
          CR_OUT => Carry_out
        );
  
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	CR_in <= '0';
	S1 <= '1';
	S0 <= '1';
	input_A <= "1111111111111111";
	input_B <= "1111111111111111";



      wait;
   end process;

END;
