----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:15:37 03/18/2017 
-- Design Name: 
-- Module Name:    op1_data_mux - Behavioral 
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

entity op1_data_mux is
	Port (	data_select: IN STD_LOGIC_VECTOR(2 downto 0);
				immediate : IN STD_LOGIC_VECTOR(7 downto 0);
				pc_value : IN STD_LOGIC_VECTOR(15 downto 0);
				reg_data : IN STD_LOGIC_VECTOR(15 downto 0);
				exe_data : IN STD_LOGIC_VECTOR(15 downto 0);
				mem_data : IN STD_LOGIC_VECTOR(15 downto 0);
				wb_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end op1_data_mux;

architecture Behavioral of op1_data_mux is

begin

data <=
	pc_value when data_select = "001" else
	(X"00" & immediate) when data_select = "010" else
	exe_value when data_select = "101" else
	mem_data when data_select = "110" else
	wb_data when data_select = "111" else
	reg_data;

end Behavioral;

