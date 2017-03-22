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
    			io_switch_in : in STD_LOGIC;
				instruction : in STD_LOGIC_VECTOR(15 downto 0);
				opcode_out : out STD_LOGIC_VECTOR(6 downto 0);
				ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
				rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
				rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
				alu_code : out STD_LOGIC_VECTOR(2 downto 0);
				imm_data : OUT STD_LOGIC_VECTOR(7 downto 0);
				disp_data : OUT STD_LOGIC_VECTOR(8 downto 0);
				data1_select : OUT STD_LOGIC_VECTOR(1 downto 0);
				data2_select : OUT STD_LOGIC_VECTOR(1 downto 0);
				op_m1_out : OUT STD_LOGIC;
				fetch_stall : OUT STD_LOGIC;
				stall : OUT STD_LOGIC;
				-- EXECUTE
				opcode_exe : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_exe : IN STD_LOGIC_VECTOR(2 downto 0);
				n_flag: IN STD_LOGIC;
				z_flag: IN STD_LOGIC;
				pc_write_en : OUT STD_LOGIC;
				result_select : OUT STD_LOGIC_VECTOR(1 downto 0);
				-- MEMORY
				opcode_mem : IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_mem : IN STD_LOGIC_VECTOR(2 downto 0);
				mem_write_en : OUT STD_LOGIC;
				mem_data_select : OUT STD_LOGIC;
				-- WRITE BACK
				opcode_wb: IN STD_LOGIC_VECTOR(6 downto 0);
				dest_addr_wb : IN STD_LOGIC_VECTOR(2 downto 0);
				op_m1_wb : IN STD_LOGIC;
				wr_mode_sel : OUT STD_LOGIC_VECTOR(1 downto 0);
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
signal ioflag : STD_LOGIC := '0';
signal dataHazard : STD_LOGIC_VECTOR(5 downto 0) := (others=> '0');

alias opcode is instruction(15 downto 9); -- All formats
alias operand_ra is instruction(8 downto 6); -- Formats: A1, A2, A3, B2, L2(r.dest)
alias operand_rb is instruction(5 downto 3); -- Formats: A1, L2(r.src)
alias operand_rc is instruction(2 downto 0); -- Formats: A1
alias operand_c1 is instruction(3 downto 0); -- Formats: A2
alias operand_m1 is instruction(8); -- Formats: L1
alias disp_l is instruction(8 downto 0); -- Formats: B1
alias disp_s is instruction(5 downto 0); -- Formats: B2
alias imm is instruction (7 downto 0); -- Formats: L1

begin

-- DECODE
opcode_out <= opcode;

ra_addr <=
	"111" when opcode = "1000110" else	-- BR.SUB
	"111" when opcode = "0010010" else	-- LOADIMM
	operand_ra;

rb_addr <= 
	operand_ra when opcode = "0000100" else	-- NAND
	operand_ra when opcode = "0000101" else	-- SHL
	operand_ra when opcode = "0000110" else	-- SHR
	operand_ra when opcode = "0000111" else	-- TEST
	operand_ra when opcode = "1000011" else	-- BR
	operand_ra when opcode = "1000100" else	-- BR.N
	operand_ra when opcode = "1000101" else	-- BR.Z
	operand_ra when opcode = "1000110" else	-- BR.SUB
	operand_ra when opcode = "0010001" else	-- STORE
	"111" when opcode = "1000111" else			-- RETURN
	operand_rb;
	
rc_addr <=
	operand_rb when opcode = "0000100" else	-- NAND
	operand_rb when opcode = "0010001" else	-- STORE
	operand_rc;

op_m1_out <= operand_m1;

imm_data <=
	imm when opcode = "0010010" else	-- LOADIMM
	("0000" & operand_c1);

disp_data <=
	("000" & disp_s) when ((opcode = "1000011") and (disp_s(5) = '0')) else	-- BR
	("111" & disp_s) when ((opcode = "1000011") and (disp_s(5) = '1')) else
	("000" & disp_s) when ((opcode = "1000100") and (disp_s(5) = '0')) else	-- BR.N
	("111" & disp_s) when ((opcode = "1000100") and (disp_s(5) = '1')) else
	("000" & disp_s) when ((opcode = "1000101") and (disp_s(5) = '0')) else	-- BR.Z
	("111" & disp_s) when ((opcode = "1000101") and (disp_s(5) = '1')) else
	("000" & disp_s) when ((opcode = "1000110") and (disp_s(5) = '0')) else	-- BR.SUB
	("111" & disp_s) when ((opcode = "1000110") and (disp_s(5) = '1')) else
	"000000000" when opcode = "1000111" else											-- RETURN
	disp_l;

data1_select <=
	"01" when opcode = "1000000" else	-- BRR PC value
	"01" when opcode = "1000001" else	-- BRR.N PC value
	"01" when opcode = "1000010" else	-- BRR.Z PC value
	"10" when opcode = "0010010" else	-- LOADIMM
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
	"10" when opcode = "1000111" else	-- RETURN displacement of zero
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
	"001" when opcode = "1000111" else	-- RETURN
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
	'1' when opcode = "1000111" else 	-- RETURN
	'1' when opcode_exe = "1000111" else
	'0';

-- possible data hazards
dataHazard(5 downto 4) <=
	"01" when operand_ra = dest_addr_exe else
	"01" when (("111" = dest_addr_exe) and (opcode = "1000111")) else -- RETURN
	"10" when operand_ra = dest_addr_mem else
	"10" when (("111" = dest_addr_mem) and (opcode = "1000111")) else -- RETURN
	"11" when operand_ra = dest_addr_wb else
	"11" when (("111" = dest_addr_wb) and (opcode = "1000111")) else -- RETURN
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

iostall: process (ioflag, opcode, io_switch_in)
begin
	case opcode is
		when "0100000" => -- OUT
			ioflag <= '1';
		when "0100001" => -- IN
			ioflag <= '1';
		when others =>
			-- don't raise ioflag
	end case;
	case io_switch_in is
		when '1' =>
			ioflag <= '0';
		when others =>
			ioflag <= '1';
	end case;
end process iostall;

-- detect and handle hazard
hazard: process (dataHazard, opcode, ioflag)
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
		when "1000011" => -- BR
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
		when "1000100" => -- BR.N
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
		when "1000101" => -- BR.Z
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
		when "1000110" => -- BR.SUB
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
		when "1000111" => -- RETURN
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
		when "0010000" => -- LOAD
		-- Check Operand for pending write
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
		when "0010001" => -- STORE
		-- Check Operands for pending write
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
		when "0010011" => -- MOV
		-- Check Operand for pending write
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
		when others =>
	end case;
	case ioflag is
		when '1' =>
			stall <='1';
		when others =>
			-- don't stall
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
	'1' when opcode_exe = "1000111" else	-- RETURN
	'0';
	
result_select <=
	"01" when opcode_exe = "1000110" else	-- BR.SUB
	"10" when opcode_exe = "0010000" else	-- LOAD
	"10" when opcode_exe = "0010001" else	-- STORE
	"10" when opcode_exe = "0010010" else	-- LOADIMM
	"10" when opcode_exe = "0010011" else	-- MOV
	"00";

-- MEMORY

mem_write_en <= '1' when opcode_mem = "0010001" else '0'; -- STORE

mem_data_select <= '1' when opcode_mem = "0010000" else '0'; -- LOAD

-- WRITE BACK
reg_wen <=
	'0' when opcode_wb = "0000000" else	-- NOP
	'0' when opcode_wb = "0000111" else	-- TEST
	'0' when opcode_wb = "0100000" else	-- OUT
	'0' when opcode_wb = "1000000" else -- BRR
	'0' when opcode_wb = "1000001" else -- BRR.N
	'0' when opcode_wb = "1000010" else -- BRR.Z
	'0' when opcode_wb = "1000011" else	-- BR
	'0' when opcode_wb = "1000100" else	-- BR.N
	'0' when opcode_wb = "1000101" else	-- BR.Z
	'0' when opcode_wb = "1000111" else	-- RETURN
	'0' when opcode_wb = "0010001" else	-- STORE
	'1';

wr_mode_sel <=
	"01" when ((opcode_wb = "0010010") and (op_m1_wb = '0')) else -- LOADIMM lower
	"10" when ((opcode_wb = "0010010") and (op_m1_wb = '1')) else -- LOADIMM upper
	"00";

wb_mux_sel <= '1' when opcode_wb = "0100001" else '0'; -- IN

end Behavioral;

