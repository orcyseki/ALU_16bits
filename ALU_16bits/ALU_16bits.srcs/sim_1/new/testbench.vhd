----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 19:19:38
-- Design Name: 
-- Module Name: testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity;

architecture sim of testbench is

    -- signaux de test
    signal a, b      : std_logic_vector(15 downto 0);
    signal sel       : std_logic_vector(2 downto 0);
    signal result    : std_logic_vector(31 downto 0);
    signal cout      : std_logic;
    signal zero      : std_logic;

begin

    -- instanciation de l'alu
    uut: entity work.alu_16bits
        port map(
            a      => a,
            b      => b,
            sel    => sel,
            result => result,
            cout   => cout,
            flag   => zero
        );

    -- processus de test
    stim_proc: process
    begin
        -- initialisation
        a <= x"0001";
        b <= x"0001";
        sel <= "000";  -- add
        wait for 10 ns;

        a <= x"0005";
        b <= x"0003";
        sel <= "001";  -- sub
        wait for 10 ns;

        a <= x"0004";
        b <= x"0002";
        sel <= "010";  -- mul
        wait for 10 ns;

        a <= x"0008";
        b <= x"0002";
        sel <= "011";  -- div
        wait for 10 ns;

        a <= x"00F0";
        b <= x"0F0F";
        sel <= "100";  -- and
        wait for 10 ns;

        sel <= "101";  -- or
        wait for 10 ns;

        sel <= "110";  -- xor
        wait for 10 ns;

        sel <= "111";  -- not (sur a)
        wait for 10 ns;

        -- test zéro
        a <= x"0000";
        b <= x"0000";
        sel <= "000";  -- add
        wait for 10 ns;

        -- fin simulation
        wait;
    end process;

end architecture;
