
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:05:49 01/20/2008
-- Design Name:   count_mem
-- Module Name:   M:/Lab1/Count_Mem_VHDL/count_mem_tb_vhdl.vhd
-- Project Name:  Count_Mem_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: count_mem
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY count_mem_tb_vhdl_vhd IS
END count_mem_tb_vhdl_vhd;

ARCHITECTURE behavior OF count_mem_tb_vhdl_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT count_mem
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		CE : IN std_logic;          
		OUT_MEM : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL CLK :  std_logic := '0';
	SIGNAL RST :  std_logic := '0';
	SIGNAL CE :  std_logic := '0';

	--Outputs
	SIGNAL OUT_MEM :  std_logic_vector(7 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: count_mem PORT MAP(
		CLK => CLK,
		RST => RST,
		CE => CE,
		OUT_MEM => OUT_MEM
	);

   tb : PROCESS
   BEGIN
 	CLK <= '1';
	wait for 100 ns;
	CLK <= '0';
	wait for 100 ns;
   END PROCESS;

PROCESS
   BEGIN
	RST <= '1';
	CE <= '1';
	wait for 600 ns;
	RST <= '0';
	wait;
   END PROCESS;

END;