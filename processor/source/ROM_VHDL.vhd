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
		"00100100","00000011", -- LOADIMM.lower #3
		"00100111","10111000", -- MOV r6, r7			r6=3
		"00100100","00000001", -- LOADIMM.lower #1
		"00100111","01111000", -- MOV r5, r7			r5=1
		"00100100","00000010", -- LOADIMM.lower #2	-- To fix issues with word alignment
		"01000010","00000000", -- IN r0					--(IN-->r0, r1=r0+1)
		"00000010","01000110", -- ADD r1, r0, r6		--r1=r0+3,2,1
		"00000110","10000000", -- MUL r2, r0, r0		--r2=r0^2
		"00000110","11001001", -- MUL r3, r1, r1		--r3=r1^2
		"00000100","11011010", -- SUB r3, r3, r2		r1^2-r0^2
		"00100011","11011000", -- STORE r7, r3			r3,@r7
		"00000010","10000001", -- ADD r2, r0, r1		r1+r0
		"00100011","00010000", -- STORE r4, r2			r2,@r4
		"00100000","10100000", -- LOAD r2, r4			r2,@r4
		"00100000","11111000", -- LOAD r3, r7			r3,@r7
		"00000100","10010011", -- SUB r2, r2, r3		-- it should be zero
		"00001110","10000000", -- TEST r2
		"10000100","00000011", -- BRR.Z 3				-- goto (OUT)
		"00000101","10110101", -- SUB r6, r6, r5		-- decrement r6; r6=r6-1
		"10000111","11000101", -- BR r7, 5				-- goto (r7+10)=12 (000a)
		"01000000","11000000", -- OUT r3					-- print the result
		"10000001","11101011", -- BRR -21				-- loop forever
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