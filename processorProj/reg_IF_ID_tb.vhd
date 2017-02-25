--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:08:52 02/23/2017
-- Design Name:   
-- Module Name:   C:/Users/tlong/Documents/CENG450/processorProj/reg_IF_ID_tb.vhd
-- Project Name:  processorProj
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_IF_ID
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY reg_IF_ID_tb IS
END reg_IF_ID_tb;
 
ARCHITECTURE behavior OF reg_IF_ID_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_IF_ID
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         instr_in : IN  std_logic_vector(15 downto 0);
         instr_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal instr_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal instr_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_IF_ID PORT MAP (
          clk => clk,
          rst => rst,
          instr_in => instr_in,
          instr_out => instr_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here
		instr_in <= "0000000010101010";
		
		wait for clk_period*10;
		
		instr_in <= "1010000011110000";
		
		wait for clk_period*10;
		
		rst <= '1';
		instr_in <= "1111000011110000";
		
		wait for clk_period*10;
		rst <= '0';

      wait;
   end process;

END;
