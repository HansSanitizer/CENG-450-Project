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
    Port (	-- DECODE
				instruction : in STD_LOGIC_VECTOR(15 downto 0);
				opcode_out : out STD_LOGIC_VECTOR(6 downto 0);
				ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
				rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
				rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
				alu_code : out STD_LOGIC_VECTOR(2 downto 0);
				imm_data : OUT STD_LOGIC_VECTOR(3 downto 0);
				imm_select : OUT STD_LOGIC;
				-- WRITE BACK
				opcode_wb: IN STD_LOGIC_VECTOR(6 downto 0);
				wb_mux_sel: OUT STD_LOGIC;
				reg_wen : OUT STD_LOGIC);
end controlUnit_file;

architecture Behavioral of controlUnit_file is
--Define states for each stage
--type state_type is (fetch, decode, execute);
--signal Current_State, Next_State : state_type;
--signal PC : unsigned(6 downto 0) := "0000000";
--signal PC_next : unsigned(6 downto 0);
--signal instr_reg : STD_LOGIC_VECTOR(15 downto 0);

alias opcode is instruction(15 downto 9); -- All formats
alias operand_ra is instruction(8 downto 6); -- Formats: A1, A2, A3, B2
alias operand_rb is instruction(5 downto 3); -- Formats: A1
alias operand_rc is instruction(2 downto 0); -- Formats: A1
alias operand_c1 is instruction(3 downto 0); -- Formats: A2

begin

-- DECODE
opcode_out <= opcode;
ra_addr <= operand_ra; 
rb_addr <= 
	operand_ra when opcode = "0000100" else	-- NAND
	operand_ra when opcode = "0000101" else	-- SHL
	operand_ra when opcode = "0000110" else	-- SHR
	operand_rb;
rc_addr <= operand_rb when opcode = "0000100" else operand_rc;	-- NAND

imm_data <= operand_c1;
imm_select <=
	'1' when opcode = "0000101" else	-- SHL
	'1' when opcode = "0000110" else -- SHR
	'0';

alu_code <=
	"001" when opcode = "0000001" else	-- ADD
	"010" when opcode = "0000010" else	-- SUB
	"011" when opcode = "0000011" else	-- MUL
	"100" when opcode = "0000100" else	-- NAND
	"101" when opcode = "0000101" else	-- SHL
	"110" when opcode = "0000110" else	-- SHR
	"111" when opcode = "0000111" else	-- TEST
	"000";										-- NOP
	
-- WRITE BACK
reg_wen <=
	'0' when opcode_wb = "0000000" else	-- NOP
	'0' when opcode_wb = "0000111" else	-- TEST
	'0' when opcode_wb = "0100000" else	-- OUT
	'1';

wb_mux_sel <= '1' when opcode_wb = "0100001" else '0'; -- IN

end Behavioral;
