----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:48 02/21/2017 
-- Design Name: 
-- Module Name:    controlUnit_file - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controlUnit_file is
    Port ( --clk : in  STD_LOGIC;
           --rst : in  STD_LOGIC;
			  instruction : in STD_LOGIC_VECTOR(15 downto 0);
			  opcode_out : out STD_LOGIC_VECTOR(6 downto 0);
			  ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  reg_waddr : out STD_LOGIC_VECTOR(2 downto 0);
			  reg_wen : out STD_LOGIC;
			  alu_code : out STD_LOGIC_VECTOR(2 downto 0));
end controlUnit_file;

architecture Behavioral of controlUnit_file is
--Define states for each stage
--type state_type is (fetch, decode, execute);
--signal Current_State, Next_State : state_type;
--signal PC : unsigned(6 downto 0) := "0000000";
--signal PC_next : unsigned(6 downto 0);
--signal instr_reg : STD_LOGIC_VECTOR(15 downto 0);

alias opcode is instruction(15 downto 9); -- All formats
alias operand_ra is instruction(8 downto 6); -- Formats: A1, A2, A3
alias operand_rb is instruction(5 downto 3); -- Formats: A1
alias operand_rc is instruction(2 downto 0); -- Formats: A1

begin

-- DECODE
opcode_out <= opcode;
ra_addr <= operand_ra; 
rb_addr <= operand_rb;
rc_addr <= operand_rc;

alu_code <=
	"001" when opcode = "0000001" else
	"010" when opcode = "0000010" else
	"011" when opcode = "0000011" else
	"100" when opcode = "0000100" else
	"101" when opcode = "0000101" else
	"110" when opcode = "0000110" else
	"111" when opcode = "0000111" else
	"000";
	
-- Temporary for IN OUT command
reg_waddr <= operand_ra;
reg_wen <= '1' when opcode = "0100001" else '0';
end Behavioral;

