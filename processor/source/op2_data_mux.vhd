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
	Port (	data_select: IN STD_LOGIC_VECTOR(2 downto 0);
				immediate : IN STD_LOGIC_VECTOR(7 downto 0);
				displacement : IN STD_LOGIC_VECTOR(8 downto 0);
				reg_data : IN STD_LOGIC_VECTOR(15 downto 0);
				exe_data : IN STD_LOGIC_VECTOR(15 downto 0);
				mem_data : IN STD_LOGIC_VECTOR(15 downto 0);
				wb_data : IN STD_LOGIC_VECTOR(15 downto 0);
				data : OUT STD_LOGIC_VECTOR(15 downto 0));
end op2_data_mux;

architecture Behavioral of op2_data_mux is

signal bigImmediate : STD_LOGIC_VECTOR(15 downto 0) := (others=>'0');
attribute S: string;
attribute S of bigImmediate: signal is "Yes";

begin

bigImmediate(7 downto 0) <= immediate;

data <=
	bigImmediate when data_select = "001" else
	"000000" & displacement & "0" when ((data_select = "010") and (displacement(8) = '0')) else -- 2*disp
	"111111" & displacement & "0" when ((data_select = "010") and (displacement(8) = '1')) else -- 2*disp (negative)
	exe_data when data_select = "101" else
	mem_data when data_select = "110" else
	wb_data when data_select = "111" else
	reg_data;

end Behavioral;

