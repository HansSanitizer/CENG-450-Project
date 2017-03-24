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
   	"00000000","00000000",
		"00000000","00000000",	
		"01000010","01000000",  -- IN r1
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"01000010","10000000",  -- IN r2
		"00001010","11010001",  -- NAND r3, r2, r1
		"00001011","00010001",  -- NAND r4, r2, r1
		"00001011","01010001",  -- NAND r5, r2, r1
		"01000010","11000000",  -- IN r3
		"00001010","10001011",  -- NAND r2, r1, r3
		"00001011","00001011",  -- NAND r4, r1, r3
		"00001011","01001011",  -- NAND r5, r1, r3
		"00001010","01100101",  -- NAND r1, r4, r5
		"00001010","10001101",  -- NAND r2, r1, r5
		"00001010","11101001",  -- NAND r3, r5, r1
		"00001011","00010001",  -- NAND r4, r2, r1
		"00100011","01100000",  -- STORE r5, r4
		"00100001","10101000",  -- LOAD r6, r5
		"00001010","01110101",  -- NAND r1, r6, r5
		"00001010","10110101",  -- NAND r2, r6, r5
		"00001010","11110101",  -- NAND r3, r6, r5
		"00100000","00101000",  -- LOAD r0, r5
		"00001010","01100000",  -- NAND r1, r4, r0
		"00001010","10100000",  -- NAND r2, r4, r0
		"00001010","11100000",  -- NAND r3, r4, r0
		"00100111","00101000",  -- NAND r4, r5
		"00001011","10100101",  -- MUL r6, r4, r5
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