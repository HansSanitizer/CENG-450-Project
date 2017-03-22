----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:08 03/02/2017 
-- Design Name: 
-- Module Name:    reg_EXE_MEM - Behavioral 
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

entity reg_EXE_MEM is
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
end reg_EXE_MEM;

architecture Behavioral of reg_EXE_MEM is

signal pipeRegister : STD_LOGIC_VECTOR(44 downto 0) := (others => '0');
attribute S: string;
attribute S of pipeRegister: signal is "Yes";

alias operand2Data is pipeRegister(44 downto 29);
alias opcode is pipeRegister(28 downto 22);
alias destAddress is pipeRegister(21 downto 19);
alias operandM1 is pipeRegister(18);
alias aluResult is pipeRegister(17 downto 2);
alias zeroFlag is pipeRegister(1);
alias negativeFlag is pipeRegister(0);

begin

process(clk)
begin
	if(clk='0' and clk'event) then
		-- Falling edge action latch new data from previous stage
		if(rst = '1') then
			-- Clear register with reset signal
			pipeRegister <= (others => '0');
		else
			operand2Data <= op2_data_in;
			opcode <= opcode_in;
			destAddress <= dest_addr_in;
			operandM1 <= op_m1_in;
			aluResult <= result_in;
			zeroFlag <= z_flag_in;
			negativeFlag <= n_flag_in;
		end if;
	end if;
end process;

process(clk)
begin
	if(clk='1' and clk'event) then
		-- Send data out to next stage
		op2_data_out <= operand2Data;
		opcode_out <= opcode;
		dest_addr_out <= destAddress;
		op_M1_out <= operandM1;
		result_out <= aluResult;
		z_flag_out <= zeroFlag;
		n_flag_out <= negativeFlag;
	end if;
end process;

end Behavioral;

