----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:28 03/02/2017 
-- Design Name: 
-- Module Name:    program_counter - Behavioral 
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

entity program_counter is
	port (	clk : IN STD_LOGIC;
				rst : IN STD_LOGIC;
				hold : IN STD_LOGIC;
				--fhold : IN STD_LOGIC;
				write_en : IN STD_LOGIC;
				next_value : IN STD_LOGIC_VECTOR(15 downto 0);
				overwrite_value : IN STD_LOGIC_VECTOR(15 downto 0);
				current_value : OUT STD_LOGIC_VECTOR(15 downto 0));
end program_counter;

architecture Behavioral of program_counter is

signal counterValue : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
attribute S: string;
attribute S of counterValue: signal is "Yes";

begin

process(clk)
begin
	if(clk='0' and clk'event) then
		if (rst = '1') then
			counterValue <= X"0000";
		elsif (hold = '0') then
			if (write_en = '1') then
				counterValue <= overwrite_value(15 downto 1) & "0"; -- Mask LSB to ensure word alignment
			else
				counterValue <= next_value;
			end if;
		end if;
	end if;
end process;

current_value <= counterValue;

end Behavioral;

