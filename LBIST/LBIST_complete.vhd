library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity LBIST_complete is
	generic (DIMENSION     : integer := 32);
	port(
		CLK : IN std_logic;
		RST : IN std_logic;
		GO_NOGO: OUT std_logic;
		DUT_RESET: OUT std_logic;
		LFSR_OUT: OUT std_logic_vector(DIMENSION downto 0);
		DUT_OUT: IN std_logic_vector(DIMENSION-1 downto 0);
		Golden_D: INOUT std_logic_vector(DIMENSION-1 downto 0);
		START : IN std_logic;
		Test_en_i_s: OUT std_logic;
		TEST_NORMAL: IN std_logic
	);

end LBIST_complete;


architecture beh of LBIST_complete is


    component lfsr
        generic (N    : integer := 16);
        port (clk   : in std_logic;
              reset : in std_logic;
              seed  : in std_logic_vector(N-1 downto 0);
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
	end component;

	component MISR is
		generic (NBIT : integer:= 16);
		port(
			CLK : IN std_logic;
			RST : IN std_logic;
			D: IN std_logic_vector(NBIT-1 downto 0);
			Golden_D: INOUT std_logic_vector(NBIT-1 downto 0);
			PASS_Fail : OUT std_logic -- 1 = PASS || 0 = fail
		);
	end component;

	constant CHAINS     : integer := 190;

    signal FINISH : std_logic;
	-- MISR signals
	signal MISR_pass_fail : std_logic;

    -- LFSR signals
    signal lfsr_out_1 : std_logic_vector(DIMENSION downto 0);
    signal seed   	  : std_logic_vector(DIMENSION-1 downto 0);
    signal lfsr_clock : std_logic := '0';
    signal lfsr_reset : std_logic;

begin

    stimuli : lfsr
    generic map (N => DIMENSION)
    port map (clk => CLK,
			  seed => seed,
              reset => lfsr_reset,
              q => lfsr_out_1);

	PS: phase_shifter
	generic map (N => DIMENSION)
	port map ( 
			data_in => lfsr_out_1,
			data_out => LFSR_OUT);

    
	BIST: LBIST 
	generic map (SEED_dimension => DIMENSION, SCAN_CHAIN_number => CHAINS)
	port map(
			CLK => CLK,
			RESET => RST,
			START => START,
			TEST_NORMAL => TEST_NORMAL,
			MISR_Pass_Fail => MISR_pass_fail,
			GO_NOGO => GO_NOGO,
			LFSR_reset => lfsr_reset,
			DUT_reset => DUT_RESET,
			seed => seed,
			FINISH => FINISH,
			TEST_en_i_s => Test_en_i_s
	);
	MISR_map: MISR
	generic map(DIMENSION)
	port map(
			CLK => CLK,
			RST => RST,
			D => DUT_OUT,
			Golden_D => Golden_D,
			PASS_Fail => MISR_pass_fail
	);


end beh;


   
