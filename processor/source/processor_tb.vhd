--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:48 03/25/2017
-- Design Name:   
-- Module Name:   C:/Users/J-Lenovo14/OneDrive/3A 4A/CENG 450/CENG450Project/processor/source/processor_tb.vhd
-- Project Name:  processor
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
 
ENTITY processor_tb IS
END processor_tb;
 
ARCHITECTURE behavior OF processor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processorTopLevel
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         stall : OUT  std_logic;
         led_fwd_exe : OUT  std_logic;
         led_fwd_mem : OUT  std_logic;
         led_fwd_wb : OUT  std_logic;
         wr_data : IN  std_logic_vector(15 downto 0);
         io_switch_in : IN  std_logic;
         cathodes : OUT  std_logic_vector(6 downto 0);
         anodes : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal wr_data : std_logic_vector(15 downto 0) := (others => '0');
   signal io_switch_in : std_logic := '0';

 	--Outputs
   signal stall : std_logic;
   signal led_fwd_exe : std_logic;
   signal led_fwd_mem : std_logic;
   signal led_fwd_wb : std_logic;
   signal cathodes : std_logic_vector(6 downto 0);
   signal anodes : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processorTopLevel PORT MAP (
          clk => clk,
          rst => rst,
          stall => stall,
          led_fwd_exe => led_fwd_exe,
          led_fwd_mem => led_fwd_mem,
          led_fwd_wb => led_fwd_wb,
          wr_data => wr_data,
          io_switch_in => io_switch_in,
          cathodes => cathodes,
          anodes => anodes
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

      wr_data <= X"0001";
		
		wait for 60 ns;
		
		io_switch_in <= '1';
		wait for 40 ns;
		io_switch_in <= '0';
		
		wait for 40 ns;
		wr_data <= X"0002";
		io_switch_in <= '1';
		wait for 40 ns;
		io_switch_in <= '0';
		
		wait for 40 ns;
		io_switch_in <= '1';
		wait for 40 ns;
		io_switch_in <= '0';
		
		wait for 100 ns;
		io_switch_in <= '1';
		wait for 40 ns;
		io_switch_in <= '0';
		
		wait for 60 ns;
		
		io_switch_in <= '1';
		wait for 40 ns;
		io_switch_in <= '0';
		
		wait for 40 ns;
		wr_data <= X"0003";
		io_switch_in <= '1';
		wait for 40 ns;
		io_switch_in <= '0';
		
		wait for 40 ns;
		io_switch_in <= '1';
		wait for 40 ns;
		io_switch_in <= '0';

      wait;
   end process;

END;
