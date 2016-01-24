
-- Module Name:   U:/Comp Arch/MicrocodedInstructionSetProcessor/PC_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PC_tb IS
END PC_tb;
 
ARCHITECTURE behavior OF PC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         PC_in : IN  std_logic_vector(15 downto 0);
         PI : IN  std_logic;
         PL : IN  std_logic;
         Clk : IN  std_logic;
         PC_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_in : std_logic_vector(15 downto 0) := (others => '0');
   signal PI : std_logic := '0';
   signal PL : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal PC_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          PC_in => PC_in,
          PI => PI,
          PL => PL,
          Clk => Clk,
          PC_out => PC_out
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
	
	  -- Stimulus process
   stim_proc: process
   begin		
	wait for Clk_period ;
      -- insert stimulus here 
		PC_in <= "0000000000000000";
		PL <= '1';
		
      wait;
   end process;

END;
