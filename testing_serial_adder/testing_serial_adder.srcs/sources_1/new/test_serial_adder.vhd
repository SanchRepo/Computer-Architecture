----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2018 08:00:36 PM
-- Design Name: 
-- Module Name: test_serial_adder - Behavioral
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

entity test_serial_adder is
port(a,b,ck,reset,btn0,btn1: in std_logic;
    s: out std_logic_vector(3 downto 0);
    c_out, done: out std_logic);
end test_serial_adder;

architecture Behavioral of test_serial_adder is

component serial_adder
    generic(n : natural :=2);
port(a,b,ck,reset: in std_logic;
s: out std_logic_vector(n-1 downto 0);
c_out, done: out std_logic);
end component;

begin


end Behavioral;
