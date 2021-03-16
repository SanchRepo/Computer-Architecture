----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2018 01:31:24 PM
-- Design Name: 
-- Module Name: reg_v3 - Behavioral
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
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_v3 is
Port ( SW : in std_logic_vector(7 downto 0); 
       z : out std_logic_vector(7 downto 0);
       Disp_en : out std_logic_vector(3 downto 0);
       ck, reset : in std_logic);
end reg_v3;

architecture beh of reg_v3 is
Type my_state is (s0, s1, s2, s3);
Signal n_s : my_state;
Signal CK_div : std_logic;
signal sw_sel : std_logic_vector(0 to 3);
Begin
process(SW_sel)
variable temp : std_logic_vector(1 downto 0);
begin
case sw_sel is
    when "1000" => temp := SW(7 downto 6);
    when "0100" => temp := SW(5 downto 4);
    when "0010" => temp := SW(3 downto 2);
    when "0001" => temp := SW(1 downto 0);
    when others => temp := "00";
   end case;
   case temp is
   when "00" => z <= "00000011";
   when "01" => z <= "10011111";
   when "10" => z <= "00100101";
   when "11" => z <= "00001101";
  when others => null;
 end case;
 end process;
 
 Process(ck_div)
 Begin
 if ck_div'event and ck_div='1' then
 Case n_s is
 When s0 => sw_sel <= "1000"; disp_en <= "0111" ;n_s <= s1;
 When s1 => sw_sel <= "0100"; disp_en <= "1011" ;n_s <= s2;
 When s2 => sw_sel <= "0010"; disp_en <= "1101" ;n_s <= s3;
 When s3 => sw_sel <= "0001"; disp_en <= "1110" ;n_s <= s0;
 End case;
 End if;
 End process;

process(ck)
variable count : integer;
begin
if ck='1' and ck'event then
    if reset = '1' then
        count:= 0;
        ck_div <= '0';
    else
        if count = 99999 then
            ck_div<= not ck_div;
            count :=0;
        else
            count := count+1;
        end if;
    end if;
end if;
end process;
            
        

--process(ck)
--variable count : integer;
--begin
--if ck = '1' and ck'event then
--    if reset = '1' then
--        count := 0;
--        ck_div <= '0';
--    elsif reset = '0' then
--            if count = 99999 then
--                ck_div <= not ck_div;
--                count := 0;
--            else
--                count := count +1;
--            end if;

--    end if;
--end if;
--end process;

end beh;



