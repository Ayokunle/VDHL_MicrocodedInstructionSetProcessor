
-- Module Name:    BarrelShifter - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BarrelShifter is
    Port ( input0 : in  std_ulogic_vector(15 downto 0);
           input1 : in  std_ulogic_vector(15 downto 0);
           input2 : in  std_ulogic_vector(15 downto 0);
           input3 : in  std_ulogic_vector(15 downto 0);
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           Y0 : out  std_ulogic_vector(15 downto 0);
           Y1 : out  std_ulogic_vector(15 downto 0);
           Y2 : out  std_ulogic_vector(15 downto 0);
           Y3 : out  std_ulogic_vector(15 downto 0));
end BarrelShifter;

architecture Behavioral of BarrelShifter is
--Mux
COMPONENT Mux_barrel
PORT(
	in_0 : in  std_ulogic_vector(15 downto 0);
	in_1 : in  std_ulogic_vector(15 downto 0);
   in_2 : in  std_ulogic_vector(15 downto 0);
   in_3 : in  std_ulogic_vector(15 downto 0);
	Select0 : in STD_LOGIC;
	Select1 : in STD_LOGIC;
   out_0: out  std_ulogic_vector(15 downto 0));
	END COMPONENT;
	
begin

--Mux0
Mux0 : Mux_barrel PORT MAP(
			in_0 => input0,
			in_1 => input3,
			in_2 => input2,
			in_3 => input1,
			Select0 => s0,
			Select1 => s1,
			out_0 => Y0
			);
--Mux1
Mux1 : Mux_barrel PORT MAP(
			in_0 => input1,
			in_1 => input0,
			in_2 => input3,
			in_3 => input2,
			Select0 => s0,
			Select1 => s1,
			out_0 => Y1
			);
			
--Mux2
Mux2 : Mux_barrel PORT MAP(
			in_0 => input2,
			in_1 => input1,
			in_2 => input0,
			in_3 => input3,
			Select0 => s0,
			Select1 => s1,
			out_0 => Y2
			);
			
--Mux3
Mux3 : Mux_barrel PORT MAP(
			in_0 => input3,
			in_1 => input2,
			in_2 => input1,
			in_3 => input0,
			Select0 => s0,
			Select1 => s1,
			out_0 => Y3
			);
			
end Behavioral;

