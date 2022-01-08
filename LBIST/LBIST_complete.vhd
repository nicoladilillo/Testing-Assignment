library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity LBIST_complete is
	port(
		CLK : IN std_logic;
		RST : IN std_logic;
		GO_NOGO: OUT std_logic;
		START : IN std_logic;
		TEST_NORMAL: IN std_logic
	);

end LBIST_complete;


architecture beh of LBIST_complete is
    component riscv_core_0_128_1_16_1_1_0_0_0_0_0_0_0_0_0_3_6_15_5_1a110800 
        port (
            boot_addr_i: IN std_logic_vector(31 DOWNTO 0);
            core_id_i: IN std_logic_vector(3 DOWNTO 0);
            cluster_id_i: IN std_logic_vector(5 DOWNTO 0);
            instr_addr_o: OUT std_logic_vector(31 DOWNTO 0);
            instr_rdata_i: IN std_logic_vector(127 DOWNTO 0);
            data_be_o: OUT std_logic_vector(3 DOWNTO 0);
            data_addr_o: OUT std_logic_vector(31 DOWNTO 0);
            data_wdata_o: OUT std_logic_vector(31 DOWNTO 0);
            data_rdata_i: IN std_logic_vector(31 DOWNTO 0);
            apu_master_operands_o: OUT std_logic_vector(95 DOWNTO 0);
            apu_master_op_o: OUT std_logic_vector(5 DOWNTO 0);
            apu_master_type_o: OUT std_logic_vector(1 TO 2);
            apu_master_flags_o: OUT std_logic_vector(14 DOWNTO 0);
            apu_master_result_i: IN std_logic_vector(31 DOWNTO 0);
            apu_master_flags_i: IN std_logic_vector(4 DOWNTO 0);
            irq_id_i: IN std_logic_vector(4 DOWNTO 0);
            irq_id_o: OUT std_logic_vector(4 DOWNTO 0);
            ext_perf_counters_i: IN std_logic_vector(1 to 2);
            clk_i, rst_ni, clock_en_i, test_en_i, fregfile_disable_i, instr_gnt_i,
            instr_rvalid_i, data_gnt_i, data_rvalid_i, apu_master_gnt_i,
            apu_master_valid_i, irq_i, irq_sec_i, debug_req_i, fetch_enable_i,
            test_si1, test_si2, test_si3, test_si4, test_si5, test_si6, test_si7,
            test_si8, test_si9, test_si10, test_si11, test_si12, test_si13,
            test_si14, test_si15, test_si16,test_si17, test_si18, test_si19, test_si20, test_si21, test_si22, test_si23,
            test_si24, test_si25, test_si26, test_si27, test_si28, test_si29,
            test_si30, test_si31, test_si32, test_mode: IN std_logic;
            instr_req_o, data_req_o, data_we_o, apu_master_req_o,
            apu_master_ready_o, irq_ack_o, sec_lvl_o, core_busy_o, test_so1,
            test_so2, test_so3, test_so4, test_so5, test_so6, test_so7, test_so8,
            test_so9, test_so10, test_so11, test_so12, test_so13, test_so14,
            test_so15, test_so16, test_so17, test_so18, test_so19, test_so20, test_so21, test_so22, test_so23,
            test_so24, test_so25, test_so26, test_so27, test_so28, test_so29,
            test_so30, test_so31, test_so32: OUT std_logic);
    end component;

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

	constant DIMENSION     : integer := 32;
	constant CHAINS     : integer := 190;

    signal FINISH : std_logic;
	-- MISR signals
	signal MISR_pass_fail : std_logic;
	signal D, Golden_D : std_logic_vector(DIMENSION-1 downto 0);

    -- LFSR signals
    signal lfsr_out, lfsr_out_1 : std_logic_vector(DIMENSION downto 0);
    signal seed   	  : std_logic_vector(DIMENSION-1 downto 0);
    signal lfsr_clock : std_logic := '0';
    signal lfsr_reset : std_logic;

    -- DUT signals
    signal dut_out    : std_logic_vector(DIMENSION downto 0);
    signal test_en_i_s: std_logic;
    signal test_mode_s: std_logic;
    signal dut_clock  : std_logic := '0';
    signal dut_reset  : std_logic;

    signal boot_addr_i: std_logic_vector(31 DOWNTO 0);
    signal core_id_i: std_logic_vector(3 DOWNTO 0);
    signal cluster_id_i: std_logic_vector(5 DOWNTO 0);
    signal instr_addr_o: std_logic_vector(31 DOWNTO 0);
    signal instr_rdata_i: std_logic_vector(127 DOWNTO 0);
    signal data_be_o: std_logic_vector(3 DOWNTO 0);
    signal data_addr_o: std_logic_vector(31 DOWNTO 0);
    signal data_wdata_o: std_logic_vector(31 DOWNTO 0);
    signal data_rdata_i: std_logic_vector(31 DOWNTO 0);
    signal apu_master_operands_o: std_logic_vector(95 DOWNTO 0);
    signal apu_master_op_o: std_logic_vector(5 DOWNTO 0);
    signal apu_master_type_o: std_logic_vector(1 TO 2);
    signal apu_master_flags_o: std_logic_vector(14 DOWNTO 0);
    signal apu_master_result_i: std_logic_vector(31 DOWNTO 0);
    signal apu_master_flags_i: std_logic_vector(4 DOWNTO 0);
    signal irq_id_i: std_logic_vector(4 DOWNTO 0);
    signal irq_id_o: std_logic_vector(4 DOWNTO 0);
    signal ext_perf_counters_i: std_logic_vector(1 TO 2);
    signal clock_en_i, fregfile_disable_i, instr_gnt_i, instr_rvalid_i, data_gnt_i, data_rvalid_i, apu_master_gnt_i,
            apu_master_valid_i, irq_i, irq_sec_i, debug_req_i, fetch_enable_i:std_logic;
    signal instr_req_o, data_req_o, data_we_o, apu_master_req_o,
            apu_master_ready_o, irq_ack_o, sec_lvl_o, core_busy_o: std_logic;

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
			data_out => lfsr_out);

    dut : riscv_core_0_128_1_16_1_1_0_0_0_0_0_0_0_0_0_3_6_15_5_1a110800
    port map (
            clk_i    => CLK,
            clock_en_i => '1',
            rst_ni    => dut_reset,
            test_en_i => test_en_i_s,
			test_mode => '1',
            test_si1 => lfsr_out(0),
            test_si2 => lfsr_out(1),
            test_si3 => lfsr_out(2),
            test_si4 => lfsr_out(3),
            test_si5 => lfsr_out(4),
            test_si6 => lfsr_out(5),
            test_si7 => lfsr_out(6),
            test_si8 => lfsr_out(7),
            test_si9 => lfsr_out(8),
            test_si10 => lfsr_out(9),
            test_si11 => lfsr_out(10),
            test_si12 => lfsr_out(11),
            test_si13 => lfsr_out(12),
            test_si14 => lfsr_out(13),
            test_si15 => lfsr_out(14),
            test_si16 => lfsr_out(15),
            test_si17 => lfsr_out(16),
            test_si18 => lfsr_out(17),
            test_si19 => lfsr_out(18),
            test_si20 => lfsr_out(19),
            test_si21 => lfsr_out(20),
            test_si22 => lfsr_out(21),
            test_si23 => lfsr_out(22),
            test_si24 => lfsr_out(23),
            test_si25 => lfsr_out(24),
            test_si26 => lfsr_out(25),
            test_si27 => lfsr_out(26),
            test_si28 => lfsr_out(27),
            test_si29 => lfsr_out(28),
            test_si30 => lfsr_out(29),
            test_si31 => lfsr_out(30),
            test_si32 => lfsr_out(31),
            test_so1 => dut_out(0),
            test_so2 => dut_out(1),
            test_so3 => dut_out(2),
            test_so4 => dut_out(3),
            test_so5 => dut_out(4),
            test_so6 => dut_out(5),
            test_so7 => dut_out(6),
			test_so8 => dut_out(7),
            test_so9 => dut_out(8),
            test_so10 => dut_out(9),
            test_so11 => dut_out(10),
            test_so12 => dut_out(11),
            test_so13 => dut_out(12),
            test_so14 => dut_out(13),
            test_so15 => dut_out(14),
            test_so16 => dut_out(15),  
			test_so17 => dut_out(16),
            test_so18 => dut_out(17),
            test_so19 => dut_out(18),
            test_so20 => dut_out(19),
            test_so21 => dut_out(20),
            test_so22 => dut_out(21),
            test_so23 => dut_out(22),
            test_so24 => dut_out(23),
            test_so25 => dut_out(24),
            test_so26 => dut_out(25),
            test_so27 => dut_out(26),
            test_so28 => dut_out(27),
            test_so29 => dut_out(28),
            test_so30 => dut_out(29),
            test_so31 => dut_out(30),
            test_so32 => dut_out(31),
            boot_addr_i => boot_addr_i,
            core_id_i => core_id_i,
            cluster_id_i => cluster_id_i,
            instr_addr_o => instr_addr_o,
            instr_rdata_i => instr_rdata_i,
            data_be_o => data_be_o,
            data_addr_o => data_addr_o,
            data_wdata_o => data_wdata_o,
            data_rdata_i => data_rdata_i,
            apu_master_operands_o => apu_master_operands_o,
            apu_master_op_o => apu_master_op_o,
            apu_master_type_o => apu_master_type_o,
            apu_master_flags_o => apu_master_flags_o,
            apu_master_result_i => apu_master_result_i,
            apu_master_flags_i => apu_master_flags_i,
            irq_id_i => irq_id_i,
            irq_id_o => irq_id_o,
            ext_perf_counters_i => ext_perf_counters_i,
            fregfile_disable_i => fregfile_disable_i,
            instr_gnt_i => instr_gnt_i,
            instr_rvalid_i => instr_rvalid_i,
            data_gnt_i => data_gnt_i,
            data_rvalid_i => data_rvalid_i,
            apu_master_gnt_i => apu_master_gnt_i,
            apu_master_valid_i => apu_master_valid_i, 
            irq_i => irq_i,
            irq_sec_i => irq_sec_i,
            debug_req_i => debug_req_i,
            fetch_enable_i => fetch_enable_i,
            instr_req_o => instr_req_o, 
            data_req_o => data_req_o,
            data_we_o => data_we_o,
            apu_master_req_o => apu_master_req_o,
            apu_master_ready_o => apu_master_ready_o,
            irq_ack_o => irq_ack_o,
            sec_lvl_o => sec_lvl_o,
            core_busy_o => core_busy_o            
    );
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
			DUT_reset => dut_reset,
			seed => seed,
			FINISH => FINISH,
			TEST_en_i_s => test_en_i_s
	);
	MISR_map: MISR
	generic map(DIMENSION)
	port map(
			CLK => CLK,
			RST => RST,
			D => D,
			Golden_D => Golden_D,
			PASS_Fail => MISR_pass_fail
	);


end beh;

