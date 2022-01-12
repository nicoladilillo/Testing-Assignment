
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity phase_shifter is
	generic ( N : integer := 16);
	port (
		data_in: IN std_logic_vector(N DOWNTO 0);
		data_out: OUT std_logic_vector(N DOWNTO 0)
	);	
end phase_shifter;


architecture arch of phase_shifter is

begin

	process(data_in)
	begin
		for i in 0 to N-2 loop
				data_out(i) <= data_in(i) XOR data_in(i+1) XOR data_in(i+2);
		end loop;	
	end process;

	
	-- fixed unused values
	data_out(N-1) <= '1';
	data_out(N-2) <= '1';

end arch;
