library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;


entity LBIST is
	generic (
		SEED_dimension   : integer := 32;
		SEED_number	     : integer := 10;
		LOOP_for_SEED    : integer := 200;
		SCAN_CHAIN_number: integer := 190;
		MISR_size		 : integer := 32;
		MISR_value_gold  : integer := 0
	);
	port(
		CLK: IN std_logic;
		RST: IN std_logic;
		START: IN std_logic;
        MISR_value: IN std_logic_vector(MISR_size-1 DOWNTO 0); -- see MISR FF values
        MISR_enable: OUT std_logic;   -- enable shift inside FF of the MISR
		TEST_en_i_s: OUT std_logic;   -- put riscv processor in 1 = test || 0 = normal
		TEST_mode: OUT std_logic;     -- mux for test point
		MISR_Pass_Fail: IN std_logic; -- 1 = PASS || 0 = fail
		GO_NOGO: OUT std_logic; 	  -- 1 = GO || 0 = No Go
		LFSR_reset : OUT std_logic;
		MISR_reset : OUT std_logic;
		seed: OUT std_logic_vector(SEED_dimension-1 downto 0) -- for lfsr
	);
end entity;


architecture beh of LBIST is

	type state is (
		RESET, 
		SEED_injection_state,
		SCAN_Propagation_state,
		SCAN_normal,
		END_SCAN_state_1, 
		END_SCAN_state_2,
		END_good);
	signal Current_state, Next_state: state := RESET;
	signal Cnt_seed, Cnt_seed_next: unsigned(9 downto 0); -- count seed changed
	signal Cnt_loop, Cnt_loop_next: unsigned(9 downto 0); -- count how many loop for each seed
	signal Seed_index, Seed_index_next: unsigned(9 downto 0); -- count how many loop for each seed
	signal seed_s, seed_next_s: std_logic_vector(SEED_dimension-1 downto 0);
	-- ROM memory for lfsr seed
	type seed_array is array (natural range <>) of std_logic_vector(SEED_dimension-1 downto 0);
	signal seed_mem : seed_array(0 to 9);
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

	-- This process is used to count the clock cycles and to update the state
	CLK_proc: process(CLK)
	begin
		if (rising_edge(CLK)) then
			if (RST = '1') then
				current_state <= RESET;
				Cnt_seed <= (others => '0');
				Cnt_loop <= (others => '0');
				Seed_index <= (others => '0');
				seed_s <= (others => '0');
			else 
				current_state <= Next_state;
				Cnt_seed <= Cnt_seed_next;
				Cnt_loop <= Cnt_loop_next;
				Seed_index <= Seed_index_next;
				seed_s <= seed_next_s;
			end if;
		end if;
	end process;


    seed <= seed_s;

FSM: process (current_state, cnt_loop, Cnt_seed, Seed_index, start, seed_s)
	begin
		LFSR_reset <= '0';
		MISR_reset <= '0';
		TEST_en_i_s <= '0';
		TEST_mode <= '1';
		GO_NOGO <= '0';

		case current_state is
			when RESET => -- In reset all the signals are set to their reset value
				TEST_mode <= '0';
				Cnt_seed_next <= (others => '0');
				Cnt_loop_next <= (others => '0');
				Seed_index_next <= (others => '0');
				seed_next_s <= (others => '0');
				if (start = '1') then
					Next_state <= SEED_injection_state;
				else
					Next_state <= RESET;
				end if;

			-- Here we reset the LFSR and inject the new seed
			when SEED_injection_state =>
			    seed_next_s <= seed_mem (to_integer(seed_index));
				LFSR_reset <= '1';
				MISR_reset <= '1';
				Next_state <= SCAN_propagation_state;

			-- In this state we start the propagation of the input for 190 clock cycles
			when SCAN_propagation_state =>
				TEST_en_i_s <= '1';
				Cnt_loop_next <= Cnt_loop + 1;
				if (Cnt_loop = SCAN_CHAIN_number - 2) then
					Next_state <= SCAN_normal;
				else
					Next_state <= SCAN_propagation_state;
				end if;

			-- in this state we run in normale mode to capture
			when SCAN_normal =>
				Cnt_seed_next <= Cnt_seed + 1;
				if (Cnt_seed = SEED_number - 2) then
					Next_state <= END_SCAN_state_1;
				else
					Next_state <= SEED_injection_state;
				end if;

			-- end the bist, start check the result
			when END_SCAN_state_1 => -- Here we take the value from the MISR
				TEST_mode <= '0';
				GO_NOGO <= '1'; -- first one say as that the procedure is finish

			when END_SCAN_state_2 => -- Here we check the result of the MISR in case it's a fail, everything is stopped otherwise we increase the seed_index and restart
				if (to_integer(unsigned(MISR_value)) = MISR_value_gold) then
					Next_state <= END_good;
				else 
					Next_state <= RESET;
				end if;

			-- if reach this state the bist procedure has prdce no failure
			when END_good =>
			    GO_NOGO <= '1';
				Next_state <= RESET;

			when others =>
				Next_state <= RESET;	
		
		end case;
	end process;

end beh;




