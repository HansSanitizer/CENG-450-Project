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
	Port (	rst : in std_logic; clk: in std_logic;
				instr_in : IN STD_LOGIC_VECTOR(15 downto 0);
				instr_out : OUT STD_LOGIC_VECTOR(15 downto 0);
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
				n_flag : out  STD_LOGIC;
				-- Control Unit read signals
				alu_in : IN STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				-- write signals
				dest_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0));
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
		result : out  STD_LOGIC_VECTOR(15 downto 0);
		z_flag : out  STD_LOGIC;
		n_flag : out  STD_LOGIC);
end component;

-- Inter-stage pipeline registers

component reg_IF_ID is
	port(	clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			instr_in : IN STD_LOGIC_VECTOR(15 downto 0);
			instr_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component reg_ID_EXE is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- Control Unit read signals
				alu_in : IN STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				-- Register File read signals
				op1_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				op2_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- write signals
				alu_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op1_data_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				op2_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op2_data_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

--SIGNAL data1, data2: std_logic_vector(15 downto 0);
signal regOpData1, regOpData2, aluOpData1, aluOpData2 : STD_LOGIC_VECTOR(15 downto 0);
signal aluCode : STD_LOGIC_VECTOR(2 downto 0);

begin

ifid0: reg_IF_ID port map (clk, rst, instr_in, instr_out);
reg0: register_file port map (rst, clk, rd_index1, rd_index2, regOpData1, regOpData2, 
	wr_index, wr_data, wr_enable);
idexe0: reg_ID_EXE port map (clk, rst, alu_in, dest_addr_in, op1_addr_in, op2_addr_in, 
	regOpData1, regOpData2, aluCode, dest_addr_out, op1_addr_out, aluOpData1, op2_addr_out, aluOpData2);
alu0: alu_file port map (aluOpData1, aluOpData2, aluCode , result, z_flag, n_flag);


end Structure;

