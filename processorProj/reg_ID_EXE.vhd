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
				-- Control Unit read signals
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				alu_in : IN STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				-- Register File read signals
				op1_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				op2_data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- write signals
				opcode_out : OUT STD_LOGIC_VECTOR(6 downto 0);
				alu_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op1_data_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				op2_addr_out : OUT STD_LOGIC_VECTOR(2 downto 0);
				op2_data_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end reg_ID_EXE;

architecture Behavioral of reg_ID_EXE is

signal pipeRegister : STD_LOGIC_VECTOR(50 downto 0) := (others => '0');

alias opCode is pipeRegister (50 downto 44);
alias aluCode is pipeRegister(43 downto 41);
alias destAddress is pipeRegister(40 downto 38);
alias operandAddress1 is pipeRegister(37 downto 35);
alias operandData1 is pipeRegister(34 downto 19);
alias operandAddress2 is pipeRegister(18 downto 16);
alias operandData2 is pipeRegister(15 downto 0);

begin

process(clk)
begin
	if(clk='0' and clk'event) then
		-- Falling edge action latch new data from previous stage
		if(rst = '1') then
			-- Clear register with reset signal
			pipeRegister <= (others => '0');
		else
			opCode <= opcode_in;
			aluCode <= alu_in;
			destAddress <= dest_addr_in;
			operandAddress1 <= op1_addr_in;
			operandData1 <= op1_data_in;
			operandAddress2 <= op2_addr_in;
			operandData2 <= op2_data_in;
		end if;
	elsif(clk='1' and clk'event) then
		-- Send data out to next stage
		opCode_out <= opCode;
		alu_out <= aluCode;
		dest_addr_out <= destAddress;
		op1_addr_out <= operandAddress1;
		op1_data_out <= operandData1;
		op2_addr_out <= operandAddress2;
		op2_data_out <= operandData2;
	end if;
end process;

end Behavioral;

