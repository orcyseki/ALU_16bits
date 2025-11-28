library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiply is 
    Port(a,b: in std_logic_vector(15 downto 0);
    P : out std_logic_vector(31 downto 0));
end entity;

architecture behavioral of multiply is
begin
    P <=std_logic_vector( unsigned (a) * unsigned(b)); 
end behavioral;