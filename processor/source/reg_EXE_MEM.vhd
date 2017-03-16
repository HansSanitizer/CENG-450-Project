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
end reg_EXE_MEM;

architecture Behavioral of reg_EXE_MEM is

signal pipeRegister : STD_LOGIC_VECTOR(33 downto 0) := (others => '0');
attribute S: string;
attribute S of pipeRegister:signal is "YES";

alias opcode is pipeRegister(33 downto 27);
alias destAddress is pipeRegister(26 downto 24);
alias operandAddress1 is pipeRegister(23 downto 21);
alias operandAddress2 is pipeRegister(20 downto 18);
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
			opcode <= opcode_in;
			destAddress <= dest_addr_in;
			operandAddress1 <= op1_addr_in;
			operandAddress2 <= op2_addr_in;
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
		opcode_out <= opcode;
		dest_addr_out <= destAddress;
		op1_addr_out <= operandAddress1;
		op2_addr_out <= operandAddress2;
		result_out <= aluResult;
	end if;
end process;

end Behavioral;

