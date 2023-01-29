library ieee;
use ieee.std_logic_1164.all;
entity registro is
	generic ( n: integer :=20);
	port(
		Clk,resetn,en: in std_logic;
		d: in std_logic_vector(n-1 downto 0);
		q: out std_logic_vector(n-1 downto 0));
end registro;
architecture solve of registro is
	begin
	process(resetn,clk)
		begin
			if resetn='0' then
				q<=(others => '0');
			elsif clk'event and clk='1' then
				if en='1' then
					q<=d;
				end if;
			end if;
	end process;
end solve;