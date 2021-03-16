----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2018 08:16:39 PM
-- Design Name: 
-- Module Name: blink - Behavioral
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

entity blink is
Port (b1, b2, ck, reset: in std_logic;
    z: out std_logic );
end blink;

architecture Behavioral of blink is
--type state is (fast, slow);
signal ck1: std_logic;
signal ck2: std_logic;
signal ck_sel: std_logic;
--signal temp: state;




begin
process(ck)
variable count : integer;
variable count2: integer;
begin
if ck'event and ck ='1' then
        if count = 9999999 then
         ck1<= not ck1; count :=0;
        else 
            count := count+1;
        end if;
        
        if count2 = 99999999 then
         ck2<= not ck2; count :=0;
        else 
            count2 := count2+1;
        end if;
    
end if;

end process;

process( b1, b2, reset,ck)
type db_state is (fast,slow);
variable db_ns: db_state;
begin
--if reset ='1' then
--temp<= slow;
--end if;
if ck='1' and ck'event then
    case db_ns is
    when fast => ck_sel <='0';
    if b1 = '1' then db_ns := slow; end if;
    when slow => ck_sel <='1'; 
    if b2 = '1' then db_ns := fast; end if;
    when others => null;
    end case;
    

--case temp is
--    when fast =>
--        ck_sel<='0';
--        if b1='1' then 
--            temp <= slow;
--        end if;
--    when slow =>
--        ck_sel<='1';
--        if b2='1' then
--            temp <= fast;
--        end if; 
--end case;
end if;
end process;

process(ck1,ck2, ck_sel)
begin
if ck_sel ='0' then
 if ck1 = '1' then z <= '1';
 elsif ck1 = '0' then z<= '0';
 end if;
elsif ck_sel ='1' then
   if ck2 = '1' then z <= '1';
    elsif ck2 = '0' then z<= '0';
   end if;
end if;
end process;    

  
end Behavioral;
