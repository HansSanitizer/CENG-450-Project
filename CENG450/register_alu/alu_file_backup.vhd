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
--use IEEE.NUMERIC_STD.ALL;

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
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
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
		case alu_mode(2 downto 0) is
			when "001" =>
				-- ADD
				--tempResult := in1 + in2;
				result <= in1 + in2;
			when "010" =>
				-- SUB
				--tempResult := in1 - in2;
				result <= in1 - in2;
			when "011" =>
				-- MUL
				--tempResult := in1 * in2;
				result <= in1 * in2;
			when "100" =>
				-- NAND
				--tempResult := in1 nand in2;
				result <= in1 nand in2;
			--when "101" =>
				-- Shift Left Logical
				--tempResult := in1 sll in2;
				--result <= in1 sll in2;
			--when "110" =>
				-- Shift Right Logical
				--tempResult := in1 srl in2;
				--result <= in1 srl in2;
			when "111" =>
				-- TEST
				if(in1 = X"0000") then
					z_flag <= '1';
					n_flag <= '0';
				elsif (in1(15) = '1') then
					z_flag <= '0';
					n_flag <= '1';
				else
					z_flag <= '0';
					n_flag <= '0';
				end if;
			when others => null;
				-- NOP, do nothing				
		end case;
		
		--result <= tempResult;
		
	--end if;
--end process;


end Behavioral;

