----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:48 03/21/2017 
-- Design Name: 
-- Module Name:    result_data_mux - Behavioral 
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

entity result_data_mux is
	Port (	data_select: IN STD_LOGIC_VECTOR(1 downto 0);
				op1_data : IN STD_LOGIC_VECTOR(15 downto 0);
				pc_value : IN STD_LOGIC_VECTOR(15 downto 0);
				alu_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end result_data_mux;

architecture Behavioral of result_data_mux is

begin

data <=
	pc_value when data_select = "01" else
	op1_data when data_select = "10" else
	alu_data;

end Behavioral;

