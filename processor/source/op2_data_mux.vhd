----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:16 03/08/2017 
-- Design Name: 
-- Module Name:    op2_data_mux - Behavioral 
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

entity op2_data_mux is
	Port (	data_select: IN STD_LOGIC_VECTOR(1 downto 0);
				immediate : IN STD_LOGIC_VECTOR(3 downto 0);
				reg_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end op2_data_mux;

architecture Behavioral of op2_data_mux is

signal bigImmediate : STD_LOGIC_VECTOR(15 downto 0) := (others=>'0');

begin

bigImmediate(3 downto 0) <= immediate;

data <= bigImmediate when data_select = "01" else reg_data;

end Behavioral;

