library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity ram is 
	generic(n: integer:=20;
	m: integer:=8); 
	port(
		clk,wr: in std_logic; 
		addr : in std_logic_vector(m-1 downto 0); 
		Din : in std_logic_vector(n-1 downto 0);
		Dout : out std_logic_vector(n-1 downto 0)); 
end ram;

architecture solve of ram is
	type ram_type is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0); 
	signal tmp_ram: ram_type; 
	begin
	process(clk,wr)
		begin 
			if (clk'event and clk='1') then 
				if wr='1' then
					tmp_ram(conv_integer(addr)) <= Din; 
				end if; 
			end if; 
	end process; 
	Dout <= tmp_ram(conv_integer(addr));
end solve;