
-- Module Name:    RAM_64K_8 - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity RAM_64K_8 is
    Port ( Input_data : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Address : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           Chip_Sel : in  STD_LOGIC;
           ReadWrite : in  STD_LOGIC;
           Output_data : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end RAM_64K_8;

architecture Behavioral of RAM_64K_8 is

COMPONENT Decoder3x8
	 PORT ( Address0 : in  STD_LOGIC;
           Address1 : in  STD_LOGIC;
           Address2 : in  STD_LOGIC;
			  CS : in STD_LOGIC;
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out  STD_LOGIC;
           Q6 : out  STD_LOGIC;
           Q7 : out  STD_LOGIC;
           Q8 : out  STD_LOGIC;
           Q9 : out  STD_LOGIC;
           Q10 : out  STD_LOGIC;
           Q11 : out  STD_LOGIC;
           Q12 : out  STD_LOGIC;
           Q13 : out  STD_LOGIC;
           Q14 : out  STD_LOGIC;
           Q15 : out  STD_LOGIC
			  );
END COMPONENT;

COMPONENT Memory_Cell
PORT (
	  Input : in  STD_LOGIC;
      Read_Write : in  STD_LOGIC;
      Sel : in  STD_LOGIC;
      Output : out  STD_LOGIC
		);
END COMPONENT;

signal R0_Q_CS, R1_Q_CS, R2_Q_CS, R3_Q_CS,
		 R4_Q_CS, R5_Q_CS, R6_Q_CS, R7_Q_CS,
		 R8_Q_CS, R9_Q_CS, R10_Q_CS, R11_Q_CS,
		 R12_Q_CS, R13_Q_CS, R14_Q_CS, R15_Q_CS : STD_LOGIC;
begin

--Decoder
	Decoder: Decoder3x8 PORT MAP(
		 Address0 => Address(0),
		 Address1 => Address(1),
       Address2 => Address(2),
		 CS => Chip_Sel,
       Q0 => R0_Q_CS,
       Q1 => R1_Q_CS, 
       Q2 => R2_Q_CS,
       Q3 => R3_Q_CS,
		 Q4 => R4_Q_CS,
       Q5 => R5_Q_CS,
       Q6 => R6_Q_CS,
       Q7 => R7_Q_CS
		 );
		 
--ROW 0
--Memory Cell (0,0)
	MC0_0 : Memory_Cell PORT MAP(
		Input => Input_data(0),
      Read_Write => ReadWrite,
      Sel => R0_Q_CS,
      Output => Output_data(0) 
		);

--Memory Cell (0,1)
	MC0_1 : Memory_Cell PORT MAP(
		Input => Input_data(1),
      Read_Write => ReadWrite,
      Sel => R0_Q_CS,
      Output => Output_data(1)
		);
		
--Memory Cell (0,2)
	MC0_2 : Memory_Cell PORT MAP(
		Input => Input_data(2),
      Read_Write => ReadWrite,
      Sel => R0_Q_CS,
      Output => Output_data(2)
		);
		
--Memory Cell (0,3)
	MC0_3 : Memory_Cell PORT MAP(
		Input => Input_data(3),
      Read_Write => ReadWrite,
      Sel => R0_Q_CS,
      Output => Output_data(3)
		);
		
--Memory Cell (0,4)
	MC0_4 : Memory_Cell PORT MAP(
		Input => Input_data(4),
      Read_Write => ReadWrite,
      Sel => R0_Q_CS,
      Output => Output_data(4)
		);

--Memory Cell (0,5)
	MC0_5 : Memory_Cell PORT MAP(
		Input => Input_data(5),
      Read_Write => ReadWrite,
      Sel => R0_Q_CS,
      Output => Output_data(5)
		);
		
--Memory Cell (0,6)
	MC0_6 : Memory_Cell PORT MAP(
		Input => Input_data(6),
      Read_Write => ReadWrite,
      Sel => R0_Q_CS,
      Output => Output_data(6)
		);
		
--Memory Cell (0,7)
	MC0_7 : Memory_Cell PORT MAP(
		Input => Input_data(7),
      Read_Write => ReadWrite,
      Sel => R0_Q_CS,
      Output => Output_data(7)
		);
		
--ROW 1
--Memory Cell (1,0)
	MC1_0 : Memory_Cell PORT MAP(
		Input => Input_data(0),
      Read_Write => ReadWrite,
      Sel => R1_Q_CS,
      Output => Output_data(0)
		);

--Memory Cell (1,1)
	MC1_1 : Memory_Cell PORT MAP(
		Input => Input_data(1),
      Read_Write => ReadWrite,
      Sel => R1_Q_CS,
      Output => Output_data(1)
		);

--Memory Cell (1,2)
	MC1_2 : Memory_Cell PORT MAP(
		Input => Input_data(2),
      Read_Write => ReadWrite,
      Sel => R1_Q_CS,
      Output => Output_data(2)
		);

--Memory Cell (1,3)
	MC1_3 : Memory_Cell PORT MAP(
		Input => Input_data(3),
      Read_Write => ReadWrite,
      Sel => R1_Q_CS,
      Output => Output_data(3)
		);

--Memory Cell (1,4)
	MC1_4 : Memory_Cell PORT MAP(
		Input => Input_data(4),
      Read_Write => ReadWrite,
      Sel => R1_Q_CS,
      Output => Output_data(4)
		);

--Memory Cell (1,5)
	MC1_5 : Memory_Cell PORT MAP(
		Input => Input_data(5),
      Read_Write => ReadWrite,
      Sel => R1_Q_CS,
      Output => Output_data(5)
		);
		
--Memory Cell (1,6)
	MC1_6 : Memory_Cell PORT MAP(
		Input => Input_data(6),
      Read_Write => ReadWrite,
      Sel => R1_Q_CS,
      Output => Output_data(6)
		);
		
--Memory Cell (1,7)
	MC1_7 : Memory_Cell PORT MAP(
		Input => Input_data(7),
      Read_Write => ReadWrite,
      Sel => R1_Q_CS,
      Output => Output_data(7)
		);

--ROW 2	
--Memory Cell (2,0)
	MC2_0 : Memory_Cell PORT MAP(
		Input => Input_data(0),
      Read_Write => ReadWrite,
      Sel => R2_Q_CS,
      Output => Output_data(0)
		);

--Memory Cell (2,1)
	MC2_1 : Memory_Cell PORT MAP(
		Input => Input_data(1),
      Read_Write => ReadWrite,
      Sel => R2_Q_CS,
      Output => Output_data(1)
		);
		
--Memory Cell (2,2)
	MC2_2 : Memory_Cell PORT MAP(
		Input => Input_data(2),
      Read_Write => ReadWrite,
      Sel => R2_Q_CS,
      Output => Output_data(2)
		);
		
--Memory Cell (2,3)
	MC2_3 : Memory_Cell PORT MAP(
		Input => Input_data(3),
      Read_Write => ReadWrite,
      Sel => R2_Q_CS,
      Output => Output_data(3)
		);

--Memory Cell (2,4)
	MC2_4 : Memory_Cell PORT MAP(
		Input => Input_data(4),
      Read_Write => ReadWrite,
      Sel => R2_Q_CS,
      Output => Output_data(4)
		);

--Memory Cell (2,5)
	MC2_5 : Memory_Cell PORT MAP(
		Input => Input_data(5),
      Read_Write => ReadWrite,
      Sel => R2_Q_CS,
      Output => Output_data(5)
		);
		
--Memory Cell (2,6)
	MC2_6 : Memory_Cell PORT MAP(
		Input => Input_data(6),
      Read_Write => ReadWrite,
      Sel => R2_Q_CS,
      Output => Output_data(6)
		);
		
--Memory Cell (2,7)
	MC2_7 : Memory_Cell PORT MAP(
		Input => Input_data(7),
      Read_Write => ReadWrite,
      Sel => R2_Q_CS,
      Output => Output_data(7)
		);

--ROW 3		
--Memory Cell (3,0)
	MC3_0 : Memory_Cell PORT MAP(
		Input => Input_data(0),
      Read_Write => ReadWrite,
      Sel => R3_Q_CS,
      Output => Output_data(0)
		);

--Memory Cell (3,1)
	MC3_1 : Memory_Cell PORT MAP(
		Input => Input_data(1),
      Read_Write => ReadWrite,
      Sel => R3_Q_CS,
      Output => Output_data(1)
		);
		
--Memory Cell (3,2)
	MC3_2 : Memory_Cell PORT MAP(
		Input => Input_data(2),
      Read_Write => ReadWrite,
      Sel => R3_Q_CS,
      Output => Output_data(2)
		);
		
--Memory Cell (3,3)
	MC3_3 : Memory_Cell PORT MAP(
		Input => Input_data(3),
      Read_Write => ReadWrite,
      Sel => R3_Q_CS,
      Output => Output_data(3)
		);

--Memory Cell (3,4)
	MC3_4 : Memory_Cell PORT MAP(
		Input => Input_data(4),
      Read_Write => ReadWrite,
      Sel => R3_Q_CS,
      Output => Output_data(4)
		);

--Memory Cell (3,5)
	MC3_5 : Memory_Cell PORT MAP(
		Input => Input_data(5),
      Read_Write => ReadWrite,
      Sel => R3_Q_CS,
      Output => Output_data(5)
		);
		
--Memory Cell (3,6)
	MC3_6 : Memory_Cell PORT MAP(
		Input => Input_data(6),
      Read_Write => ReadWrite,
      Sel => R3_Q_CS,
      Output => Output_data(6)
		);
		
--Memory Cell (3,7)
	MC3_7 : Memory_Cell PORT MAP(
		Input => Input_data(7),
      Read_Write => ReadWrite,
      Sel => R3_Q_CS,
      Output => Output_data(7)
		);
	
--ROW 4	
--Memory Cell (4,0)
	MC4_0 : Memory_Cell PORT MAP(
		Input => Input_data(0),
      Read_Write => ReadWrite,
      Sel => R4_Q_CS,
      Output => Output_data(0)
		);

--Memory Cell (4,1)
	MC4_1 : Memory_Cell PORT MAP(
		Input => Input_data(1),
      Read_Write => ReadWrite,
      Sel => R4_Q_CS,
      Output => Output_data(1)
		);

--Memory Cell (4,2)
	MC4_2 : Memory_Cell PORT MAP(
		Input => Input_data(2),
      Read_Write => ReadWrite,
      Sel => R4_Q_CS,
      Output => Output_data(2)
		);

--Memory Cell (4,3)
	MC4_3 : Memory_Cell PORT MAP(
		Input => Input_data(3),
      Read_Write => ReadWrite,
      Sel => R4_Q_CS,
      Output => Output_data(3)
		);

--Memory Cell (4,4)
	MC4_4 : Memory_Cell PORT MAP(
		Input => Input_data(4),
      Read_Write => ReadWrite,
      Sel => R4_Q_CS,
      Output => Output_data(4)
		);

--Memory Cell (4,5)
	MC4_5 : Memory_Cell PORT MAP(
		Input => Input_data(5),
      Read_Write => ReadWrite,
      Sel => R4_Q_CS,
      Output => Output_data(5)
		);
		
--Memory Cell (4,6)
	MC4_6 : Memory_Cell PORT MAP(
		Input => Input_data(6),
      Read_Write => ReadWrite,
      Sel => R4_Q_CS,
      Output => Output_data(6)
		);
		
--Memory Cell (4,7)
	MC4_7 : Memory_Cell PORT MAP(
		Input => Input_data(7),
      Read_Write => ReadWrite,
      Sel => R4_Q_CS,
      Output => Output_data(7)
		);
	
--ROWS 5
--Memory Cell (5,0)
	MC5_0 : Memory_Cell PORT MAP(
		Input => Input_data(0),
      Read_Write => ReadWrite,
      Sel => R5_Q_CS,
      Output => Output_data(0)
		);

--Memory Cell (5,1)
	MC5_1 : Memory_Cell PORT MAP(
		Input => Input_data(1),
      Read_Write => ReadWrite,
      Sel => R5_Q_CS,
      Output => Output_data(1)
		);

--Memory Cell (5,2)
	MC5_2 : Memory_Cell PORT MAP(
		Input => Input_data(2),
      Read_Write => ReadWrite,
      Sel => R5_Q_CS,
      Output => Output_data(2)
		);

--Memory Cell (5,3)
	MC5_3 : Memory_Cell PORT MAP(
		Input => Input_data(3),
      Read_Write => ReadWrite,
      Sel => R5_Q_CS,
      Output => Output_data(3)
		);

--Memory Cell (5,4)
	MC5_4 : Memory_Cell PORT MAP(
		Input => Input_data(4),
      Read_Write => ReadWrite,
      Sel => R5_Q_CS,
      Output => Output_data(4)
		);

--Memory Cell (5,5)
	MC5_5 : Memory_Cell PORT MAP(
		Input => Input_data(5),
      Read_Write => ReadWrite,
      Sel => R5_Q_CS,
      Output => Output_data(5)
		);
		
--Memory Cell (5,6)
	MC5_6 : Memory_Cell PORT MAP(
		Input => Input_data(6),
      Read_Write => ReadWrite,
      Sel => R5_Q_CS,
      Output => Output_data(6)
		);
		
--Memory Cell (5,7)
	MC5_7 : Memory_Cell PORT MAP(
		Input => Input_data(7),
      Read_Write => ReadWrite,
      Sel => R5_Q_CS,
      Output => Output_data(7)
		);
	
--ROW 6
--Memory Cell (6,0)
	MC6_0 : Memory_Cell PORT MAP(
		Input => Input_data(0),
      Read_Write => ReadWrite,
      Sel => R6_Q_CS,
      Output => Output_data(0)
		);	

--Memory Cell (6,1)
	MC6_1 : Memory_Cell PORT MAP(
		Input => Input_data(1),
      Read_Write => ReadWrite,
      Sel => R6_Q_CS,
      Output => Output_data(1)
		);		
		
--Memory Cell (6,2)
	MC6_2 : Memory_Cell PORT MAP(
		Input => Input_data(2),
      Read_Write => ReadWrite,
      Sel => R6_Q_CS,
      Output => Output_data(2)
		);

--Memory Cell (6,3)
	MC6_3 : Memory_Cell PORT MAP(
		Input => Input_data(3),
      Read_Write => ReadWrite,
      Sel => R6_Q_CS,
      Output => Output_data(3)
		);	

--Memory Cell (6,4)
	MC6_4 : Memory_Cell PORT MAP(
		Input => Input_data(4),
      Read_Write => ReadWrite,
      Sel => R6_Q_CS,
      Output => Output_data(4)
		);

--Memory Cell (6,5)
	MC6_5 : Memory_Cell PORT MAP(
		Input => Input_data(5),
      Read_Write => ReadWrite,
      Sel => R6_Q_CS,
      Output => Output_data(5)
		);
		
--Memory Cell (6,6)
	MC6_6 : Memory_Cell PORT MAP(
		Input => Input_data(6),
      Read_Write => ReadWrite,
      Sel => R6_Q_CS,
      Output => Output_data(6)
		);
		
--Memory Cell (6,7)
	MC6_7 : Memory_Cell PORT MAP(
		Input => Input_data(7),
      Read_Write => ReadWrite,
      Sel => R6_Q_CS,
      Output => Output_data(7)
		);

--ROW 7
--Memory Cell (7,0)
	MC7_0 : Memory_Cell PORT MAP(
		Input => Input_data(0),
      Read_Write => ReadWrite,
      Sel => R7_Q_CS,
      Output => Output_data(0)
		);

--Memory Cell (7,1)
	MC7_1 : Memory_Cell PORT MAP(
		Input => Input_data(1),
      Read_Write => ReadWrite,
      Sel => R7_Q_CS,
      Output => Output_data(1)
		);
		
--Memory Cell (7,2)
	MC7_2 : Memory_Cell PORT MAP(
		Input => Input_data(2),
      Read_Write => ReadWrite,
      Sel => R7_Q_CS,
      Output => Output_data(2)
		);
		
--Memory Cell (7,3)
	MC7_3 : Memory_Cell PORT MAP(
		Input => Input_data(3),
      Read_Write => ReadWrite,
      Sel => R7_Q_CS,
      Output => Output_data(3)
		);

--Memory Cell (7,4)
	MC7_4 : Memory_Cell PORT MAP(
		Input => Input_data(4),
      Read_Write => ReadWrite,
      Sel => R7_Q_CS,
      Output => Output_data(4)
		);

--Memory Cell (7,5)
	MC7_5 : Memory_Cell PORT MAP(
		Input => Input_data(5),
      Read_Write => ReadWrite,
      Sel => R7_Q_CS,
      Output => Output_data(5)
		);
		
--Memory Cell (7,6)
	MC7_6 : Memory_Cell PORT MAP(
		Input => Input_data(6),
      Read_Write => ReadWrite,
      Sel => R7_Q_CS,
      Output => Output_data(6)
		);
		
--Memory Cell (7,7)
	MC7_7 : Memory_Cell PORT MAP(
		Input => Input_data(7),
      Read_Write => ReadWrite,
      Sel => R7_Q_CS,
      Output => Output_data(7)
		);
		
end Behavioral;

