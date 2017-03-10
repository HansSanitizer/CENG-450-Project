----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    16:27:24 03/09/2017
-- Design Name:
-- Module Name:    RAM_VHDL - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

entity RAM_VHDL is
  generic(N: integer := 8; M: integer := 8);
  port(clk,
    we: in STD_LOGIC;
    adr: in STD_LOGIC_VECTOR(15 downto 0);
    din: in STD_LOGIC_VECTOR(15 downto 0);
    dout: out STD_LOGIC_VECTOR(15 downto 0));
end;

architecture synth of RAM_VHDL is
  type mem_array is array ((2**N-1) downto 0)
    of STD_LOGIC_VECTOR (M-1 downto 0);
  signal mem: mem_array;
begin
	process(clk) begin
		if rising_edge(clk) then
			if (we = '1') then 
				mem(to_integer(unsigned(adr(7 downto 0)))) <= din(7 downto 0);
				mem(to_integer(unsigned(adr(7 downto 0))) + 1) <= din(15 downto 8);
			end if;
		end if;
	end process;
  
	process(clk) begin
		if falling_edge(clk) then
			dout(7 downto 0) <= mem(to_integer(unsigned(adr(7 downto 0))));
			dout(15 downto 8) <= mem(to_integer(unsigned(adr(7 downto 0)) + 1));
		end if;
	end process;
end;
