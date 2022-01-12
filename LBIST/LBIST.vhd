library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity LBIST is
	generic (
		SEED_dimension : integer := 32;
		SCAN_CHAIN_number: integer := 190
	);
	port(
		CLK: IN std_logic;
		RESET: IN std_logic;
		START: IN std_logic;
		TEST_NORMAL: IN std_logic; -- 1 = test || 0 = normal
		MISR_Pass_Fail: IN std_logic; -- 1 = PASS || 0 = fail
		GO_NOGO: OUT std_logic; -- 1 = GO || 0 = No Go
		LFSR_reset : OUT std_logic;
		DUT_reset : OUT std_logic;
		seed : OUT std_logic_vector(SEED_dimension-1 downto 0);
		FINISH: OUT std_logic;
		TEST_en_i_s: OUT std_logic
	);
end entity;


architecture beh of LBIST is

	type state is (RESET_state, SEED_injection_state, SCAN_Propagation_state, END_SCAN_state, Testing, End_state);
	signal current_state, next_state : state;
	signal CNT_LOOP: integer := 0;
	signal CNT_CLK: integer := 0;
	type seed_array is array (natural range <>) of std_logic_vector(SEED_dimension -1 downto 0);
	signal seed_mem : seed_array(0 to 9);
	signal seed_index : integer range 0 to 9;
	signal START_LOOP: std_logic := '0';
	constant seed_mem_INIT : seed_array(0 to 9) := 
	(	
		"0000010110101000000110001",
		"0000101011010101101011111",
		"1010101010101010101010101",
		"1110011100011000111100001",
		"0101010111111101010101010",
		"0011001110111111110010000",
		"0000001110111111111100001",
		"0001101110111111111000000",
		"0100001110111111110001001",
		"1111110000010110101000000" 
							
	);



begin
-- Load the SEED memory and set the initial value for current_state
seed_mem <= seed_mem_INIT;
--current_state <= RESET_state;
-- This process is used to count the clock cycles and to update the state
CLK_proc: process(CLK)
	begin
		if (rising_edge(CLK)) then
			if(RESET = '1') then
				current_state <= RESET_state;
				CNT_CLK <= 0;
			else
			current_state <= next_state;
			if( START_LOOP = '1' ) then 
				if(current_state = END_SCAN_state) then
					CNT_CLK <= 0;
				else
					CNT_CLK <= CNT_CLK + 1;
				end if;
			end if;
		end if;
	end if;
	end process;


FSM: process (current_state)
	begin
		case current_state is
			when RESET_state => -- In reset all the signals are set to their reset value
				DUT_reset <= '0';
				FINISH <= '0';
				LFSR_reset <= '1';
				seed_index <= 0;
				CNT_LOOP <= 0;
			when SEED_injection_state => --Here we reset the LFSR and inject the new seed
				seed <= seed_mem (seed_index);
				LFSR_reset <= '1';
			when SCAN_propagation_state => -- In this state we start the propagation of the input for 190 clock cycles
				START_LOOP <= '1';
				DUT_reset <= '1';
				LFSR_reset <= '0';
				TEST_en_i_s <= '1';
				CNT_LOOP <= CNT_LOOP + 1;
			when END_SCAN_state => -- Here we take the value from the MISR 
				START_LOOP <= '0'; --We set START_LOOP to 0 in order to stop the count for the loop 
				TEST_en_i_s <= '0'; -- Forse è da modificare aggiungendo questa cosa?
			when Testing => -- Here we check the result of the MISR in case it's a fail, everything is stopped otherwise we increase the seed_index and restart
				if (MISR_Pass_Fail = '0') then
					GO_NOGO <= '0';
				else
					GO_NOGO <= '1';
					seed_index <= seed_index +1;
				end if;
			when END_state =>
				FINISH <= '1';
				end case;
	end process;

State_proc: process(CNT_CLK, CNT_LOOP, current_state, START)
	begin
	case current_state is
		when RESET_state =>
			if (START = '1') then
				next_state <= SEED_injection_state;	-- When we receive the START signal we set the SEED_injection
			end if;
		when SEED_injection_state =>
				next_state <= SCAN_propagation_state; --right after the seed has been injected we start the loop
		when SCAN_propagation_state => -- we stay in this state until all the 190 clock cycles have been executed
			if(CNT_CLK = SCAN_CHAIN_number) then
				next_state <= END_SCAN_state;
			end if;
		when END_SCAN_state => --in case we finished the loop we check the result of the MISR, otherwise we start the loop again
			if(CNT_LOOP = 100) then
				next_state <= Testing;
			else
				next_state <= SCAN_propagation_state;
			end if;
		when Testing => --in case we have a FAIL from the MISR or we finished all our seeds, we exit, otherwise we set another seed and start again
			if(MISR_Pass_Fail = '0') then
				next_state <= END_state;
			elsif (seed_index < 10) then
				next_state <= SEED_injection_state;
			else 
				next_state <= END_state;
			end if;
		when END_state => 
				next_state <= RESET_state;
	end case;
	end process;

end beh;




