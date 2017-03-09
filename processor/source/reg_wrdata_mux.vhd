----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:06:33 03/08/2017 
-- Design Name: 
-- Module Name:    reg_wrdata_mux - Behavioral 
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

entity reg_wrdata_mux is
	port ( 	ext_select : IN STD_LOGIC;
				wb_data : IN STD_LOGIC_VECTOR(15 downto 0);
				ext_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end reg_wrdata_mux;

architecture Behavioral of reg_wrdata_mux is

begin

data <= wb_data when ext_select = '0' else ext_data;

end Behavioral;

