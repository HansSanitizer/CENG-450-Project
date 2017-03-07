--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   12:00:06 02/24/2017
-- Design Name:
-- Module Name:   C:/Users/J-Lenovo14/OneDrive/3A 4A/CENG 450/CENG450Project/register_alu/alu_tb.vhd
-- Project Name:  register_alu
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: alu_file
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

ENTITY alu_tb IS
END alu_tb;

ARCHITECTURE behavior OF alu_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT alu_file
    PORT(
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         alu_mode : IN  std_logic_vector(2 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         result : OUT  std_logic_vector(15 downto 0);
         z_flag : OUT  std_logic;
         n_flag : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal in2 : std_logic_vector(15 downto 0) := (others => '0');
   signal alu_mode : std_logic_vector(2 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
   signal z_flag : std_logic;
   signal n_flag : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: alu_file PORT MAP (
          in1 => in1,
          in2 => in2,
          alu_mode => alu_mode,
          clk => clk,
          rst => rst,
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
		wait for clk_period*2;

		--Simple Add
		in1 <= X"0000";
		in2 <= X"0001";
		alu_mode <= "001";
		rst <= '0';
		wait for 100ns;

		--Simple Subtract
		in1 <= X"0010";
		in2 <= X"0001";
		alu_mode <= "010";
		rst <= '0';
		wait for 100ns;

		--Simple Multiply
		in1 <= X"0002";
		in2 <= X"0002";
		alu_mode <= "011";
		rst <= '0';
		wait for 100ns;

		--Simple Nand
		in1 <=X"0100";
		in2 <=X"0100";
		alu_mode <= "100";
		wait for 100ns;

		--SLL 0x01 by 1 bit left
		in1 <= X"0001";
		in2 <= X"0001";
		alu_mode <= "101";
		rst <= '0';
		wait for 100ns;

		--SRL 0x02 by 1 bit right
		in1 <= X"0002";
		in2 <= X"0001";
		alu_mode <= "110";
		rst <= '0';
		wait for 100ns;

		--SLL 0x0001 by 4 bit left
		in1 <= X"0001";
		in2 <= X"0004";
		alu_mode <= "101";
		rst <= '0';
		wait for 100ns;

		--SRL 0x0100 by 4 bit right
		in1 <= X"0100";
		in2 <= X"0004";
		alu_mode <= "110";
		rst <= '0';
		wait for 100ns;

    --Test Z flag
    --Zero value on in1
    in1 <=X"0000";
    in2 <=X"0001";
    alu_mode <= "111";
    rst <= '0';
    wait for 100ns;


    --Test N flag


      wait;
   end process;

END;
