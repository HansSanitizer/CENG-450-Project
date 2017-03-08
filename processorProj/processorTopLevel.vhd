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
				wr_data: IN STD_LOGIC_VECTOR(15 downto 0);
				result_out: OUT STD_LOGIC_VECTOR(15 downto 0));
end processorTopLevel;

architecture Structure of processorTopLevel is

component cpu_file is
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
end component;

component controlUnit_file is
    Port ( --clk : in  STD_LOGIC;
           --rst : in  STD_LOGIC;
			  instruction : in STD_LOGIC_VECTOR(15 downto 0);
			  opcode_out : out STD_LOGIC_VECTOR(6 downto 0);
			  ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  reg_waddr : out STD_LOGIC_VECTOR(2 downto 0);
			  reg_wen : out STD_LOGIC;
			  alu_code : out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal instr : STD_LOGIC_VECTOR(15 downto 0);
signal opcode : STD_LOGIC_VECTOR(6 downto 0);
signal ra, rb, rc, writeAddress, aluCode : STD_LOGIC_VECTOR(2 downto 0);
signal wen : STD_LOGIC;

begin

ctrl0: controlUnit_file port map (
	instruction => instr,
	opcode_out => opcode,
	ra_addr => ra,
	rb_addr => rb,
	rc_addr => rc,
	reg_waddr => writeAddress,
	reg_wen => wen,
	alu_code => aluCode);
	
cpu0: cpu_file port map (
	clk => clk,
	rst => rst,
	instr_out => instr,
	op_index1 => rb,
	op_index2 => rc,
	alu_code => aluCode,
	opcode_in => opcode,
	dest_addr_in => ra,
	--wr_index => writeAddress,
	--wr_data => wr_data,
	wr_enable => wen);

end Structure;

