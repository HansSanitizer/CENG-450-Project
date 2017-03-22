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
	Port (	clk: IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- Control Unit INSTRUCTION DECODE Signals
				instr_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				op_index1: IN STD_LOGIC_VECTOR(2 downto 0); 
				op_index2: IN STD_LOGIC_VECTOR(2 downto 0);
				op_m1_in : IN STD_LOGIC;				
				alu_code : IN  STD_LOGIC_VECTOR(2 downto 0);
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				data1_select : IN STD_LOGIC_VECTOR(1 downto 0);
				data2_select : IN STD_LOGIC_VECTOR(1 downto 0);
				immediate : IN STD_LOGIC_VECTOR(7 downto 0);
				disp_data : IN STD_LOGIC_VECTOR(8 downto 0);
				stall_en : IN STD_LOGIC;
				fstall_en : IN STD_LOGIC;
				-- Control Unit EXECUTE Signals
				opcode_EXE_CU : OUT STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_EXE_CU : OUT STD_LOGIC_VECTOR(2 downto 0);
				zero_flag : OUT STD_LOGIC;
				ngtv_flag : OUT STD_LOGIC;
				pcwr_en : IN STD_LOGIC;
				wraddr_sel : IN STD_LOGIC;
				result_sel : IN STD_LOGIC_VECTOR(1 downto 0);
				-- Control Unit MEMORY Signals
				dest_addr_MEM_CU : OUT STD_LOGIC_VECTOR(2 downto 0);
				mem_wr_en : IN STD_LOGIC;
				mem_data_sel : IN STD_LOGIC;
				-- Control Unit WRITE BACK Signals
				dest_addr_WB_CU : OUT STD_LOGIC_VECTOR(2 downto 0);
				wr_data: IN STD_LOGIC_VECTOR(15 downto 0);
				wb_mux_select: IN STD_LOGIC; -- 1 external, 0 write back
				wr_enable: IN STD_LOGIC;
				wr_mode_select : IN STD_LOGIC_VECTOR(1 downto 0);
				wb_opcode: OUT STD_LOGIC_VECTOR(6 downto 0);
				wb_opm1 : OUT STD_LOGIC;
				-- FOR TESTING
				result: OUT STD_LOGIC_VECTOR(15 downto 0));
end cpu_file;

architecture Structure of cpu_file is

-- IF Components

component program_counter is
	port (	clk : IN STD_LOGIC;
				hold : IN STD_LOGIC;
				fhold : IN STD_LOGIC;
				write_en : IN STD_LOGIC;
				next_value : IN STD_LOGIC_VECTOR(15 downto 0);
				overwrite_value : IN STD_LOGIC_VECTOR(15 downto 0);
				current_value : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component pc_incrementor is
	port (	input : IN STD_LOGIC_VECTOR(15 downto 0);
				output : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component ROM_VHDL is
    port(
         clk      : in  std_logic;
         addr     : in  std_logic_vector (15 downto 0);
         data     : out std_logic_vector (15 downto 0)
         );
end component;

-- DECODE Components

component reg_wrdata_mux is
	port ( 	ext_select : IN STD_LOGIC;
				wb_data : IN STD_LOGIC_VECTOR(15 downto 0);
				ext_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
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
		wr_mode: IN STD_LOGIC_VECTOR(1 downto 0);
		wr_enable: in std_logic);
end component;

component op1_data_mux is
	Port (	data_select: IN STD_LOGIC_VECTOR(1 downto 0);
				immediate : IN STD_LOGIC_VECTOR(7 downto 0);
				pc_value : IN STD_LOGIC_VECTOR(15 downto 0);
				reg_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component op2_data_mux is
	Port (	data_select: IN STD_LOGIC_VECTOR(1 downto 0);
				immediate : IN STD_LOGIC_VECTOR(7 downto 0);
				displacement : IN STD_LOGIC_VECTOR(8 downto 0);
				reg_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

-- EXE Components

component alu_file is
	Port ( in1 : in  STD_LOGIC_VECTOR(15 downto 0);
		in2 : in  STD_LOGIC_VECTOR(15 downto 0);
		alu_mode : in  STD_LOGIC_VECTOR(2 downto 0);
		result : out  STD_LOGIC_VECTOR(15 downto 0);
		z_flag : out  STD_LOGIC;
		n_flag : out  STD_LOGIC);
end component;

component result_data_mux is
	Port (	data_select: IN STD_LOGIC_VECTOR(1 downto 0);
				op1_data : IN STD_LOGIC_VECTOR(15 downto 0);
				pc_value : IN STD_LOGIC_VECTOR(15 downto 0);
				alu_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component wraddr_mux is
	Port (	data_select: IN STD_LOGIC;
				dest_addr : IN STD_LOGIC_VECTOR(2 downto 0);
				data : OUT STD_LOGIC_VECTOR(2 downto 0));
end component;

-- MEM Components

component RAM_VHDL is
	generic(N : integer := 8; M : integer := 8);
	port(
		clk, we : in  STD_LOGIC;
		adr     : in  STD_LOGIC_VECTOR(15 downto 0);
		din     : in  STD_LOGIC_VECTOR(15 downto 0);
		dout    : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component mem_data_mux is
	Port (	data_select: IN STD_LOGIC;
				result_data : IN STD_LOGIC_VECTOR(15 downto 0);
				mem_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

-- Inter-stage pipeline registers

component reg_IF_ID is
	port(	clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			hold : IN STD_LOGIC;
			instr_in : IN STD_LOGIC_VECTOR(15 downto 0);
			pc_in : IN STD_LOGIC_VECTOR(15 downto 0);
			instr_out : OUT STD_LOGIC_VECTOR(15 downto 0);
			pc_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component reg_ID_EXE is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- Control Unit read signals
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				alu_in : IN STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op_m1_in : IN STD_LOGIC;
				-- Next PC Value
				next_pc_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- Register File read signals
				op1_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				op2_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- write signals
				next_pc_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				opcode_out : OUT STD_LOGIC_VECTOR(6 downto 0);
				alu_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op_m1_out : OUT STD_LOGIC;
				op1_data_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				op2_data_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component reg_EXE_MEM is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- EXE Stage Read Signals
				op2_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op_m1_in : IN STD_LOGIC;
				-- ALU Read Signals
				result_in : IN STD_LOGIC_VECTOR(15 downto 0);
				z_flag_in : IN STD_LOGIC;
				n_flag_in : IN STD_LOGIC;
				-- Write Signals
				op2_data_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				opcode_out : OUT STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op_m1_out : OUT STD_LOGIC;
				result_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				z_flag_out : OUT STD_LOGIC;
				n_flag_out : OUT STD_LOGIC);
end component;

component reg_MEM_WB is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- MEM Stage Read Signals
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op_m1_in : IN STD_LOGIC;
				result_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- Write Signals
				opcode_out : OUT STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_out: OUT STD_LOGIC_VECTOR(2 downto 0);
				op_m1_out : OUT STD_LOGIC;
				result_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

signal currentPC, nextPC : STD_LOGIC_VECTOR(15 downto 0);
signal instructionFETCH : STD_LOGIC_VECTOR(15 downto 0);
signal pcValue, pcNextValueEXE : STD_LOGIC_VECTOR(15 downto 0);
signal regOpData1, regOpData2, muxOpData1, muxOpData2 : STD_LOGIC_VECTOR(15 downto 0);
signal aluOpData1, aluOpData2, aluResult, resultMux : STD_LOGIC_VECTOR(15 downto 0);
signal aluCode : STD_LOGIC_VECTOR(2 downto 0);
signal stallEnable, fstallEnable : STD_LOGIC;

signal opcode_EXE : STD_LOGIC_VECTOR(6 downto 0);
signal dest_addr_EXE, dest_addr_EXMUX : STD_LOGIC_VECTOR(2 downto 0);
signal operandM1_EXE : STD_LOGIC;
signal operand2Data : STD_LOGIC_VECTOR(15 downto 0);

signal opcode_MEM : STD_LOGIC_VECTOR(6 downto 0);
signal dest_addr_MEM : STD_LOGIC_VECTOR(2 downto 0);
signal result_MEM, memoryData, memDataMux : STD_LOGIC_VECTOR(15 downto 0);
signal zeroFlag, negativeFlag, operandM1_MEM : STD_LOGIC;

signal writeAddress : STD_LOGIC_VECTOR(2 downto 0);
signal writeData, wbMuxData : STD_LOGIC_VECTOR(15 downto 0);

begin

stallEnable <= stall_en;
fstallEnable <= fstall_en;

opcode_EXE_CU <= opcode_EXE;

dest_addr_EXE_CU <= dest_addr_EXE;
dest_addr_MEM_CU <= dest_addr_MEM;
dest_addr_WB_CU <= writeAddress;

--TESTING
result <= writeData;

-- ISTRUCTION FETCH

pc0: program_counter port map (
	clk => clk,
	hold  => stallEnable,
	write_en => pcwr_en, -- From CU
	fhold => fstallEnable,
	next_value => nextPC,
	overwrite_value => aluResult, -- Forwarded from EXE
	current_value => currentPC);
	
pc1: pc_incrementor port map (
	input => currentPC,
	output => nextPC);

rom0: ROM_VHDL port map (
	clk => clk,
	addr => currentPC,
	data => instructionFETCH);

-- IF/ID

ifid0: reg_IF_ID port map (
	clk => clk, 
	rst => fstallEnable,
	hold => stallEnable,
	pc_in => currentPC,
	instr_in => instructionFETCH,
	pc_out => pcValue,
	instr_out => instr_out);

-- INSTRUCTION DECODE
	
reg0: register_file port map (
	clk => clk,
	rst => rst, 
	rd_index1 => op_index1, 
	rd_index2 => op_index2,
	rd_data1 => regOpData1,
	rd_data2 => regOpData2, 
	wr_index => writeAddress,
	wr_data => wbMuxData,
	wr_mode => wr_mode_select, -- From CU
	wr_enable => wr_enable);

mux1: op1_data_mux port map (
	data_select => data1_select, -- From CU
	immediate => immediate, -- From CU
	pc_value => pcValue,
	reg_data => regOpData1,
	data => muxOpData1);

mux2: op2_data_mux port map (
	data_select => data2_select, -- From CU
	immediate => immediate, -- From CU
	displacement => disp_data, -- From CU
	reg_data => regOpData2,
	data => muxOpData2);	

-- ID/EXE

idexe0: reg_ID_EXE port map (
	clk => clk, 
	rst => stallEnable,
	next_pc_in => currentPC,
	opcode_in => opcode_in,
	alu_in => alu_code,
	dest_addr_in => dest_addr_in,
	op_m1_in => op_m1_in, 
	op1_data_in => muxOpData1,
	op2_data_in => muxOpData2,
	next_pc_out => pcNextValueEXE,
	opcode_out => opcode_EXE,
	alu_out => aluCode,
	dest_addr_out => dest_addr_EXE,
	op_m1_out => operandM1_EXE,
	op1_data_out => aluOpData1,
	op2_data_out => aluOpData2);

-- EXECUTE

alu0: alu_file port map (
	in1 => aluOpData1,
	in2 => aluOpData2,
	alu_mode => aluCode ,
	result => aluResult,
	z_flag => zeroFlag,
	n_flag => negativeFlag);
	
mux3: result_data_mux port map (
	data_select => result_sel, -- From CU
	op1_data => aluOpData1,
	pc_value => pcNextValueEXE,
	alu_data => aluResult,
	data => resultMux);
	
mux4: wraddr_mux port map (
	data_select => wraddr_sel, -- From CU
	dest_addr => dest_addr_EXE,
	data => dest_addr_EXMUX);

-- EXE/MEM

exemem0: reg_EXE_MEM port map (
	clk => clk,
	rst => rst,
	op2_data_in => aluOpData2,
	opcode_in => opcode_EXE,
	dest_addr_in => dest_addr_EXMUX,
	op_m1_in => operandM1_EXE,
	result_in => resultMux,
	z_flag_in => zeroFlag,
	n_flag_in => negativeFlag,
	op2_data_out => operand2Data,
	opcode_out => opcode_MEM,
	dest_addr_out => dest_addr_MEM,
	op_m1_out => operandM1_MEM,
	result_out => result_MEM,
	z_flag_out => zero_flag,
	n_flag_out => ngtv_flag);


-- MEMORY

ram0: RAM_VHDL port map (
	clk => clk,
	we => mem_wr_en, -- From CU
	adr => result_MEM,
	din => operand2Data,
	dout => memoryData);
	
mux5: mem_data_mux port map (
	data_select => mem_data_sel, -- From CU
	result_data => result_MEM,
	mem_data => memoryData,
	data => memDataMux);
	
-- MEM/WB
	
memwb0: reg_MEM_WB port map (
	clk => clk,
	rst => rst,
	opcode_in => opcode_MEM,
	dest_addr_in => dest_addr_MEM,
	op_m1_in => operandM1_MEM,
	result_in => memDataMux,
	opcode_out => wb_opcode, -- To CU
	dest_addr_out => writeAddress,
	op_m1_out => wb_opm1, -- To CU
	result_out => writeData);

-- WRITE BACK

mux0: reg_wrdata_mux port map (
	ext_select => wb_mux_select, -- Fom CU
	wb_data => writeData,
	ext_data => wr_data, -- From CU
	data => wbMuxData);

end Structure;

