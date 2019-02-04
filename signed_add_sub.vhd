-------------------------------------------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 USE ieee.numeric_std.all;
 ------------------------------------------------------------------------
 ENTITY signed_add_sub IS
 GENERIC (N: INTEGER := 4); --number of input bits
 PORT (a, b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
 cin: IN STD_LOGIC;
 sum, sub: OUT STD_LOGIC_VECTOR(N DOWNTO 0));
 --sum, sub: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
 --cout_sum, cout_sub: OUT STD_LOGIC);
 END ENTITY;
 ------------------------------------------------------------------------
 ARCHITECTURE signed_add_sub OF signed_add_sub IS
 SIGNAL a_sig, b_sig: SIGNED(N-1 DOWNTO 0);
 SIGNAL sum_sig, sub_sig: SIGNED(N DOWNTO 0);
 BEGIN
 -----convert to signed:--------------
 a_sig <= signed(a);
 b_sig <= signed(b);
 -----add and subtract:---------------
 sum_sig <= (a_sig(N-1) & a_sig) + (b_sig(N-1) & b_sig) + ('0' & cin);
 sub_sig <= (a_sig(N-1) & a_sig) - (b_sig(N-1) & b_sig) + ('0' & cin);
 -----output option #1:---------------
 sum <= std_logic_vector(sum_sig);
 sub <= std_logic_vector(sub_sig);
 -----output option #2:---------------
 --sum <= std_logic_vector(sum_sig(N-1 DOWNTO 0));
 --cout_sum <= std_logic(sum_sig(N));
 --sub <= std_logic_vector(sub_sig(N-1 DOWNTO 0));
 --cout_sub <= std_logic(sub_sig(N));
 END ARCHITECTURE;