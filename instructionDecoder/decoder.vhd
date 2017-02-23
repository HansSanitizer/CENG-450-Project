----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:49 02/09/2017 
-- Design Name: 
-- Module Name:    decoder - Behavioral 
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

entity decoder is
    Port ( instruction : in  STD_LOGIC_VECTOR (15 downto 0);
           alu_code : out  STD_LOGIC_VECTOR (2 downto 0);
			  ra_addr : out STD_LOGIC_VECTOR (2 downto 0);
			  rb_addr : out STD_LOGIC_VECTOR (2 downto 0);
			  rc_addr : out STD_LOGIC_VECTOR (2 downto 0));
end decoder;

architecture Behavioral of decoder is

alias opcode is instruction(15 downto 9);
alias operand_ra is instruction(8 downto 6);
alias operand_rb is instruction(5 downto 3);
alias operand_rc is instruction(2 downto 0);

begin

alu_code <=
"001" when(opcode="0000001") else
"010" when(opcode="0000010") else
"011" when(opcode="0000011") else
"100" when(opcode="0000100") else "000";

ra_addr <= operand_ra;
rb_addr <= operand_rb;
rc_addr <= operand_rc;

end Behavioral;

