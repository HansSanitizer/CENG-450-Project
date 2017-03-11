----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:38:46 02/02/2017
-- Design Name:
-- Module Name:    alu_file - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_file is
    Port ( in1 : in  STD_LOGIC_VECTOR(15 downto 0);
           in2 : in  STD_LOGIC_VECTOR(15 downto 0);
           alu_mode : in  STD_LOGIC_VECTOR(2 downto 0);
           result : out  STD_LOGIC_VECTOR(15 downto 0);
           z_flag : out  STD_LOGIC;
           n_flag : out  STD_LOGIC);
end alu_file;

architecture Behavioral of alu_file is

begin
--process(clk)
--variable tempResult : STD_LOGIC(15 downto 0);

--begin
	--if(clk='1' and clk'event) then
result <=
STD_LOGIC_VECTOR(signed(in1) + signed(in2)) when(alu_mode = "001") else
STD_LOGIC_VECTOR(signed(in1) - signed(in2)) when(alu_mode = "010") else
STD_LOGIC_VECTOR(unsigned(in1(7 downto 0))*unsigned(in2(7 downto 0))) when(alu_mode = "011") else
STD_LOGIC_VECTOR(signed(in1) nand signed(in2)) when(alu_mode = "100") else
STD_LOGIC_VECTOR(unsigned(in1) sll to_integer(unsigned(in2))) when(alu_mode="101") else
STD_LOGIC_VECTOR(unsigned(in1) srl to_integer(unsigned(in2))) when(alu_mode="110") else
STD_LOGIC_VECTOR(unsigned(in1));

z_flag <=
'1' when((alu_mode = "111") and (to_integer(unsigned(in1)) = 0)) else
'0' when((alu_mode = "111") and (to_integer(unsigned(in1)) /= 0)) else
'0';

n_flag <=
'1' when((alu_mode = "111") and (to_integer(signed(in1)) < 0)) else
'0' when((alu_mode = "111") and (to_integer(signed(in1)) >=0)) else
'0';


end Behavioral;
