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
		"00000011","00010011",	-- ADD r4, r2, r3
		"01000001","00000000",	-- OUT r4
   	"00000000","00000000",	-- NOP
		"10000001","11111010",	-- BRR -6
		"00000011","01010011",	-- ADD r5, r2, r3
		"00000011","10010011",	-- ADD r6, r2, r3
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