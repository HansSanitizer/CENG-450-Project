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
				disp_data : OUT STD_LOGIC_VECTOR(8 downto 0);
				data1_select : OUT STD_LOGIC_VECTOR(1 downto 0);
				data2_select : OUT STD_LOGIC_VECTOR(1 downto 0);
				fetch_stall : OUT STD_LOGIC;
				stall : OUT STD_LOGIC;
				-- EXECUTE
				opcode_exe : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_exe : IN STD_LOGIC_VECTOR(2 downto 0);
				n_flag: IN STD_LOGIC;
				z_flag: IN STD_LOGIC;
				pc_write_en : OUT STD_LOGIC;
				dest_select : OUT STD_LOGIC;
				result_select : OUT STD_LOGIC_VECTOR(1 downto 0);
				-- MEMORY
				dest_addr_mem : IN STD_LOGIC_VECTOR(2 downto 0);
				-- WRITE BACK
				opcode_wb: IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_wb : IN STD_LOGIC_VECTOR(2 downto 0);
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
signal dataHazard : STD_LOGIC_VECTOR(5 downto 0) := (others=> '0');

alias opcode is instruction(15 downto 9); -- All formats
alias operand_ra is instruction(8 downto 6); -- Formats: A1, A2, A3, B2
alias operand_rb is instruction(5 downto 3); -- Formats: A1
alias operand_rc is instruction(2 downto 0); -- Formats: A1
alias operand_c1 is instruction(3 downto 0); -- Formats: A2
alias disp_l is instruction(8 downto 0); -- Formats: B1
alias disp_s is instruction(5 downto 0); -- Formats: B2

begin

-- DECODE
opcode_out <= opcode;
ra_addr <= operand_ra; 
rb_addr <= 
	operand_ra when opcode = "0000100" else	-- NAND
	operand_ra when opcode = "0000101" else	-- SHL
	operand_ra when opcode = "0000110" else	-- SHR
	operand_ra when opcode = "0000111" else	-- TEST
	operand_ra when opcode = "1000011" else	-- BR
	operand_ra when opcode = "1000100" else	-- BR.N
	operand_ra when opcode = "1000101" else	-- BR.Z
	operand_ra when opcode = "1000110" else	-- BR.SUB
	operand_rb;
rc_addr <= operand_rb when opcode = "0000100" else operand_rc;	-- NAND

imm_data <= operand_c1;
disp_data <=
	("000" & disp_s) when ((opcode = "1000011") and (disp_s(5) = '0')) else	-- BR
	("111" & disp_s) when ((opcode = "1000011") and (disp_s(5) = '1')) else
	("000" & disp_s) when ((opcode = "1000100") and (disp_s(5) = '0')) else	-- BR.N
	("111" & disp_s) when ((opcode = "1000100") and (disp_s(5) = '1')) else
	("000" & disp_s) when ((opcode = "1000101") and (disp_s(5) = '0')) else	-- BR.Z
	("111" & disp_s) when ((opcode = "1000101") and (disp_s(5) = '1')) else
	("000" & disp_s) when ((opcode = "1000110") and (disp_s(5) = '0')) else	-- BR.SUB
	("111" & disp_s) when ((opcode = "1000110") and (disp_s(5) = '1')) else
	disp_l;

data1_select <=
	"01" when opcode = "1000000" else	-- BRR PC value
	"01" when opcode = "1000001" else	-- BRR.N PC value
	"01" when opcode = "1000010" else	-- BRR.Z PC value
	"00";

data2_select <=
	"01" when opcode = "0000101" else	-- SHL immediate
	"01" when opcode = "0000110" else	-- SHR immediate
	"10" when opcode = "1000000" else	-- BRR displacement
	"10" when opcode = "1000001" else	-- BRR.N displacement
	"10" when opcode = "1000010" else	-- BRR.Z displacement
	"10" when opcode = "1000011" else	-- BR displacement
	"10" when opcode = "1000100" else	-- BR.N displacement
	"10" when opcode = "1000101" else	-- BR.Z displacement
	"10" when opcode = "1000110" else	-- BR.SUB displacement
	"00";

alu_code <=
	"001" when opcode = "0000001" else	-- ADD
	"010" when opcode = "0000010" else	-- SUB
	"011" when opcode = "0000011" else	-- MUL
	"100" when opcode = "0000100" else	-- NAND
	"101" when opcode = "0000101" else	-- SHL
	"110" when opcode = "0000110" else	-- SHR
	"111" when opcode = "0000111" else	-- TEST
	"001" when opcode = "1000000" else	-- BRR
	"001" when opcode = "1000001" else	-- BRR.N
	"001" when opcode = "1000011" else	-- BR
	"001" when opcode = "1000100" else	-- BR.N
	"001" when opcode = "1000101" else	-- BR.Z
	"001" when opcode = "1000110" else	-- BR.SUB
	"000";										-- NOP

-- control hazard
fetch_stall <=
	'1' when opcode = "1000000" else 	-- BRR
	'1' when opcode_exe = "1000000" else
	'1' when opcode = "1000001" else 	-- BRR.N
	'1' when opcode_exe = "1000001" else
	'1' when opcode = "1000010" else 	-- BRR.Z
	'1' when opcode_exe = "1000010" else
	'1' when opcode = "1000011" else 	-- BR
	'1' when opcode_exe = "1000011" else
	'1' when opcode = "1000100" else 	-- BR.N
	'1' when opcode_exe = "1000100" else
	'1' when opcode = "1000101" else 	-- BR.Z
	'1' when opcode_exe = "1000101" else
	'1' when opcode = "1000110" else 	-- BR.SUB
	'1' when opcode_exe = "1000110" else
	'0';

-- possible data hazards
dataHazard(5 downto 4) <=
	"01" when operand_ra = dest_addr_exe else
	"10" when operand_ra = dest_addr_mem else
	"11" when operand_ra = dest_addr_wb else
	"00";
dataHazard(3 downto 2) <=
	"01" when operand_rb = dest_addr_exe else
	"10" when operand_rb = dest_addr_mem else
	"11" when operand_rb = dest_addr_wb else
	"00";
dataHazard(1 downto 0) <=
	"01" when operand_rc = dest_addr_exe else
	"10" when operand_rc = dest_addr_mem else
	"11" when operand_rc = dest_addr_wb else
	"00";

-- detect and handle hazard
hazard: process (dataHazard, opcode)
begin
	stall <='0';	
	case opcode is
		when "0000001" => -- ADD
		-- Check Operands for pending write
			case dataHazard(3 downto 2) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
			case dataHazard(1 downto 0) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
		when "0000010" => -- SUB
		-- Check Operands for pending write
			case dataHazard(3 downto 2) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
			case dataHazard(1 downto 0) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
		when "0000011" => -- MUL
		-- Check Operands for pending write
			case dataHazard(3 downto 2) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
			case dataHazard(1 downto 0) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
		when "0000100" => -- NAND
		-- Check Operands for pending write
			case dataHazard(3 downto 2) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
			case dataHazard(1 downto 0) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
		when "0000101" => -- SHL
		-- Check Operand for pending write
			case dataHazard(5 downto 4) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
		when "0000110" => -- SHR
		-- Check Operand for pending write
			case dataHazard(5 downto 4) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
		when "0000111" => -- TEST
		-- Check Operand for pending write
			case dataHazard(5 downto 4) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
		when "0100000" => -- OUT
		-- Check Operand for pending write
			case dataHazard(5 downto 4) is
				when "01" =>
					-- stall
					stall <= '1';
				when "10" =>
					-- stall
					stall <= '1';
				when "11" =>
					-- stall
					stall <= '1';
				when others =>
					-- don't stall
			end case;
		when others =>
	end case;
end process hazard;

-- EXECUTE

pc_write_en <=
	'1' when opcode_exe = "1000000" else	-- BRR
	'1' when ((opcode_exe = "1000001") and (n_flag = '1')) else	-- BRR.N
	'1' when ((opcode_exe = "1000010") and (z_flag = '1')) else	-- BRR.Z
	'1' when opcode_exe = "1000011" else	-- BR
	'1' when ((opcode_exe = "1000100") and (n_flag = '1')) else	-- BR.N
	'1' when ((opcode_exe = "1000101") and (z_flag = '1')) else	-- BR.Z
	'1' when opcode_exe = "1000110" else	-- BR.SUB
	'0';

dest_select <=
	'1' when opcode_exe = "1000110" else	-- BR.SUB writing to R7
	'0';
	
result_select <=
	"01" when opcode_exe = "1000110" else	-- BR.SUB
	"00";

-- WRITE BACK
reg_wen <=
	'0' when opcode_wb = "0000000" else	-- NOP
	'0' when opcode_wb = "0000111" else	-- TEST
	'0' when opcode_wb = "0100000" else	-- OUT
	'0' when opcode_wb = "1000000" else -- BRR
	'0' when opcode_wb = "1000001" else -- BRR.N
	'0' when opcode_wb = "1000010" else -- BRR.Z
	'1';

wb_mux_sel <= '1' when opcode_wb = "0100001" else '0'; -- IN

end Behavioral;

