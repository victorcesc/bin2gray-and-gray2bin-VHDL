library ieee;
use ieee.std_logic_1164.all;

Use ieee.numeric_std.all;

entity gray2bin is

generic (N: natural :=6);



	port (
			x:inout bit_vector (N-1 downto 0);
			y: in bit_vector (N-1 downto 0)
	
	
	);
	
	end entity;
	
	
	
	architecture conversor of gray2bin is
		signal t : bit_vector (N-1 downto 0);
	
	begin
	
	 --y(N-1)<=x(N-1);
	l1:
	for i in x'left-1 downto x'right generate
	
		t(i)<= t(i+1) xor y(i);
		
		end generate;
		
		t(x'left) <= y(x'left);
		x <= t;
		
		
		end architecture;