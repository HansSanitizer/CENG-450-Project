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
		"01000010","10000000",  -- IN r2
		"01000010","11000000",  -- IN r3	
		"01000011","00000000",  -- IN r4
		"01000011","01000000",  -- IN r5
		"01000011","10000000",  -- IN r6
		"00000000","00000000",  -- NOP
		"00000010","11010001",  -- ADD r3, r2, r1
		"00000011","00101110",  -- ADD r4, r5, r6
		"00000010","01011100",  -- ADD r1, r3, r4
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"00001010","11000010",  -- SHL r3, 2
		"10000000","00000100",  -- BRR #4
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"00000110","10001011",  -- MUL r2, r1, r3
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"00000000","00000000",  -- NOP
		"01000000","10000000",  -- OUT r2	
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