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
	Port (	clk: in std_logic;
				rst : in std_logic;
				-- Control Unit Signals
				instr_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				op_index1: in std_logic_vector(2 downto 0); 
				op_index2: in std_logic_vector(2 downto 0);         
				alu_code : in  STD_LOGIC_VECTOR(2 downto 0);
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				-- EXE Stage Signals Monitored by Control Unit
				--opcode_EXE : OUT STD_LOGIC_VECTOR(6 downto 0);
				--dest_addr_EXE : OUT STD_LOGIC_VECTOR(2 downto 0);
				--op1_addr_EXE : OUT STD_LOGIC_VECTOR(2 downto 0);
				--op2_addr_EXE : OUT STD_LOGIC_VECTOR(2 downto 0);
				--write signals (From WB stage)
				--wr_index: in std_logic_vector(2 downto 0); 
				--wr_data: in std_logic_vector(15 downto 0);
				wr_enable: in std_logic);
end cpu_file;

architecture Structure of cpu_file is

component program_counter is
	port (	clk : IN STD_LOGIC;
				next_value : IN STD_LOGIC_VECTOR(6 downto 0);
				current_value : OUT STD_LOGIC_VECTOR(6 downto 0));
end component;

component pc_incrementor is
	port (	input : IN STD_LOGIC_VECTOR(6 downto 0);
				output : OUT STD_LOGIC_VECTOR(6 downto 0));
end component;

component ROM_VHDL is
    port(
         clk      : in  std_logic;
         addr     : in  std_logic_vector (6 downto 0);
         data     : out std_logic_vector (15 downto 0)
         );
end component;

component register_file is
	port(rst : in std_logic; clk: in std_logic;
		--read signals
		rd_index1: in std_logic_vector(2 downto 0); 
		rd_index2: in std_logic_vector(2 downto 0); 
		rd_data1: out std_logic_vector(15 downto 0); 
		rd_data2: out std_logic_vector(15 downto 0);
		--write signals
		wr_index: in std_logic_vector(2 downto 0); 
		wr_data: in std_logic_vector(15 downto 0);
		wr_enable: in std_logic);
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
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				alu_in : IN STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				-- Register File read signals
				op1_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				op2_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- Register Write signals
				opcode_out : OUT STD_LOGIC_VECTOR(6 downto 0);
				alu_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op1_data_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				op2_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op2_data_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component reg_EXE_MEM is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- EXE Stage Read Signals
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				-- ALU Read Signals
				result_in : IN STD_LOGIC_VECTOR(15 downto 0);
				z_flag_in : IN STD_LOGIC;
				n_flag_in : IN STD_LOGIC;
				-- Write Signals
				opcode_out : OUT STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				result_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component reg_MEM_WB is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- MEM Stage Read Signals
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				result_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- Write Signals
				opcode_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				dest_addr_out: OUT STD_LOGIC_VECTOR(2 downto 0);
				result_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

--SIGNAL data1, data2: std_logic_vector(15 downto 0);
signal currentPC, nextPC : STD_LOGIC_VECTOR(6 downto 0);
signal instructionFETCH : STD_LOGIC_VECTOR(15 downto 0);
signal regOpData1, regOpData2, aluOpData1, aluOpData2, aluResult : STD_LOGIC_VECTOR(15 downto 0);
signal aluCode : STD_LOGIC_VECTOR(2 downto 0);
signal zeroFlag, negFlag : STD_LOGIC;

signal opcode_EXE: STD_LOGIC_VECTOR(6 downto 0);
signal dest_addr_EXE, op1_addr_EXE, op2_addr_EXE : STD_LOGIC_VECTOR(2 downto 0);

signal opcode_MEM: STD_LOGIC_VECTOR(6 downto 0);
signal dest_addr_MEM, op1_addr_MEM, op2_addr_MEM : STD_LOGIC_VECTOR(2 downto 0);
signal result_MEM: STD_LOGIC_VECTOR(15 downto 0);

signal writeAddress: STD_LOGIC_VECTOR(2 downto 0);
signal writeData: STD_LOGIC_VECTOR(15 downto 0);

begin

pc0: program_counter port map (
	clk => clk,
	next_value => nextPC,
	current_value => currentPC);
	
pc1: pc_incrementor port map (
	input => currentPC,
	output => nextPC);

rom0: ROM_VHDL port map (
	clk => clk,
	addr => currentPC,
	data => instructionFETCH);

ifid0: reg_IF_ID port map (
	clk => clk, 
	rst => rst,
	instr_in => instructionFETCH,
	instr_out => instr_out);
	
reg0: register_file port map (
	clk => clk,
	rst => rst, 
	rd_index1 => op_index1, 
	rd_index2 => op_index2,
	rd_data1 => regOpData1,
	rd_data2 => regOpData2, 
	wr_index => writeAddress,
	wr_data => writeData,
	wr_enable => wr_enable);

idexe0: reg_ID_EXE port map (
	clk => clk, 
	rst => rst,
	opcode_in => opcode_in,
	alu_in => alu_code,
	dest_addr_in => dest_addr_in,
	op1_addr_in => op_index1,
	op2_addr_in => op_index2, 
	op1_data_in => regOpData1,
	op2_data_in => regOpData2,
	opcode_out => opcode_EXE,
	alu_out => aluCode,
	dest_addr_out => dest_addr_EXE,
	op1_addr_out => op1_addr_EXE,
	op1_data_out => aluOpData1,
	op2_addr_out => op2_addr_EXE,
	op2_data_out => aluOpData2);
	
alu0: alu_file port map (
	in1 => aluOpData1,
	in2 => aluOpData2,
	alu_mode => aluCode ,
	result => aluResult,
	z_flag => zeroFlag,
	n_flag => negFlag);
	
exemem0: reg_EXE_MEM port map (
	clk => clk,
	rst => rst,
	opcode_in => opcode_EXE,
	dest_addr_in => dest_addr_EXE,
	op1_addr_in => op1_addr_EXE,
	op2_addr_in => op2_addr_EXE,
	result_in => aluResult,
	z_flag_in => zeroFlag,
	n_flag_in => negFlag,
	opcode_out => opcode_MEM,
	dest_addr_out => dest_addr_MEM,
	op1_addr_out => op1_addr_MEM,
	op2_addr_out => op2_addr_MEM,
	result_out => result_MEM);
	
memwb0: reg_MEM_WB port map (
	clk => clk,
	rst => rst,
	opcode_in => opcode_MEM,
	dest_addr_in => dest_addr_MEM,
	op1_addr_in => op1_addr_MEM,
	op2_addr_in => op2_addr_MEM,
	result_in => result_MEM,
	opcode_out => open,
	dest_addr_out => writeAddress,
	result_out => writeData);

end Structure;

