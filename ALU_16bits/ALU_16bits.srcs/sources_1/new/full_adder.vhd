library ieee;
use ieee.std_logic_1164.all;

entity full_adder is 
Port(a,b, cin : in std_logic;
cout, s :out std_logic );
end entity;

architecture gate_arch of full_adder is 
begin
s <=(a xor b) xor cin;
cout <= (a and b)or ((a xor b)and cin);
end gate_arch;