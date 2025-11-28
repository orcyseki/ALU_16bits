library ieee;
use ieee.std_logic_1164.all;

entity adder_16bits is 
    Port(a,b: in std_logic_vector(15 downto 0);
    cin :in std_logic;
    cout:out std_logic;
    s : out std_logic_vector(15 downto 0));
end entity;

architecture struct of adder_16bits is 

component full_adder
    Port(a,b, cin : in std_logic;
    cout, s :out std_logic );
end component;

signal c : std_logic_vector(16 downto 0);
begin
    c(0) <=cin;
    gen_add: for i in 0 to 15 generate
    FA: full_adder port map (
        a => a(i),
        b => b(i),
        cin =>c(i),
        s =>s(i),
        cout => c(i+1) );   
    end generate; 
    cout <= c(16);
end struct; 