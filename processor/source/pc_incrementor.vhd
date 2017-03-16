----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:37 03/02/2017 
-- Design Name: 
-- Module Name:    pc_incrementor - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc_incrementor is
	port (	input : IN STD_LOGIC_VECTOR(15 downto 0);
				output : OUT STD_LOGIC_VECTOR(15 downto 0));
end pc_incrementor;

architecture Behavioral of pc_incrementor is

begin

output <= std_logic_vector(unsigned(input) +2 );

end Behavioral;

