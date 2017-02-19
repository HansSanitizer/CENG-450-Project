----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:07 02/09/2017 
-- Design Name: 
-- Module Name:    cpu_file - Structure 
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

entity cpu_file is
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
end cpu_file;

architecture Structure of cpu_file is

component register_file is
	port(rst : in std_logic; clk: in std_logic;
		--read signals
		rd_index1: in std_logic_vector(2 downto 0); 
		rd_index2: in std_logic_vector(2 downto 0); 
		rd_data1: out std_logic_vector(15 downto 0); 
		rd_data2: out std_logic_vector(15 downto 0);
		--write signals
		wr_index: in std_logic_vector(2 downto 0); 
		wr_data: in std_logic_vector(15 downto 0); wr_enable: in std_logic);
end component;

component alu_file is
	Port ( in1 : in  STD_LOGIC_VECTOR(15 downto 0);
		in2 : in  STD_LOGIC_VECTOR(15 downto 0);
		alu_mode : in  STD_LOGIC_VECTOR(2 downto 0);
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		result : out  STD_LOGIC_VECTOR(15 downto 0);
		z_flag : out  STD_LOGIC;
		n_flag : out  STD_LOGIC);
end component;

SIGNAL data1, data2: std_logic_vector(15 downto 0);

begin

alu0: alu_file port map (data1, data2, alu_mode ,clk, rst, result, z_flag, n_flag);
reg0: register_file port map (rst, clk, rd_index1, rd_index2, data1, data2, wr_index, wr_data, wr_enable);

end Structure;

