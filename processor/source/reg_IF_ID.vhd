----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:58 02/23/2017 
-- Design Name: 
-- Module Name:    reg_IF_ID - Behavioral 
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

entity reg_IF_ID is
	port(	clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			hold : IN STD_LOGIC;
			instr_in : IN STD_LOGIC_VECTOR(15 downto 0);
			instr_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end reg_IF_ID;

architecture Behavioral of reg_IF_ID is

signal instructionReg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin

process(clk)
begin
	if(falling_edge(clk)) then
		-- Falling edge action latch new instruction
		if(rst = '1') then
			-- Clear register with reset signal
			instructionReg <= (others => '0');
		elsif(rst = '0') then
			instructionReg <= instr_in;
		end if;
	end if;
end process;

process(clk)
begin
	if(rising_edge(clk)) then
		-- Send instruction out to be decoded
		if hold = '0' then
			instr_out <= instructionReg;
		end if;
	end if;
end process;

end Behavioral;

