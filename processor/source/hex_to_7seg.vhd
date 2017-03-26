----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:55 03/18/2017 
-- Design Name: 
-- Module Name:    hex_to_7seg - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_to_7seg is
    Port ( clk : in  STD_LOGIC;
           CPU_result : in  STD_LOGIC_VECTOR (15 downto 0);
           hex_opcode_in: in STD_LOGIC_VECTOR (6 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (6 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0));
end hex_to_7seg;

architecture Behavioral of hex_to_7seg is
	signal temp: STD_LOGIC_VECTOR(3 downto 0):="0000";
	signal cpuresTemp: STD_LOGIC_VECTOR(15 downto 0):= (others=> '0');
	--signal hexOpTemp: STD_LOGIC_VECTOR(7 downto 0):= (others=> '0');
begin
	process(clk)
	begin
	if(clk='1' and clk'event) then
		if temp = "0000" then
			temp <= "0001";
		elsif temp = "0001" then
			temp <= "0010";
		elsif temp = "0010" then
			temp <= "0100";
		elsif temp = "0100" then
			temp <= "1000";
		else temp <= "0000";
		end if;
	end if;
	end process;
	process(temp, CPU_result, hex_opcode_in)
	begin
		if (hex_opcode_in = "0100000") then --opcode is OUT
			cpuresTemp <= CPU_result;
			--hexOpTemp <= hex_istr_in;
		end if;

			if temp = "0001" then
				anodes <= not"0001";
				--LSB of Cathodes is CA
				--EX : Display 0 -> "CG CF CE CD CC CB CA" = not "0111111"
				case cpuresTemp(3 downto 0) is
					when "0000"  => cathodes <= not "0111111";
					when "0001"  => cathodes <= not "0000110";
					when "0010"  => cathodes <= not "1011011";
					when "0011"  => cathodes <= not "1001111";
					when "0100"  => cathodes <= not "1100110";
					when "0101"  => cathodes <= not "1101101";
					when "0110"  => cathodes <= not "1111101";
					when "0111"  => cathodes <= not "0000111";
					when "1000"  => cathodes <= not "1111111";
					when "1001"  => cathodes <= not "1101111";
					when "1010"  => cathodes <= not "1110111";
					when "1011"  => cathodes <= not "1111100";
					when "1100"  => cathodes <= not "0111001";
					when "1101"  => cathodes <= not "1011110";
					when "1110"  => cathodes <= not "1111001";
					when "1111"  => cathodes <= not "1110001";
					when others => cathodes <= not "0000000";
				end case;
			elsif temp = "0010" then
				anodes <= not"0010";
				case cpuresTemp(7 downto 4) is
					when "0000"  => cathodes <= not "0111111";
					when "0001"  => cathodes <= not "0000110";
					when "0010"  => cathodes <= not "1011011";
					when "0011"  => cathodes <= not "1001111";
					when "0100"  => cathodes <= not "1100110";
					when "0101"  => cathodes <= not "1101101";
					when "0110"  => cathodes <= not "1111101";
					when "0111"  => cathodes <= not "0000111";
					when "1000"  => cathodes <= not "1111111";
					when "1001"  => cathodes <= not "1101111";
					when "1010"  => cathodes <= not "1110111";
					when "1011"  => cathodes <= not "1111100";
					when "1100"  => cathodes <= not "0111001";
					when "1101"  => cathodes <= not "1011110";
					when "1110"  => cathodes <= not "1111001";
					when "1111"  => cathodes <= not "1110001";
					when others => cathodes <= not "0000000";
				end case;
			elsif temp = "0100" then
				anodes <= not"0100";
				case cpuresTemp(11 downto 8) is
					when "0000"  => cathodes <= not "0111111";
					when "0001"  => cathodes <= not "0000110";
					when "0010"  => cathodes <= not "1011011";
					when "0011"  => cathodes <= not "1001111";
					when "0100"  => cathodes <= not "1100110";
					when "0101"  => cathodes <= not "1101101";
					when "0110"  => cathodes <= not "1111101";
					when "0111"  => cathodes <= not "0000111";
					when "1000"  => cathodes <= not "1111111";
					when "1001"  => cathodes <= not "1101111";
					when "1010"  => cathodes <= not "1110111";
					when "1011"  => cathodes <= not "1111100";
					when "1100"  => cathodes <= not "0111001";
					when "1101"  => cathodes <= not "1011110";
					when "1110"  => cathodes <= not "1111001";
					when "1111"  => cathodes <= not "1110001";
					when others => cathodes <= not "0000000";
				end case;
			elsif temp = "1000" then
				--
				anodes <= not"1000";
				case cpuresTemp(15 downto 12) is
					when "0000"  => cathodes <= not "0111111";
					when "0001"  => cathodes <= not "0000110";
					when "0010"  => cathodes <= not "1011011";
					when "0011"  => cathodes <= not "1001111";
					when "0100"  => cathodes <= not "1100110";
					when "0101"  => cathodes <= not "1101101";
					when "0110"  => cathodes <= not "1111101";
					when "0111"  => cathodes <= not "0000111";
					when "1000"  => cathodes <= not "1111111";
					when "1001"  => cathodes <= not "1101111";
					when "1010"  => cathodes <= not "1110111";
					when "1011"  => cathodes <= not "1111100";
					when "1100"  => cathodes <= not "0111001";
					when "1101"  => cathodes <= not "1011110";
					when "1110"  => cathodes <= not "1111001";
					when "1111"  => cathodes <= not "1110001";
					when others => cathodes <= not "0000000";
				end case;
			else 
			cathodes <= not "0000000";
			anodes <= "0000";
			end if;
	end process;
end Behavioral;

