
-- VHDL Instantiation Created from source file ROM_VHDL.vhd -- 10:23:51 03/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ROM_VHDL
	PORT(
		clk : IN std_logic;
		addr : IN std_logic_vector(6 downto 0);          
		data : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_ROM_VHDL: ROM_VHDL PORT MAP(
		clk => ,
		addr => ,
		data => 
	);


