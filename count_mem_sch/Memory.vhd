-- VHDL model - Mon Jan 17 15:01:05 2005

-----------------------------------------------------------
--     ROM Memory 
--  ----------------
--
--	Include this file in your project to add Read-Only memory
--	With pre-loaded data to your CPU.  Use CoreGen or edit
--	this file to create read-write memories.
--
--	There are two things to customize within this file:
--	  1) The mem_address_width constant below
--	  2) The data stored within the memory
--
--	For VHDL flows, cut and paste the following blocks into 
--	your top level to add this memory to your design.
--
--	1) to declare the component, paste the following 5 lines 
--	   in the "Architecture" before "begin"
--
--   component memp
--   PORT(
--      addr: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--      dout: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
--   end component;
--
--	2) to instantiate the component, paste the following 2
--	   lines just after "begin"
--
--   MP: MEMP
--    	port map(addr => address_bus(7 downto 0), dout => data_bus);
--
----------------------------------------------------------
-- (c) Kaveh Jokar Deris and the University of Victoria, 2005
----------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.all;
package prog_mem is
		--change this to change the size
	constant mem_address_width : integer := 8;	
	constant mem_depth : integer := 2**mem_address_width;
	type storage_array is array ((mem_depth-1) downto 0) of std_logic_vector(7 downto 0);
end package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE work.prog_mem.all;

ENTITY Memory IS
	port (
	addr: IN std_logic_VECTOR((mem_address_width - 1) downto 0);
	dout: OUT std_logic_VECTOR(7 downto 0));
END Memory;

ARCHITECTURE CFG OF Memory IS
	constant storage : storage_array := (
	
	-- cut and past your program here
	--	be careful to make the distinction between decimal and hex values, especially
	--	Indexes in the first column, 
	--	below, are in decimal, whereas the data supplied is in hexadecimal
	
		0 	=>	x"01", 
		1	=>	x"02", 			
		2	=> 	x"04", 
		3	=>	x"08", 
		4	=>	x"10", 
		5	=>	x"20", 
		6	=>	x"40", 
		7	=>	x"80", 
		8	=>	x"40", 
		9	=>	x"20", 
		10	=>	x"10",
		11	=>	x"08", 
		12	=>	x"04",
		13	=>	x"02",
		14	=>	x"01",
		15	=>	x"00",
		
		16	=>	x"01",
		17	=>	x"03",
		18	=>	x"06", 			
		19	=> 	x"0C", 
		20	=>	x"18", 
		21	=>	x"30", 
		22	=>	x"60", 
		23	=>	x"C0", 
		24	=>	x"60", 
		25	=>	x"30", 
		26	=>	x"18", 
		27	=>	x"0C",
		28	=>	x"06", 
		29	=>	x"03",
		30	=>	x"01",
		31	=>	x"00",
				
		32	=>	x"01",
		33	=>	x"03",
		34	=>	x"07", 			
		35	=> 	x"0F", 
		36	=>	x"1F", 
		37	=>	x"3F", 
		38	=>	x"7F", 
		39	=>	x"FF", 
		40	=>	x"FE", 
		41	=>	x"FC", 
		42	=>	x"F8", 
		43	=>	x"F0",
		44	=>	x"E0", 
		45	=>	x"C0",
		46	=>	x"80",
		47	=>	x"00",
		
		48	=>	x"80",
		49	=>	x"C0",
		50	=>	x"E0", 			
		51	=> 	x"F0", 
		52	=>	x"F8", 
		53	=>	x"FC", 
		54	=>	x"FE", 
		55	=>	x"FF", 
		56	=>	x"7F", 
		57	=>	x"3F", 
		58	=>	x"1F",
		59	=>	x"0F", 
		60	=>	x"07",
		61	=>	x"03",
		62	=>	x"01",
		63	=>	x"00",
		
		64	=>	x"01",
		65	=>	x"02", 			
		66	=> 	x"04", 
		67	=>	x"08", 
		68	=>	x"10", 
		69	=>	x"20", 
		70	=>	x"40", 
		71	=>	x"80", 
		72	=>	x"40", 
		73	=>	x"20", 
		74	=>	x"10",
		75	=>	x"08", 
		76	=>	x"04",
		77	=>	x"02",
		78	=>	x"01",
		79	=>	x"00",
		
		80	=>	x"01",
		81	=>	x"03",
		82	=>	x"06", 			
		83	=> 	x"0C", 
		84	=>	x"18", 
		85	=>	x"30", 
		86	=>	x"60", 
		87	=>	x"C0", 
		88	=>	x"60", 
		89	=>	x"30", 
		90	=>	x"18", 
		91	=>	x"0C",
		92	=>	x"06", 
		93	=>	x"03",
		94	=>	x"01",
		95	=>	x"00",
				
		96	=>	x"01",
		97	=>	x"03",
		98	=>	x"07", 			
		99	=> 	x"0F", 
		100	=>	x"1F", 
		101	=>	x"3F", 
		102	=>	x"7F", 
		103	=>	x"FF", 
		104	=>	x"FE", 
		105	=>	x"FC", 
		106	=>	x"F8", 
		107	=>	x"F0",
		108	=>	x"E0", 
		109	=>	x"C0",
		110	=>	x"80",
		111	=>	x"00",
		
		112	=>	x"80",
		113	=>	x"C0",
		114	=>	x"E0", 			
		115	=> 	x"F0", 
		116	=>	x"F8", 
		117	=>	x"FC", 
		118	=>	x"FE", 
		119	=>	x"FF", 
		120	=>	x"7F", 
		121	=>	x"3F", 
		122	=>	x"1F",
		123	=>	x"0F", 
		124	=>	x"07",
		125	=>	x"03",
		126	=>	x"01",
		127	=>	x"00",				
		
		--Leave this line in to make sure all unspecified values are set to 00.
		others => 	x"00"); 
begin

	--respond to ROM accesses
	dout <= storage(conv_integer(addr));		
END CFG;


