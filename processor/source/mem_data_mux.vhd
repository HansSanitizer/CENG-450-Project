----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:50 03/22/2017 
-- Design Name: 
-- Module Name:    mem_data_mux - Behavioral 
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

entity mem_data_mux is
	Port (	data_select: IN STD_LOGIC;
				result_data : IN STD_LOGIC_VECTOR(15 downto 0);
				mem_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end mem_data_mux;

architecture Behavioral of mem_data_mux is

begin

data <= mem_data when data_select = '1' else result_data;

end Behavioral;

