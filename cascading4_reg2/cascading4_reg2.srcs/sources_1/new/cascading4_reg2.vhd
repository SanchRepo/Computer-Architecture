----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2018 03:23:14 PM
-- Design Name: 
-- Module Name: cascading4_reg2 - Behavioral
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

entity cascading4_reg2 is
port(x : in std_logic_vector(1 downto 0);
    Z1,Z2,Z3,Z4 : out std_logic_vector(1 downto 0);
    btn0, btn1, ck: in std_logic);
 
end cascading4_reg2;

architecture Behavioral of cascading4_reg2 is
signal en : std_logic;
signal temp1, temp2, temp3, temp4 : std_logic_vector(1 downto 0);
begin

process (ck)
type db_state is (not_rdy, rdy, pulse);
variable db_ns: db_state;
begin
if ck='1' and ck'event then
    case db_ns is
        when not_rdy => en <= '0';
        if btn1 = '1' then db_ns := rdy; end if;
        when rdy => en <= '0';
        if btn0 = '1' then db_ns := pulse; end if;
        when pulse => en <= '1';
        db_ns := not_rdy;
        when others => null;
       end case;
      end if;
      end process;
      
      process(en)
      begin if en='1' and en'event then
      temp1 <= x; temp2 <= temp1; temp3 <= temp2; temp4 <= temp3;
      end if;
      end process;
      
      Z1 <= temp1; Z2 <= temp2; Z3 <= temp3; Z4 <= temp4;
      
end Behavioral;      





