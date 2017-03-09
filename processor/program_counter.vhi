
-- VHDL Instantiation Created from source file program_counter.vhd -- 10:23:21 03/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT program_counter
	PORT(
		clk : IN std_logic;
		next_value : IN std_logic_vector(6 downto 0);          
		current_value : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

	Inst_program_counter: program_counter PORT MAP(
		clk => ,
		next_value => ,
		current_value => 
	);


