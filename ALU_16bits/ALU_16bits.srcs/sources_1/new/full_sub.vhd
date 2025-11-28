----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2025 17:07:46
-- Design Name: 
-- Module Name: full_sub - Behavioral
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

entity full_sub is
    Port ( a,b,bin : in STD_LOGIC;
           d,bout : out STD_LOGIC);
end full_sub;

architecture gate_arch of full_sub is

begin
    d  <= a xor b xor bin;
    bout <= (not a and b) or ((not a xor b) and bin);

end gate_arch;
