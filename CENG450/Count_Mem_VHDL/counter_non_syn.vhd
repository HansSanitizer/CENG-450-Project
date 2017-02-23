library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity counter is

generic(n: natural :=7);
port(clock:in std_logic;
reset:in std_logic;
en:in std_logic;
Q:out std_logic_vector(n-1 downto 0)
);
end counter;
 
----------------------------------------------------

architecture behv of counter is   

    signal Pre_Q: std_logic_vector(n-1 downto 0);

begin

    -- behavior describe the counter

    process
    begin
wait on clock;
if reset = '1' then
     Pre_Q <= "0000000";
elsif en = '1' then    
Pre_Q <= Pre_Q + 1;
    end if;

    end process;

    -- concurrent assignment statement
    Q <= Pre_Q;

end behv;
