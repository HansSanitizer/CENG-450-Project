-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT alu_file
          PORT(
                  in1 : in  STD_LOGIC_VECTOR(15 downto 0);
						in2 : in  STD_LOGIC_VECTOR(15 downto 0);
						alu_mode : in  STD_LOGIC_VECTOR(2 downto 0);
						clk : in  STD_LOGIC;
						rst : in  STD_LOGIC;
						result : out  STD_LOGIC_VECTOR(15 downto 0);
						z_flag : out  STD_LOGIC;
						n_flag : out  STD_LOGIC
                  );
          END COMPONENT;

          SIGNAL clk, rst, z_flag, n_flag :  std_logic;
          SIGNAL alu_mode :  std_logic_vector(2 downto 0);
			 SIGNAL in1, in2, result : std_logic_vector(15 downto 0);
          

  BEGIN

  -- Component Instantiation
  u0:alu_file port map(in1, in2, alu_mode, clk, rst, result, z_flag, n_flag);


  --  Test Bench Statements
     PROCESS
     BEGIN
		clk <= '0'; wait for 10 us;
		clk <= '1'; wait for 10 us;
     END PROCESS;
	  PROCESS
	  BEGIN
		alu_mode <= "000"; in1 <= X"0000"; in2 <= X"0000"; rst <= '0';
		wait until (clk='1' and clk'event);
		alu_mode <= "001"; in1 <= X"0002"; in2 <= X"0002";
		wait until (clk='1' and clk'event);
		alu_mode <= "010"; in1 <= X"0003"; in2 <= X"0002";
		wait until (clk='1' and clk'event);
		in1 <= X"0005"; in2 <= X"0006";
		wait until (clk='1' and clk'event);
		alu_mode <= "011"; in1 <= X"0002"; in2 <= X"0003";
		wait until (clk='1' and clk'event);
		alu_mode <= "100"; in1 <= X"00FF"; in2 <= X"FFFF";
		wait until (clk='1' and clk'event);
		alu_mode <= "101"; in1 <= X"0001"; in2 <= X"0002";
		wait until (clk='1' and clk'event);
		alu_mode <= "110"; in1 <= X"00F0"; in2 <= X"0004";
		wait until (clk='1' and clk'event);
		alu_mode <= "111"; in1 <= X"0000";
		wait until (clk='1' and clk'event);
		in1 <= X"8000";
		wait until (clk='1' and clk'event);
		in1 <= X"0ABC";
		wait;
	  END PROCESS;
  --  End Test Bench 

  END behavior;
