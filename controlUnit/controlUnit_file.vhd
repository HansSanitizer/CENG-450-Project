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
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  address : out STD_LOGIC_VECTOR(6 downto 0);
			  instruction : in STD_LOGIC_VECTOR(15 downto 0);
			  ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  reg_wd : out STD_LOGIC_VECTOR(15 downto 0);
			  reg_wen : out STD_LOGIC;
			  alu_code : out STD_LOGIC_VECTOR(2 downto 0));
end controlUnit_file;

architecture Behavioral of controlUnit_file is
--Define states for each stage
type state_type is (fetch, decode, execute);
signal Current_State, Next_State : state_type;
signal PC : unsigned(6 downto 0) := "0000000";
signal PC_next : unsigned(6 downto 0);
signal instr_reg : STD_LOGIC_VECTOR(15 downto 0);

alias opcode is instr_reg(15 downto 9);
alias operand_ra is instr_reg(8 downto 6);
alias operand_rb is instr_reg(5 downto 3);
alias operand_rc is instr_reg(2 downto 0);

begin

process(clk)
begin
	if(rst = '1') then
		Current_State <= fetch;
	elsif (clk'event and clk = '1') then
		Current_State <= Next_State;
	end if;
end process;

process(Current_State)
begin
	case Current_State is
		when fetch =>
			address <= STD_LOGIC_VECTOR(PC);
			instr_reg <= instruction;
			Next_State <= decode;
		when decode =>
			PC <= PC_next;
			
			ra_addr <= operand_ra;
			rb_addr <= operand_rb;
			rc_addr <= operand_rc;
			
			alu_code <=
			"001" when(opcode="0000001") else
			"010" when(opcode="0000010") else
			"011" when(opcode="0000011") else
			"100" when(opcode="0000100") else "000";
			
			if (opcode ="0100001") then
				reg_wen <= '1';
			else
				reg_wen <= '0';
			end if;
			
			Next_State <= execute;
		when execute =>
			Next_State <= fetch;
		when others =>
			NULL;
	end case;
end process;

PC_next <= PC + 1;
reg_wd <= X"0003";

end Behavioral;

