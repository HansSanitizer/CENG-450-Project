----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:11 03/07/2017 
-- Design Name: 
-- Module Name:    processorTopLevel - Structure 
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

entity processorTopLevel is
	Port (	clk: in STD_LOGIC;
				rst: in STD_LOGIC;
				stall : OUT STD_LOGIC;
				wr_data: IN STD_LOGIC_VECTOR(15 downto 0);
				io_switch_in: IN STD_LOGIC;
				result: OUT STD_LOGIC_VECTOR(15 downto 0));
end processorTopLevel;

architecture Structure of processorTopLevel is

component cpu_file is
	Port (	clk: IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- Control Unit INSTRUCTION DECODE Signals
				instr_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				op_index1: IN STD_LOGIC_VECTOR(2 downto 0); 
				op_index2: IN STD_LOGIC_VECTOR(2 downto 0);         
				alu_code : IN  STD_LOGIC_VECTOR(2 downto 0);
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				data1_select : IN STD_LOGIC_VECTOR(1 downto 0);
				data2_select : IN STD_LOGIC_VECTOR(1 downto 0);
				immediate : IN STD_LOGIC_VECTOR(3 downto 0);
				disp_data : IN STD_LOGIC_VECTOR(8 downto 0);
				stall_en : IN STD_LOGIC;
				fstall_en : IN STD_LOGIC;
				-- EXE Stage Signals Monitored by Control Unit
				opcode_EXE_CU : OUT STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_EXE_CU : OUT STD_LOGIC_VECTOR(2 downto 0);
				zero_flag : OUT STD_LOGIC;
				ngtv_flag : OUT STD_LOGIC;
				--op1_addr_EXE : OUT STD_LOGIC_VECTOR(2 downto 0);
				--op2_addr_EXE : OUT STD_LOGIC_VECTOR(2 downto 0);
				pcwr_en : IN STD_LOGIC;
				-- MEM Stage Signals Monitored by Control Unit
				dest_addr_MEM_CU : OUT STD_LOGIC_VECTOR(2 downto 0);
				-- Control Unit WRITE BACK Signals
				dest_addr_WB_CU : OUT STD_LOGIC_VECTOR(2 downto 0);
				wr_data: IN STD_LOGIC_VECTOR(15 downto 0);
				wb_mux_select: IN STD_LOGIC; -- 1 external, 0 write back
				wr_enable: IN STD_LOGIC;
				wb_opcode: OUT STD_LOGIC_VECTOR(6 downto 0);
				-- FOR TESTING
				result: OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component controlUnit_file is
    Port (	-- DECODE
    			io_switch_in : in STD_LOGIC;
				instruction : in STD_LOGIC_VECTOR(15 downto 0);
				opcode_out : out STD_LOGIC_VECTOR(6 downto 0);
				ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
				rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
				rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
				alu_code : out STD_LOGIC_VECTOR(2 downto 0);
				imm_data : OUT STD_LOGIC_VECTOR(3 downto 0);
				disp_data : OUT STD_LOGIC_VECTOR(8 downto 0);
				data1_select : OUT STD_LOGIC_VECTOR(1 downto 0);
				data2_select : OUT STD_LOGIC_VECTOR(1 downto 0);
				fetch_stall : OUT STD_LOGIC;
				stall : OUT STD_LOGIC;
				-- EXECUTE
				opcode_exe : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_exe : IN STD_LOGIC_VECTOR(2 downto 0);
				n_flag: IN STD_LOGIC;
				z_flag: IN STD_LOGIC;
				pc_write_en : OUT STD_LOGIC;
				-- MEMORY
				dest_addr_mem : IN STD_LOGIC_VECTOR(2 downto 0);
				-- WRITE BACK
				opcode_wb: IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_wb : IN STD_LOGIC_VECTOR(2 downto 0);
				wb_mux_sel: OUT STD_LOGIC;
				reg_wen : OUT STD_LOGIC);
end component;

signal instr : STD_LOGIC_VECTOR(15 downto 0);
signal opcodeID, opcodeEXE, opcodeWB : STD_LOGIC_VECTOR(6 downto 0);
signal ra, rb, rc, aluCode : STD_LOGIC_VECTOR(2 downto 0);
signal dest_addr_EXE, dest_addr_MEM, dest_addr_WB : STD_LOGIC_VECTOR(2 downto 0);
signal dispData : STD_LOGIC_VECTOR(8 downto 0);
signal immData : STD_LOGIC_VECTOR(3 downto 0);
signal data1Sel, data2Sel : STD_LOGIC_VECTOR(1 downto 0);
signal zeroFlag, negativeFlag : STD_LOGIC;
signal wen, wbSel, stallEnable, fetchStallEn, pcWriteEnable : STD_LOGIC;

begin

stall <= stallEnable;

ctrl0: controlUnit_file port map (
	io_switch_in => io_switch_in,
	instruction => instr,
	opcode_out => opcodeID,
	ra_addr => ra,
	rb_addr => rb,
	rc_addr => rc,
	alu_code => aluCode,
	imm_data => immData,
	disp_data => dispData,
	data1_select => data1Sel,
	data2_select => data2Sel,
	stall => stallEnable,
	fetch_stall => fetchStallEn,
	opcode_exe => opcodeEXE,
	dest_addr_exe => dest_addr_EXE,
	n_flag => negativeFlag,
	z_flag => zeroFlag,
	pc_write_en => pcWriteEnable,
	dest_addr_mem => dest_addr_MEM,
	dest_addr_wb => dest_addr_WB,
	opcode_wb => opcodeWB,
	wb_mux_sel => wbSel,
	reg_wen => wen);
	
cpu0: cpu_file port map (
	clk => clk,
	rst => rst,
	instr_out => instr,
	op_index1 => rb,
	op_index2 => rc,
	alu_code => aluCode,
	opcode_in => opcodeID,
	dest_addr_in => ra,
	data1_select => data1Sel, -- From CU
	data2_select => data2Sel, -- From CU
	immediate => immData, -- From CU
	disp_data => dispData, -- From CU
	stall_en => stallEnable, -- From CU
	fstall_en => fetchStallEn, -- From CU
	dest_addr_EXE_CU => dest_addr_EXE,
	opcode_EXE_CU => opcodeEXE, -- To CU
	zero_flag => zeroFlag,
	ngtv_flag => negativeFlag,
	pcwr_en => pcWriteEnable, -- From CU
	dest_addr_MEM_CU => dest_addr_MEM,
	dest_addr_WB_CU => dest_addr_WB,
	wr_data => wr_data, -- External
	wb_mux_select => wbSel, -- To CU
	wr_enable => wen,
	wb_opcode => opcodeWB, -- To CU
	result => result);

end Structure;

