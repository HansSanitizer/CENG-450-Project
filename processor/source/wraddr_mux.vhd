----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:36 03/21/2017 
-- Design Name: 
-- Module Name:    wraddr_mux - Behavioral 
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

entity wraddr_mux is
	Port (	data_select: IN STD_LOGIC;
				dest_addr : IN STD_LOGIC_VECTOR(2 downto 0);
				data : OUT STD_LOGIC_VECTOR(2 downto 0));
end wraddr_mux;

architecture Behavioral of wraddr_mux is

begin

data <= "111" when data_select = '1' else dest_addr;

end Behavioral;

