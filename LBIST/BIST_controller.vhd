library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;


entity LBIST is
	generic (
		SEED_dimension   : integer := 25;
		SEED_number	     : integer := 10;
		LOOP_for_SEED    : integer := 200;
		SCAN_CHAIN_number: integer := 204;
		MISR_size		 : integer := 16;
		MISR_value_gold  : integer := 13984
	);
	port(
		CLK: IN std_logic;
		RST: IN std_logic;
		START: IN std_logic;
        MISR_value: IN std_logic_vector(MISR_size-1 DOWNTO 0); -- see MISR FF values
		TEST_en_i_s: OUT std_logic;   -- put riscv processor in 1 = test || 0 = normal
		TEST_mode: OUT std_logic;     -- mux for test point
		LBIST_en: OUT std_logic;      -- another mux for test point
		GO_NOGO: OUT std_logic; 	  -- 1 = GO || 0 = No Go
		LFSR_reset : OUT std_logic;
		MISR_reset : OUT std_logic;
		MISR_en	   : OUT std_logic;
		seed: OUT std_logic_vector(SEED_dimension-1 downto 0) -- for lfsr
	);
end entity;


architecture beh of LBIST is

	type state is (
		RESET, 
		SEED_injection_state,
		SCAN_propagation_start_state_0,
		SCAN_propagation_start_state,
		SCAN_Propagation_state_0,
		SCAN_Propagation_state,
		SCAN_normal,
		END_SCAN_state_0,
		END_SCAN_state_1, 
		END_SCAN_state_2,
		END_good);
	signal Current_state, Next_state: state := RESET;
	signal Cnt_seed, Cnt_seed_next: unsigned(9 downto 0); -- count seed changed
	signal Cnt_loop, Cnt_loop_next: unsigned(9 downto 0); -- count how many loop for each seed
	signal Cnt_loop_for_seed, Cnt_loop_for_seed_next: unsigned(9 downto 0); -- count how many loop for each seed
	signal seed_s, seed_next_s: std_logic_vector(SEED_dimension-1 downto 0);
	-- ROM memory for lfsr seed
	type seed_array is array (00 to SEED_number-1) of std_logic_vector(SEED_dimension-1 downto 0);
	constant seed_mem: seed_array :=	(	
		"0000010110101011000110001",
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
				Cnt_loop_for_seed <= (others => '0');
				seed_s <= seed_mem(0);
			else 
				current_state <= Next_state;
				Cnt_seed <= Cnt_seed_next;
				Cnt_loop <= Cnt_loop_next;
				Cnt_loop_for_seed <= Cnt_loop_for_seed_next;
				seed_s <= seed_next_s;
			end if;
		end if;
	end process;


    seed <= seed_s;

FSM: process (current_state, cnt_loop, Cnt_seed, Cnt_loop_for_seed, start, seed_s)
	begin
		LFSR_reset <= '0';
		MISR_reset <= '0';
		MISR_en <= '0';
		TEST_en_i_s <= '1';
		TEST_mode <= '1';
		lbist_en <= '1';
		GO_NOGO <= '0';

		case current_state is
			when RESET => -- In reset all the signals are set to their reset value
				TEST_en_i_s <= '0';
				TEST_mode <= '0';
				lbist_en <= '0';
				MISR_en <= '0';
				Cnt_seed_next <= (0 => '1', others => '0');
				seed_next_s <= seed_mem(0);
				Cnt_loop_for_seed_next <= (others => '0');
				Cnt_loop_next <= (others => '0');
				MISR_reset <= '1';
				LFSR_reset <= '1';
				if (start = '1') then
					Next_state <= SCAN_propagation_start_state_0;
				else
					Next_state <= RESET;
				end if;
			when SCAN_propagation_start_state_0 =>
				LFSR_reset <= '1';
				Next_state <= SCAN_propagation_start_state;

			-- first propagation, misr is not activated
			when SCAN_propagation_start_state =>
				Cnt_loop_next <= Cnt_loop + 1;
				if (Cnt_loop = SCAN_CHAIN_number - 1) then
					Next_state <= SCAN_normal;
				else
					Next_state <= SCAN_propagation_start_state;
				end if;

			-- Here we reset the LFSR and inject the new seed
			when SEED_injection_state =>
			    seed_next_s <= seed_mem(to_integer(cnt_seed));
				LFSR_reset <= '1';
				Cnt_seed_next <= Cnt_seed + 1;
				Cnt_loop_for_seed_next <= (others => '0');
				Cnt_loop_next <= (others => '0');
				-- check if seeds are finished
				if (Cnt_seed = SEED_number - 1) then
					Next_state <= END_SCAN_state_0;
				else
					Next_state <= SCAN_Propagation_state_0;
				end if;

			when SCAN_Propagation_state_0 =>
				LFSR_reset <= '1';
				Next_state <= SCAN_propagation_state;

			-- In this state we start the propagation of the input for 204 clock cycles (the length of biggest scan chain)
			-- and, at the same time, we flush the chain to gather the prevuious captured values, only after first load
			when SCAN_propagation_state =>
				MISR_en <= '1';
				Cnt_loop_next <= Cnt_loop + 1;
				if (Cnt_loop = SCAN_CHAIN_number - 1) then
					Next_state <= SCAN_normal;
				else
					Next_state <= SCAN_propagation_state;
				end if;

			-- in this state we run in normale mode to capture new value
			when SCAN_normal =>
				-- check if continuos with same seed or change it
				TEST_en_i_s <= '0';
				Cnt_loop_for_seed_next <= Cnt_loop_for_seed + 1;
				Cnt_loop_next <= (others => '0');
				if (Cnt_loop_for_seed = LOOP_for_SEED - 2) then
					Next_state <= SEED_injection_state;
				else
					Next_state <= SCAN_propagation_state;
				end if;

			-- end the bist, start check the result
			when END_SCAN_state_0 => -- Contiunuos to load the MISR with previous valuee loaded in scan chains
				MISR_en <= '1';
				Cnt_loop_next <= Cnt_loop + 1;
				if (Cnt_loop = SCAN_CHAIN_number - 2) then
					Next_state <= END_SCAN_state_1;
				else
					Next_state <= END_SCAN_state_0;
				end if;

			-- end the bist, start check the result
			when END_SCAN_state_1 => -- Here we take the value from the MISR
				TEST_mode <= '0';
				GO_NOGO <= '1'; -- first one say as that the procedure is finish
				Next_state <= END_SCAN_state_2;

			-- Here we check the result of the MISR in case it's a fail, everything is stopped otherwise we increase the seed_index and restart
			when END_SCAN_state_2 => 
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




