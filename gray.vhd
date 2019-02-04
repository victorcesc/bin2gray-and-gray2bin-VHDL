library ieee;
use ieee.std_logic_1164.all;

Use ieee.numeric_std.all;

entity gray is

generic (N: natural :=6);



	port (
			x:in bit_vector (N-1 downto 0);
			y: out bit_vector (N-1 downto 0)
	
	
	);
	
	end entity;
	
	
	
	architecture conversor of gray is
	
	
	begin
	
	 --y(N-1)<=x(N-1);
	l1:
	for i in x'left-1 downto x'right generate
	
		y(i)<= x(i+1) xor x(i);
		
		end generate;
		
		y(x'left) <= x(x'left);
		
		
		end architecture;