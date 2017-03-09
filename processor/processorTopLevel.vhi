
-- VHDL Instantiation Created from source file processorTopLevel.vhd -- 10:22:53 03/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT processorTopLevel
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		wr_data : IN std_logic_vector(15 downto 0);       
		);
	END COMPONENT;

	Inst_processorTopLevel: processorTopLevel PORT MAP(
		clk => ,
		rst => ,
		wr_data => 
	);


