
-- Module Name:   U:/Comp Arch/MicrocodedInstructionSetProcessor/FuctionUnit_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FuctionUnit_tb IS
END FuctionUnit_tb;
 
ARCHITECTURE behavior OF FuctionUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FuctionUnit
    PORT(
         Mux_B_in : IN  std_ulogic_vector(15 downto 0);
         FU_A_in : IN  std_ulogic_vector(15 downto 0);
         C_in : IN  std_logic;
         sel0 : IN  std_logic;
         sel1 : IN  std_logic;
         sel2 : IN  std_logic;
         sel3 : IN  std_logic;
         sel4 : IN  std_ulogic_vector(1 downto 0);
         C_out : OUT  std_logic;
         N_out : OUT  std_logic;
         Z_out : OUT  std_logic;
         V_out : OUT  std_logic;
         Mux_F_out : OUT  std_ulogic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Mux_B_in : std_ulogic_vector(15 downto 0) := (others => '0');
   signal FU_A_in : std_ulogic_vector(15 downto 0) := (others => '0');
   signal C_in : std_logic := '0';
   signal sel0 : std_logic := '0';
   signal sel1 : std_logic := '0';
   signal sel2 : std_logic := '0';
   signal sel3 : std_logic := '0';
   signal sel4 : std_ulogic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal C_out : std_logic;
   signal N_out : std_logic;
   signal Z_out : std_logic;
   signal V_out : std_logic;
   signal Mux_F_out : std_ulogic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FuctionUnit PORT MAP (
          Mux_B_in => Mux_B_in,
          FU_A_in => FU_A_in,
          C_in => C_in,
          sel0 => sel0,
          sel1 => sel1,
          sel2 => sel2,
          sel3 => sel3,
          sel4 => sel4,
          C_out => C_out,
          N_out => N_out,
          Z_out => Z_out,
          V_out => V_out,
          Mux_F_out => Mux_F_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
	Mux_B_in <= "0000000000000000";
	FU_A_in <= "0000000000000001";


      wait;
   end process;

END;
