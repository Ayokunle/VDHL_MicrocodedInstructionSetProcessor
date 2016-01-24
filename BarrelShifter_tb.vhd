  
-- Module Name:   U:/Comp Arch/DatapathDesign/BarrelShifter_tb.vhd

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BarrelShifter_tb IS
END BarrelShifter_tb;
 
ARCHITECTURE behavior OF BarrelShifter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BarrelShifter
    PORT(
         input0 : IN  std_ulogic_vector(15 downto 0);
         input1 : IN  std_ulogic_vector(15 downto 0);
         input2 : IN  std_ulogic_vector(15 downto 0);
         input3 : IN  std_ulogic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         Y0 : OUT  std_ulogic_vector(15 downto 0);
         Y1 : OUT  std_ulogic_vector(15 downto 0);
         Y2 : OUT  std_ulogic_vector(15 downto 0);
         Y3 : OUT  std_ulogic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input0 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input1 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input2 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input3 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';

 	--Outputs
   signal Y0 : std_ulogic_vector(15 downto 0);
   signal Y1 : std_ulogic_vector(15 downto 0);
   signal Y2 : std_ulogic_vector(15 downto 0);
   signal Y3 : std_ulogic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BarrelShifter PORT MAP (
          input0 => input0,
          input1 => input1,
          input2 => input2,
          input3 => input3,
          s0 => s0,
          s1 => s1,
          Y0 => Y0,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3
        );

-- Stimulus process
   stim_proc: process
	
   begin		
	s0 <= '0';
	s1 <= '0';
	
	input0 <=  "0000000000000001";
--	input1 <=  "0000000000000010";
--	input2 <=  "0000000000000100";
--	input3 <=  "0000000000001000";
	
	s0 <= '1';
	s1 <= '0';
	wait for 10 ns;
	
	s0 <= '0';
	s1 <= '1';
	wait for 10 ns;

	s0 <= '0';
	s1 <= '0';
	
	wait;
   end process;

END;
