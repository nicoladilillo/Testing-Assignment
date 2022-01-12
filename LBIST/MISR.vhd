library ieee;
use ieee.std_logic_1164.all;
-- The MISR takes as input 4 signals:
-- D is the output of the DUT 
-- Golden_D is the expected output
-- CLK and RST are the 2 signals for the resets of the machine


entity MISR is
	port(
		CLK : IN std_logic;
		RST : IN std_logic;
		EN : IN std_logic;
		D: IN std_logic_vector(15 downto 0);
		Golden_D_out: OUT std_logic_vector(15 downto 0)
	);
end entity;


architecture beh of MISR is

	signal Golden_D: std_logic_vector(15 downto 0);

begin

	Golden_D_out <= Golden_D;

	REG: process (CLK)
		begin
		if(rising_edge(CLK)) then
			if(RST = '0' ) then
				if (EN = '1') then
					Golden_D(0) <= D(0) XOR Golden_D(15);
					Golden_D(1) <= D(1) XOR Golden_D(0) XOR Golden_D(14);	
					Golden_D(2) <= D(2) XOR Golden_D(1) XOR Golden_D(13);	
					Golden_D(3) <= D(3) XOR Golden_D(2) XOR Golden_D(12);	
					Golden_D(4) <= D(4) XOR Golden_D(3) XOR Golden_D(10);	
					Golden_D(5) <= D(5) XOR Golden_D(4) XOR Golden_D(11);	
					Golden_D(6) <= D(6) XOR Golden_D(5) XOR Golden_D(9);	
					Golden_D(7) <= D(7) XOR Golden_D(6) XOR Golden_D(8);	
					Golden_D(8) <= D(8) XOR Golden_D(7) XOR Golden_D(7);	
					Golden_D(9) <= D(9) XOR Golden_D(8) XOR Golden_D(6);	
					Golden_D(10) <= D(10) XOR Golden_D(9) XOR Golden_D(5);	
					Golden_D(11) <= D(11) XOR Golden_D(10) XOR Golden_D(4);	
					Golden_D(12) <= D(12) XOR Golden_D(11) XOR Golden_D(3);	
					Golden_D(13) <= D(13) XOR Golden_D(12) XOR Golden_D(2);	
					Golden_D(14) <= D(14) XOR Golden_D(13) XOR Golden_D(1);	
					Golden_D(15) <= D(15) XOR Golden_D(14) XOR Golden_D(0);
				end if;
			else
				Golden_D <= (others => '0');	
			end if;		
		end if;
	end process;
	
end beh;




