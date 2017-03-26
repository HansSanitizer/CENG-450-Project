----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:57 02/23/2017 
-- Design Name: 
-- Module Name:    reg_ID_EXE - Behavioral 
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

entity reg_ID_EXE is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				flush : IN STD_LOGIC;
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
end reg_ID_EXE;

architecture Behavioral of reg_ID_EXE is

signal pipeRegister : STD_LOGIC_VECTOR(61 downto 0) := (others => '0');

alias nextPC is pipeRegister (61 downto 46); -- PC+2
alias opCode is pipeRegister (45 downto 39);
alias aluCode is pipeRegister(38 downto 36);
alias destAddress is pipeRegister(35 downto 33);
alias operandM1 is pipeRegister(32);
alias operandData1 is pipeRegister(31 downto 16);
alias operandData2 is pipeRegister(15 downto 0);

begin

process(clk)
begin
	if(clk='0' and clk'event) then
		-- Falling edge action latch new data from previous stage
		if ((rst = '1') or (flush = '1')) then
			-- Clear register with reset signal
			pipeRegister <= (others => '0');
		else
			nextPC <= next_pc_in;
			opCode <= opcode_in;
			aluCode <= alu_in;
			destAddress <= dest_addr_in;
			operandM1 <= op_m1_in;
			operandData1 <= op1_data_in;
			operandData2 <= op2_data_in;
		end if;
	end if;
end process;

process(clk)
begin
	if(clk='1' and clk'event) then
		-- Send data out to next stage
		next_pc_out <= nextPC;
		opCode_out <= opCode;
		alu_out <= aluCode;
		dest_addr_out <= destAddress;
		op_m1_out <= operandM1;
		op1_data_out <= operandData1;
		op2_data_out <= operandData2;
	end if;
end process;

end Behavioral;

