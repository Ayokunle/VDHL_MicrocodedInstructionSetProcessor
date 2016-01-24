  
-- Module Name:   U:/Comp Arch/MicrocodedInstructionSetProcessor/RegisterFile_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RegisterFile_tb IS
END RegisterFile_tb;
 
ARCHITECTURE behavior OF RegisterFile_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         Mux_D : IN  std_ulogic_vector(15 downto 0);
         des_A0 : IN  std_logic;
         des_A1 : IN  std_logic;
         des_A2 : IN  std_logic;
         des_A3 : IN  std_logic;
         Load_enable : IN  std_logic;
         SEL_muxA_0 : IN  std_logic;
         SEL_muxA_1 : IN  std_logic;
         SEL_muxA_2 : IN  std_logic;
         SEL_muxA_3 : IN  std_logic;
         SEL_muxB_0 : IN  std_logic;
         SEL_muxB_1 : IN  std_logic;
         SEL_muxB_2 : IN  std_logic;
         SEL_muxB_3 : IN  std_logic;
         Clk : IN  std_logic;
         A_data : OUT  std_ulogic_vector(15 downto 0);
         B_data : OUT  std_ulogic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Mux_D : std_ulogic_vector(15 downto 0) := (others => '0');
   signal des_A0 : std_logic := '0';
   signal des_A1 : std_logic := '0';
   signal des_A2 : std_logic := '0';
   signal des_A3 : std_logic := '0';
   signal Load_enable : std_logic := '0';
   signal SEL_muxA_0 : std_logic := '0';
   signal SEL_muxA_1 : std_logic := '0';
   signal SEL_muxA_2 : std_logic := '0';
   signal SEL_muxA_3 : std_logic := '0';
   signal SEL_muxB_0 : std_logic := '0';
   signal SEL_muxB_1 : std_logic := '0';
   signal SEL_muxB_2 : std_logic := '0';
   signal SEL_muxB_3 : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal A_data : std_ulogic_vector(15 downto 0);
   signal B_data : std_ulogic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          Mux_D => Mux_D,
          des_A0 => des_A0,
          des_A1 => des_A1,
          des_A2 => des_A2,
          des_A3 => des_A3,
          Load_enable => Load_enable,
          SEL_muxA_0 => SEL_muxA_0,
          SEL_muxA_1 => SEL_muxA_1,
          SEL_muxA_2 => SEL_muxA_2,
          SEL_muxA_3 => SEL_muxA_3,
          SEL_muxB_0 => SEL_muxB_0,
          SEL_muxB_1 => SEL_muxB_1,
          SEL_muxB_2 => SEL_muxB_2,
          SEL_muxB_3 => SEL_muxB_3,
          Clk => Clk,
          A_data => A_data,
          B_data => B_data
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
	Mux_D <= "0000011100001110";
	
	des_A0 <= '0';
	des_A1 <= '0';
	des_A2 <= '0';
	des_A3 <= '0';
	
	Load_enable <= '1';
	
	SEL_muxA_0 <= '0';
	SEL_muxA_1 <= '0';
	SEL_muxA_2 <= '0';
	SEL_muxA_3 <= '0';
	
	SEL_muxB_0 <= '0';
	SEL_muxB_1 <= '0';
	SEL_muxB_2 <= '0';
	SEL_muxB_3 <= '0';
	
      wait;
   end process;

END;
