--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:36:17 03/07/2017
-- Design Name:   
-- Module Name:   C:/Users/tlong/Documents/CENG-450-Project/processorProj/processorTestBench.vhd
-- Project Name:  processorProj
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processorTopLevel
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
 
ENTITY processorTestBench IS
END processorTestBench;
 
ARCHITECTURE behavior OF processorTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processorTopLevel
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
			stall : OUT STD_LOGIC;
         wr_data : IN  std_logic_vector(15 downto 0);
			io_switch_in: IN STD_LOGIC;
			result : OUT STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal wr_data : std_logic_vector(15 downto 0) := x"0003";
	signal io_switch_in : std_logic := '1';
	
	--Outputs
	signal result : STD_LOGIC_VECTOR(15 downto 0) := (others=>'0');
	signal stall : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processorTopLevel PORT MAP (
          clk => clk,
          rst => rst,
			 stall => stall,
          wr_data => wr_data,
			 io_switch_in => io_switch_in,
			 result => result
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

      wait;
   end process;

END;
