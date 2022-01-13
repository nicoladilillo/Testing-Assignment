library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity LBIST_complete is
	generic (
		SEED_dimension   : integer := 25;
		SEED_number	     : integer := 10;
		LOOP_for_SEED    : integer := 200;
		SCAN_CHAIN_number: integer := 204; -- lengh of biggest scan chain
		MISR_size		 : integer := 16;
		MISR_value_gold  : integer := 0;
		SCAN_CHAIN		 : integer := 16; -- number of scan chain
		DIMENSION		 : integer := 24
	);
	port(
		CLK : IN std_logic;
		RST : IN std_logic;
		GO_NOGO: OUT std_logic;
		LFSR_OUT: OUT std_logic_vector(SCAN_CHAIN-1 downto 0);
		DUT_OUT: IN std_logic_vector(SCAN_CHAIN-1 downto 0);
		START : IN std_logic;
		TEST_en_i_s: OUT std_logic;
		TEST_mode: OUT std_logic;
		LBIST_en: OUT std_logic
	);

end LBIST_complete;


architecture beh of LBIST_complete is


    component lfsr
        generic (N    : integer := 16);
        port (clk   : in std_logic;
              reset : in std_logic;
              seed  : in std_logic_vector(N downto 0);
              q     : out std_logic_vector(N downto 0));
    end component;

	component phase_shifter
		generic ( N : integer := 16);
		port (
			data_in: IN std_logic_vector(N DOWNTO 0);
			data_out: OUT std_logic_vector(N DOWNTO 0)
		);	
	end component;

	component LBIST is
		generic (
            SEED_dimension   : integer := 25;
            SEED_number	     : integer := 10;
            LOOP_for_SEED    : integer := 200;
            SCAN_CHAIN_number: integer := 204;
            MISR_size		 : integer := 15;
            MISR_value_gold  : integer := 0
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
	end component;

	component MISR is
		port(
			CLK : IN std_logic;
			RST : IN std_logic;
			EN  : IN std_logic;
			D: IN std_logic_vector(15 downto 0);
			Golden_D_out: OUT std_logic_vector(15 downto 0)
		);
	end component;

	-- MISR signals
	signal Golden_D	 : std_logic_vector(15 downto 0);
	signal misr_reset: std_logic;
	signal misr_en   : std_logic;

    -- LFSR signal
    signal lfsr_out_s : std_logic_vector(DIMENSION downto 0);
    signal seed   	  : std_logic_vector(DIMENSION downto 0);
	signal lfsr_reset : std_logic;	

    -- DUT signals
    signal dut_out_s  : std_logic_vector(DIMENSION downto 0);

begin

    stimuli : lfsr
    generic map (N => DIMENSION)
    port map (clk => CLK,
			  seed => seed,
              reset => lfsr_reset,
              q => lfsr_out_s);

	PS: phase_shifter
	generic map (N => DIMENSION)
	port map ( 
			data_in => lfsr_out_s,
			data_out => dut_out_s);

	LFSR_OUT <= dut_out_s(SCAN_CHAIN-1 downto 0);

	BIST: LBIST
	generic map (
		SEED_dimension    => SEED_dimension,
		SEED_number	      => SEED_number,
		LOOP_for_SEED     => LOOP_for_SEED,
		SCAN_CHAIN_number => SCAN_CHAIN_number,
		MISR_size		  => MISR_size,
		MISR_value_gold   => MISR_value_gold
	)
	port map(
			CLK => CLK,
			RST => RST,
			START => START,
            MISR_value => Golden_D,
            TEST_en_i_s => TEST_en_i_s,
            TEST_mode => TEST_mode,
            LBIST_en => LBIST_en,
            GO_NOGO => GO_NOGO,
            LFSR_reset => lfsr_reset,
            MISR_reset => misr_reset,
			MISR_en    => misr_en,
            seed => seed
	);

	MR: MISR
	port map(
			CLK => CLK,
			RST => RST,
			EN => misr_en,
			D => DUT_OUT,
			Golden_D_out => Golden_D
	);


end beh;
