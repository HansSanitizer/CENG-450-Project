----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:22 03/07/2017 
-- Design Name: 
-- Module Name:    reg_MEM_WB - Behavioral 
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

entity reg_MEM_WB is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				-- MEM Stage Read Signals
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op1_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				op2_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				result_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- Write Signals
				opcode_out : OUT STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_out: OUT STD_LOGIC_VECTOR(2 downto 0);
				result_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end reg_MEM_WB;

architecture Behavioral of reg_MEM_WB is

signal pipeRegister : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

alias opcode is pipeRegister(31 downto 25);
alias destAddress is pipeRegister(24 downto 22);
alias operandAddress1 is pipeRegister(21 downto 19);
alias operandAddress2 is pipeRegister(18 downto 16);
alias aluResult is pipeRegister(15 downto 0);

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
			destAddress <= dest_addr_in;
			operandAddress1 <= op1_addr_in;
			operandAddress2 <= op2_addr_in;
			aluResult <= result_in;
		end if;
	elsif(clk='1' and clk'event) then
		-- Send data out to next stage
		opcode_out <= opcode;
		dest_addr_out <= destAddress;
		result_out <= aluResult;
	end if;
end process;

end Behavioral;

