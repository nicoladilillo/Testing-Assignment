library ieee;
use ieee.std_logic_1164.all;
-- The MISR takes as input 4 signals:
-- D is the output of the DUT 
-- Golden_D is the expected output
-- CLK and RST are the 2 signals for the resets of the machine

entity MISR is
	generic (NBIT : integer:= 16);
	port(
		CLK : IN std_logic;
		RST : IN std_logic;
		D: IN std_logic_vector(NBIT-1 downto 0);
		Golden_D: IN std_logic_vector(NBIT-1 downto 0);
		PASS_Fail : OUT std_logic; -- 1 = PASS || 0 = fail
	);
end entity;


architecture beh of MISR is

signal END_MISR : std_logic := '0';
signal CNT : integer := 0;
signal tmp : std_logic;
begin

	MAIN: process (CLK)
		begin
		if(rising_edge(CLK)) then
			if(RST = '0') then
				CNT := CNT + 1;
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
			else
				END_MISR <= '0';	
				CNT := 0;	
			end if;		
		end if;
	end process;
	
	-- Here we check when the signal has been propagated through all the MISR and when it happens, we set a signal to 1 to start the check if the test passed or not
	-- by doing an OR of all the bits inside our Golden_D generated at the previous stage so we can see if they are all 0 and so there were no variations between the 
	-- Golden_D and the D
	CNT_CHECK: process (CNT)
		begin
			if(CNT = NBIT-1) then
				END_MISR <= '1';
			end if;
		end process;
	FINAL_CHECK: process (END_MISR)
		begin
			if(END_MISR = '1') then
				tmp <= Golden_D(0);
				for i in 1 to NBIT-2 generate
					tmp <= tmp OR Golden_D(i);
				end generate;
				PASS_fail <= not tmp;
				END_MISR <= '0';
			end if;
			
		end process;
end beh;




