library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Add is
	generic ( n: integer :=8);
	port(
		X,Y: in std_logic_vector(n-1 downto 0);
		S: out std_logic_vector(n downto 0));
end Add;

architecture solve of Add is
	begin
		s<=('0'&x)+('0'&y);
end solve;
