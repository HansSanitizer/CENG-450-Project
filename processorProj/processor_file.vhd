----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:12 02/21/2017 
-- Design Name: 
-- Module Name:    processor_file - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
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

entity processor_file is
	port (
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		result : out  STD_LOGIC_VECTOR(15 downto 0);
      z_flag : out  STD_LOGIC;
      n_flag : out  STD_LOGIC);
end processor_file;

architecture Structure of processor_file is

component controlUnit_TopLevel is
		port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  reg_wd : out STD_LOGIC_VECTOR(15 downto 0);
			  reg_wen : out STD_LOGIC;
			  alu_code : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component cpu_file is
    Port ( rst : in std_logic; clk: in std_logic;
		--read signals
		rd_index1: in std_logic_vector(2 downto 0); 
		rd_index2: in std_logic_vector(2 downto 0); 
		--write signals
		wr_index: in std_logic_vector(2 downto 0); 
		wr_data: in std_logic_vector(15 downto 0);
		wr_enable: in std_logic;          
		alu_mode : in  STD_LOGIC_VECTOR(2 downto 0);
      result : out  STD_LOGIC_VECTOR(15 downto 0);
      z_flag : out  STD_LOGIC;
      n_flag : out  STD_LOGIC);
end component;

signal ra, rb, rc, alu: STD_LOGIC_VECTOR(2 downto 0);
signal data : STD_LOGIC_VECTOR(15 downto 0);
signal wen : STD_LOGIC;

begin

ctl0: controlUnit_TopLevel port map (clk, rst, ra, rb, rc, data, wen, alu);
cpu0: cpu_file port map (rst, clk, rb, rc, ra, data, wen, alu, result, z_flag, n_flag);

end Structure;

