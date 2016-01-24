
-- Module Name:   U:/Comp Arch/DatapathDesign/Mux_barrel_tb.vhd

USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mux_barrel_tb IS
END Mux_barrel_tb;
 
ARCHITECTURE behavior OF Mux_barrel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_barrel
    PORT(
         in_0 : IN  std_logic_vector(15 downto 0);
         in_1 : IN  std_logic_vector(15 downto 0);
         in_2 : IN  std_logic_vector(15 downto 0);
         in_3 : IN  std_logic_vector(15 downto 0);
         Select0 : IN  std_logic;
         Select1 : IN  std_logic;
         out_0 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal in_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal in_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal Select0 : std_logic := '0';
   signal Select1 : std_logic := '0';

 	--Outputs
   signal out_0 : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_barrel PORT MAP (
          in_0 => in_0,
          in_1 => in_1,
          in_2 => in_2,
          in_3 => in_3,
          Select0 => Select0,
          Select1 => Select1,
          out_0 => out_0
        );


   -- Stimulus process
   stim_proc: process
   begin		

    in_0 <= "0000000000000001";
	 in_1 <= "0000000000000000";
	 in_2 <= "0000000000000001";
	 in_3 <= "0000000000000000";
	 Select0 <= '0';
	 Select1 <= '1';
	    wait;
   end process;

END;
