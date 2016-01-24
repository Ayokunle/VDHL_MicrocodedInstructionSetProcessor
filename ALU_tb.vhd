--Ayokunle Adeosun 11485192
-- Module Name:   U:/Comp Arch/DatapathDesign/ALU_tb.vhd
-- Project Name:  DatapathDesign

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Carry_in : IN  std_logic;
         A : IN  std_ulogic_vector(15 downto 0);
         B : IN  std_ulogic_vector(15 downto 0);
         sel_0 : IN  std_logic;
         sel_1 : IN  std_logic;
         sel_2 : IN  std_logic;
         Carry_out : OUT  std_logic;
         G_out : OUT  std_ulogic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Carry_in : std_logic := '0';
   signal A : std_ulogic_vector(15 downto 0) := (others => '0');
   signal B : std_ulogic_vector(15 downto 0) := (others => '0');
   signal sel_0 : std_logic := '0';
   signal sel_1 : std_logic := '0';
   signal sel_2 : std_logic := '0';

 	--Outputs
   signal Carry_out : std_logic;
   signal G_out : std_ulogic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Carry_in => Carry_in,
          A => A,
          B => B,
          sel_0 => sel_0,
          sel_1 => sel_1,
          sel_2 => sel_2,
          Carry_out => Carry_out,
          G_out => G_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
	--Carry_in
		A <= "0000000000000000";
		B <= "0000000000000000";
		Carry_in <= '0';
		sel_0 <= '1';
		sel_1 <= '1';
		sel_2 <= '1';
		
      wait;
   end process;

END;
