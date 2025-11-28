library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_16bits is
    port(
        a      : in  std_logic_vector(15 downto 0);
        b      : in  std_logic_vector(15 downto 0);
        sel    : in  std_logic_vector(2 downto 0);  -- sélection de l'opération
        result : out std_logic_vector(31 downto 0);
        cout   : out std_logic;
        flag   : out std_logic   -- drapeau zero
    );
end entity;

architecture struct of alu_16bits is

    -- composants
    component adder_16bits
        port(a, b : in std_logic_vector(15 downto 0);
             cin   : in std_logic;
             cout  : out std_logic;
             s     : out std_logic_vector(15 downto 0));
    end component;

    component sub_16bits
        port(a, b : in std_logic_vector(15 downto 0);
             bin   : in std_logic;
             bout  : out std_logic;
             d     : out std_logic_vector(15 downto 0));
    end component;

    component multiply
        port(a, b : in std_logic_vector(15 downto 0);
             p     : out std_logic_vector(31 downto 0));
    end component;

    component divide
        port(a, b : in std_logic_vector(15 downto 0);
             q, r  : out std_logic_vector(15 downto 0));
    end component;

    -- signaux internes
    signal sum16, sub16      : std_logic_vector(15 downto 0);
    signal mul32             : std_logic_vector(31 downto 0);
    signal divq, divr        : std_logic_vector(15 downto 0);
    signal and16, or16, xor16, not16 : std_logic_vector(15 downto 0);
    signal cout_add, cout_sub : std_logic;
    signal result_int        : std_logic_vector(31 downto 0);

begin

    -- instanciation des blocs
    add: adder_16bits port map(a => a, b => b, cin => '0', cout => cout_add, s => sum16);
    sub: sub_16bits  port map(a => a, b => b, bin => '0', bout => cout_sub, d => sub16);
    mul: multiply    port map(a => a, b => b, p => mul32);
    div: divide      port map(a => a, b => b, q => divq, r => divr);

    -- blocs logiques
    and16 <= a and b;
    or16  <= a or b;
    xor16 <= a xor b;
    not16 <= not a;

    -- multiplexeur pour choisir le résultat
    process(sel, sum16, sub16, mul32, divq, divr, and16, or16, xor16, not16)
    begin
        case sel is
            when "000" => result_int <= ("0000000000000000" & sum16);
            when "001" => result_int <= ("0000000000000000" & sub16);
            when "010" => result_int <= mul32;
            when "011" => result_int <= ("0000000000000000" & divq);
            when "100" => result_int <= ("0000000000000000" & and16);
            when "101" => result_int <= ("0000000000000000" & or16);
            when "110" => result_int <= ("0000000000000000" & xor16);
            when "111" => result_int <= ("0000000000000000" & not16);
            when others => result_int <= (others => '0');
        end case;
    end process;

    -- assignation du signal interne au port out
    result <= result_int;

    -- drapeau zero
    flag <= '1' when unsigned(result_int) = 0 else '0';

    -- drapeau cout pour add/sub uniquement
    process(sel, cout_add, cout_sub)
    begin
        if sel = "000" then
            cout <= cout_add;
        elsif sel = "001" then
            cout <= cout_sub;
        else
            cout <= '0';
        end if;
    end process;

end struct;
