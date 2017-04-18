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
--		-- Format A
--   	"00000000","00000000",
--		"00000000","00000000",	
--		"01000010","01000000",  -- IN r1
--		"01000010","10000000",  -- IN r2
--		"01000010","11000000",  -- IN r3	
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000010","11010001",  -- ADD r3, r2, r1
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00001010","11000010",  -- SHL r3, 2
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000110","10001011",  -- MUL r2, r1, r3
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"00000000","00000000",  -- NOP
--		"01000000","10000000",  -- OUT r2	
--		-- Format B Test 2
--		"01000010","00000000", -- IN R0 , 02  -- This example tests the branching capabilities of the design.No data dependencies.
--		"01000010","01000000", -- IN R1 , 03  -- The values to be loaded into the corresponding resgister.
--		"01000010","10000000", -- IN R2 , 01
--		"01000010","11000000", -- IN R3 , 05  --  End of initialization
--		"01000011","00000000", -- IN R4 , 20
--		"01000011","01000000", -- IN R5 , 01 -- for absolute branching
--		"01000011","10000000", -- IN R6 , 05 -- r6 is counter for the loop and indicates the number of times the loop is done.
--		"01000011","11000000", -- IN R7 , 00
--		"10001101","00000001", -- BR.SUB R4, 1 -- Go to the subroutine
--		"10000000","00000000", -- BRR 0     -- Infinite loop (the end of the program)
--		"00000010","10001101", -- ADD R2, R1, R5  -- Start of the subroutine. It runs for 5 times. R2 <-- R1 + 1
--		"00000101","10110101", -- SUB R6, R6, R5  -- R6 <-- R6 - 1   The counter for the loop.
--		"00001111","10000000", -- TEST R6         -- Set the z flag for the branch decision
--		"10001011","00000110", -- BR.z R4, 6     -- If r6 is zero, jump out of the loop. 
--		"10000001","11111100", -- BRR -4		-- If not jump to the start of the subroutine.
--		"10001110","00000000", -- RETURN 
		-- Format L Test
		"00100100","00001111", -- LOADIMM.LOWER #15
		"00100101","00000101", -- LOADIMM.UPPER #5
		"00100110","01111000", -- MOV R1, R7
		"00100100","00000110", -- LOADIMM.LOWER #6
		"00100101","00000000", -- LOADIMM.UPPER #0
		"00100110","10111000", -- MOV R2, R7
		"00100010","10001000", -- STORE R2, R1
		"00100000","11010000", -- LOAD R3, R2
--		-- TEST 1
--		"00100100","00000011", -- LOADIMM.lower #3
--		"00100111","10111000", -- MOV r6, r7			r6=3
--		"00100100","00000001", -- LOADIMM.lower #1
--		"00100111","01111000", -- MOV r5, r7			r5=1
--		"00100100","00000010", -- LOADIMM.lower #2	-- To fix issues with word alignment
--		"01000010","00000000", -- IN r0					--(IN-->r0, r1=r0+1)
--		"00000010","01000110", -- ADD r1, r0, r6		--r1=r0+3,2,1
--		"00000110","10000000", -- MUL r2, r0, r0		--r2=r0^2
--		"00000110","11001001", -- MUL r3, r1, r1		--r3=r1^2
--		"00000100","11011010", -- SUB r3, r3, r2		r1^2-r0^2
--		"00100011","11011000", -- STORE r7, r3			r3,@r7
--		"00000010","10000001", -- ADD r2, r0, r1		r1+r0
--		"00100011","00010000", -- STORE r4, r2			r2,@r4
--		"00100000","10100000", -- LOAD r2, r4			r2,@r4
--		"00100000","11111000", -- LOAD r3, r7			r3,@r7
--		"00000100","10010011", -- SUB r2, r2, r3		-- it should be zero
--		"00001110","10000000", -- TEST r2
--		"10000100","00000011", -- BRR.Z 3				-- goto (OUT)
--		"00000101","10110101", -- SUB r6, r6, r5		-- decrement r6; r6=r6-1
--		"10000111","11000101", -- BR r7, 5				-- goto (r7+10)=12 (000a)
--		"01000000","11000000", -- OUT r3					-- print the result
--		"10000001","11101011", -- BRR -21				-- loop forever	
--		-- TEST 2		
--		"00100100","00000001", -- LOADIMM.lower #1
--		"00100111","01111000", -- MOV r5, r7
--		"00100110","01101000", -- MOV r1, r5
--		"00100111","10101000", -- MOV r6, r5
--		"00001011","10000001", -- SHL r6 #1
--		"01000010","00000000", -- IN r0
--		"00000110","01001000", -- MUL r1, r1, r0		-- actual mul for factorial of IN
--		"00000100","00000101", -- SUB r0, r0, r5
--		"00000101","00000101", -- SUB r4, r0, r5
--		"00000000","00000000", -- NOP
--		"00001111","00000000", -- TEST r4
--		"10000010","00000011", -- BRR.N 3				-- goto (OUT)
--		"10000111","10000101", -- BR r6, 5				-- goto (MUL)
--		"00000000","00000000", -- NOP
--		"01000000","01000000", -- OUT r1					-- print the result
--		"10000001","11110001", -- BRR -15				-- loop forever
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