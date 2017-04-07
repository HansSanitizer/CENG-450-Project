----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:10 04/07/2017 
-- Design Name: 
-- Module Name:    reg_output - Behavioral 
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

entity reg_output is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				enable : IN STD_LOGIC;
				data_in : IN STD_LOGIC_VECTOR(15 downto 0);
				data_out : OUT STD_LOGIC_VECTOR(15 downto 0));
end reg_output;

architecture Behavioral of reg_output is

signal outputRegister : STD_LOGIC_VECTOR(15 downto 0);

begin

process(clk)
begin
	if(falling_edge(clk)) then
		-- Falling edge action latch new instruction
		if (rst = '1') then
			-- Clear register with reset signal
			outputRegister <= (others => '0');
		elsif ((rst = '0') and (enable = '1')) then
			outputRegister <= data_in;
		end if;
	end if;
end process;

process(clk)
begin
	if(rising_edge(clk)) then
		-- Send instruction out to be decoded
			data_out <= outputRegister;
	end if;
end process;

end Behavioral;

