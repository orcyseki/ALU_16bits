library ieee;
use ieee.std_logic_1164.all;

entity sub_16bits is 
    Port(
        a    : in std_logic_vector(15 downto 0);
        b    : in std_logic_vector(15 downto 0);
        bin  : in std_logic;
        bout : out std_logic;
        d    : out std_logic_vector(15 downto 0)
    );
end entity;

architecture struct of sub_16bits is 

    component full_sub
        Port (
            a    : in STD_LOGIC;
            b    : in STD_LOGIC;
            bin  : in STD_LOGIC;
            d    : out STD_LOGIC;
            bout : out STD_LOGIC
        );
    end component;

    signal B_intern : std_logic_vector(16 downto 0);

begin

    B_intern(0) <= bin;   
    
    gen_sub: for i in 0 to 15 generate
        FS: full_sub port map (
            a    => a(i),
            b    => b(i),
            bin  => B_intern(i),
            d    => d(i),
            bout => B_intern(i+1)
        );
    end generate;

    bout <= B_intern(16);  

end struct;
