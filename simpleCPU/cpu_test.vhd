--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:29:25 02/09/2017
-- Design Name:   
-- Module Name:   C:/Users/tlong/Documents/CENG450/simpleCPU/cpu_test.vhd
-- Project Name:  simpleCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpu_file
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
 
ENTITY cpu_test IS
END cpu_test;
 
ARCHITECTURE behavior OF cpu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpu_file
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         rd_index1 : IN  std_logic_vector(2 downto 0);
         rd_index2 : IN  std_logic_vector(2 downto 0);
         wr_index : IN  std_logic_vector(2 downto 0);
         wr_data : IN  std_logic_vector(15 downto 0);
         wr_enable : IN  std_logic;
         alu_mode : IN  std_logic_vector(2 downto 0);
         result : OUT  std_logic_vector(15 downto 0);
         z_flag : OUT  std_logic;
         n_flag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal rd_index1 : std_logic_vector(2 downto 0) := (others => '0');
   signal rd_index2 : std_logic_vector(2 downto 0) := (others => '0');
   signal wr_index : std_logic_vector(2 downto 0) := (others => '0');
   signal wr_data : std_logic_vector(15 downto 0) := (others => '0');
   signal wr_enable : std_logic := '0';
   signal alu_mode : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
   signal z_flag : std_logic;
   signal n_flag : std_logic;

   -- Clock period definitions
   constant clk_period : time := 80 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpu_file PORT MAP (
          rst => rst,
          clk => clk,
          rd_index1 => rd_index1,
          rd_index2 => rd_index2,
          wr_index => wr_index,
          wr_data => wr_data,
          wr_enable => wr_enable,
          alu_mode => alu_mode,
          result => result,
          z_flag => z_flag,
          n_flag => n_flag
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
