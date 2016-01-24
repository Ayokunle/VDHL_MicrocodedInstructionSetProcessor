
--
-- Create Date:   16:03:06 04/04/2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY Memory_M_tb IS
END Memory_M_tb;
 
ARCHITECTURE behavior OF Memory_M_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory_M
    PORT(
         address : IN  std_logic_vector(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         MemWrite : IN  std_logic;
         MemRead : IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(15 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal MemWrite : std_logic := '0';
   signal MemRead : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory_M PORT MAP (
          address => address,
          write_data => write_data,
          MemWrite => MemWrite,
          MemRead => MemRead,
          read_data => read_data
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		address <= "0000000000000000";
		write_data <= "0101010101010101";
		MemWrite <= '1';
		MemRead <= '0';

      wait for 10 ns;
		
		MemWrite <= '0';
		MemRead <= '1';
		
   end process;

END;
