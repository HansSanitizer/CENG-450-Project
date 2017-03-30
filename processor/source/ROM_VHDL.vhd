library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;


entity ROM_VHDL is
    port(
         clk      : in  std_logic;
         addr     : in  std_logic_vector (15 downto 0);
         data     : out std_logic_vector (15 downto 0)
         );
end ROM_VHDL;

architecture BHV of ROM_VHDL is

    type ROM_TYPE is array (0 to 255) of std_logic_vector (7 downto 0);

    constant rom_content : ROM_TYPE := (
		"00100100","00000001", -- LOADIMM.lower #1
		"00100111","01111000", -- MOV r5, r7
		"00100110","01101000", -- MOV r1, r5
		"00100111","10101000", -- MOV r6, r5
		"00001011","10000001", -- SHL r6 #1
		"01000010","00000000", -- IN r0
		"00000110","01001000", -- MUL r1, r1, r0		-- actual mul for factorial of IN
		"00000100","00000101", -- SUB r0, r0, r5
		"00000101","00000101", -- SUB r4, r0, r5
		"00000000","00000000", -- NOP
		"00001111","00000000", -- TEST r4
		"10000010","00000011", -- BRR.N 3				-- goto (OUT)
		"10000111","10000101", -- BR r6, 5				-- goto (MUL)
		"00000000","00000000", -- NOP
		"01000000","01000000", -- OUT r1					-- print the result
		"10000001","11110001", -- BRR -15				-- loop forever
		others => "00000000"); -- NOP
begin

p1:    process (clk)
	 variable add_in : integer := 0;
    begin
        if rising_edge(clk) then
					add_in := conv_integer(unsigned(addr));
					data(7 downto 0) <= rom_content(add_in+1);
					data(15 downto 8) <= rom_content(add_in);					 
        end if;
		  
    end process;

end BHV;