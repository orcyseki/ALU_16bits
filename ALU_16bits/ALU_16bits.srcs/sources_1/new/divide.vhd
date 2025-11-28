library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity div_16bits is
    Port(
        A  : in  STD_LOGIC_VECTOR(15 downto 0);
        B  : in  STD_LOGIC_VECTOR(15 downto 0);
        Q  : out STD_LOGIC_VECTOR(15 downto 0);
        R  : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture Behavioral of div_16bits is
    signal A_unsigned : unsigned(15 downto 0);
    signal B_unsigned : unsigned(15 downto 0);
    signal Q_unsigned : unsigned(15 downto 0);
    signal R_unsigned : unsigned(15 downto 0);
begin
    A_unsigned <= unsigned(A);
    B_unsigned <= unsigned(B);

    Q_unsigned <= A_unsigned / B_unsigned;  -- quotient
    R_unsigned <= A_unsigned mod B_unsigned;  -- reste

    Q <= std_logic_vector(Q_unsigned);
    R <= std_logic_vector(R_unsigned);
end Behavioral;
