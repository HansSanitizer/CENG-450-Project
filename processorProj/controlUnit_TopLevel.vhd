----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:40 02/21/2017 
-- Design Name: 
-- Module Name:    controlUnit_TopLevel - Structure 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controlUnit_TopLevel is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  reg_wd : out STD_LOGIC_VECTOR(15 downto 0);
			  reg_wen : out STD_LOGIC;
			  alu_code : out STD_LOGIC_VECTOR(2 downto 0));
end controlUnit_TopLevel;

architecture Structure of controlUnit_TopLevel is

component controlUnit_file is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  address : out STD_LOGIC_VECTOR(6 downto 0);
			  instruction : in STD_LOGIC_VECTOR(15 downto 0);
			  ra_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rb_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  rc_addr : out STD_LOGIC_VECTOR(2 downto 0);
			  reg_wd : out STD_LOGIC_VECTOR(15 downto 0);
			  reg_wen : out STD_LOGIC;
			  alu_code : out STD_LOGIC_VECTOR(2 downto 0)
			  );
end component;

component ROM_VHDL is
	port(
         clk      : in  std_logic;
         addr     : in  std_logic_vector (6 downto 0);
         data     : out std_logic_vector (15 downto 0)
         );
end component;

signal address : STD_LOGIC_VECTOR (6 downto 0);
signal instruction : STD_LOGIC_VECTOR (15 downto 0);

begin

ctrlu0: controlUnit_file port map (clk, rst, address, instruction, ra_addr, rb_addr, rc_addr, reg_wd, reg_wen, alu_code);
rom0: ROM_VHDL port map (clk, address, instruction);

end Structure;

