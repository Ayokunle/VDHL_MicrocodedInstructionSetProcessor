
-- Module Name:   U:/Comp Arch/MicrocodedInstructionSetProcessor/Mux_A_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mux_A_tb IS
END Mux_A_tb;
 
ARCHITECTURE behavior OF Mux_A_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_9_1
    PORT(
         input0 : IN  std_ulogic_vector(15 downto 0);
         input1 : IN  std_ulogic_vector(15 downto 0);
         input2 : IN  std_ulogic_vector(15 downto 0);
         input3 : IN  std_ulogic_vector(15 downto 0);
         input4 : IN  std_ulogic_vector(15 downto 0);
         input5 : IN  std_ulogic_vector(15 downto 0);
         input6 : IN  std_ulogic_vector(15 downto 0);
         input7 : IN  std_ulogic_vector(15 downto 0);
         input8 : IN  std_ulogic_vector(15 downto 0);
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         S3 : IN  std_logic;
         output0 : OUT  std_ulogic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input0 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input1 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input2 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input3 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input4 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input5 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input6 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input7 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal input8 : std_ulogic_vector(15 downto 0) := (others => '0');
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal S3 : std_logic := '0';

 	--Outputs
   signal output0 : std_ulogic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_9_1 PORT MAP (
          input0 => input0,
          input1 => input1,
          input2 => input2,
          input3 => input3,
          input4 => input4,
          input5 => input5,
          input6 => input6,
          input7 => input7,
          input8 => input8,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          output0 => output0
        );


   -- Stimulus process
   stim_proc: process
   begin		
	
      -- insert stimulus here 
			input8 <= "0000000000011001";
			 S0 <= '0';
          S1 <= '0';
          S2 <= '0';
          S3 <= '1';
      wait;
   end process;

END;
