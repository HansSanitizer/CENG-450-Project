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
				op_m1_in : IN STD_LOGIC;
				result_in : IN STD_LOGIC_VECTOR(15 downto 0);
				-- Write Signals
				opcode_out : OUT STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_out: OUT STD_LOGIC_VECTOR(2 downto 0);
				op_m1_out : OUT STD_LOGIC;
				result_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end reg_MEM_WB;

architecture Behavioral of reg_MEM_WB is

signal pipeRegister : STD_LOGIC_VECTOR(26 downto 0) := (others => '0');
attribute S: string;
attribute S of pipeRegister: signal is "Yes";

alias opcode is pipeRegister(26 downto 20);
alias destAddress is pipeRegister(19 downto 17);
alias operandM1 is pipeRegister(16);
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
			operandM1 <= op_m1_in;
			aluResult <= result_in;
		end if;
	end if;
end process;

process(clk)
begin
	if(clk='1' and clk'event) then
		-- Send data out to next stage
		opcode_out <= opcode;
		dest_addr_out <= destAddress;
		op_m1_out <= operandM1;
		result_out <= aluResult;
	end if;
end process;

end Behavioral;

