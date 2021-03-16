----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2018 11:48:18 AM
-- Design Name: 
-- Module Name: bit_resversal_reg - Behavioral
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

entity bit_resversal_reg is
Port ( 
ck,en: in std_logic;
x: in std_logic_vector(4 downto 0);
z: out std_logic_vector(4 downto 0));
end bit_resversal_reg;

architecture Behavioral of bit_resversal_reg is

component reg
generic (n:natural);
port ( 
 x: in std_logic_vector(n-1 downto 0);
 z: out std_logic_vector(n-1 downto 0);
 ck, ld_en: in std_logic);
end component; 


begin
U1: reg generic map (5)
port map(x => x, z=> z, ck=>ck, ld_en => en);

end Behavioral;
   
   
   
   
