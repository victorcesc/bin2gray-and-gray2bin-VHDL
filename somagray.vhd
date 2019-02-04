library ieee;
use ieee.std_logic_1164.all;

Use ieee.numeric_std.all;

entity somagray is

generic (N: natural :=6);



	port (
			x:in std_logic_vector (N-1 downto 0);
			y: out std_logic_vector (N-1 downto 0)
	
	
	);
	
	end entity;
	
	
	
	architecture conversor of somagray is
		signal b1,b2,g : std_logic_vector (N-1 downto 0);
		
	begin
			
	l1:	for i in y'left-1 downto y'right generate
		g(i) <= g(i+1) xor b2(i);
		end generate l1;
		
		
		g(y'left) <= b2(x'left);
		x <= g;
		
	
	 --y(N-1)<=x(N-1);
	l2:
	for i in x'left-1 downto x'right generate
	
		b1(i)<=x(i+1) xor x(i);
		
		--t2<= t1+1;
		
		end generate l2;
		
		b1(x'left)<= x(x'left);
		
		b2 <= std_logic_vector(unsigned(b1)+"1");
		
		
		
	
		
		
		end architecture;