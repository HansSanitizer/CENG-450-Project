-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT cpu_file
          Port (	clk: in std_logic;
				rst : in std_logic;
				-- Control Unit Signals
				instr_out : OUT STD_LOGIC_VECTOR(15 downto 0);
				op_index1: in std_logic_vector(2 downto 0); 
				op_index2: in std_logic_vector(2 downto 0);         
				alu_code : in  STD_LOGIC_VECTOR(2 downto 0);
				opcode_in : IN STD_LOGIC_VECTOR(6 downto 0);
				alu_in : IN STD_LOGIC_VECTOR(2 downto 0);
				dest_addr_in : IN STD_LOGIC_VECTOR(2 downto 0);
				-- EXE Stage Signals Monitored by Control Unit
				--opcode_EXE : OUT STD_LOGIC_VECTOR(6 downto 0);
				--dest_addr_EXE : OUT STD_LOGIC_VECTOR(2 downto 0);
				--op1_addr_EXE : OUT STD_LOGIC_VECTOR(2 downto 0);
				--op2_addr_EXE : OUT STD_LOGIC_VECTOR(2 downto 0);
				--write signals (From WB stage)
				wr_index: in std_logic_vector(2 downto 0); 
				wr_data: in std_logic_vector(15 downto 0);
				wr_enable: in std_logic;
				result_out: OUT STD_LOGIC_VECTOR(15 downto 0));
          END COMPONENT;

				-- inputs
          SIGNAL clk :  std_logic := '0';
			 SIGNAL rst :	std_logic := '0';
			 signal op_index1: std_logic_vector(2 downto 0) := (others => '0');
			 signal op_index2:  std_logic_vector(2 downto 0) := (others => '0');         
			 signal alu_code :  STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
			 signal opcode_in : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
			 signal alu_in : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
			 signal dest_addr_in : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
			 signal wr_index: std_logic_vector(2 downto 0) := (others => '0'); 
			 signal wr_data: std_logic_vector(15 downto 0) := (others => '0');
			 signal wr_enable: std_logic := '0';
			 
			 -- output
          SIGNAL instruction :  std_logic_vector(15 downto 0);
			 signal result_out : std_logic_vector(15 downto 0);
          
   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
  BEGIN

  -- Component Instantiation
          uut: cpu_file PORT MAP(
                  clk => clk,
                  rst => rst,
						instr_out => instruction,
						op_index1 => op_index1,
						op_index2 => op_index2,
						alu_code => alu_code,
						opcode_in => opcode_in,
						alu_in => alu_in,
						dest_addr_in => dest_addr_in,
						wr_index => wr_index,
						wr_data => wr_data,
						wr_enable => wr_enable,
						result_out => result_out
          );


  --  Test Bench Statements
  -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
