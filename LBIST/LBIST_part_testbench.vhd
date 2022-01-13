library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity LBIST_part_testbench is
end LBIST_part_testbench;


architecture tb of LBIST_part_testbench is

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
		MISR_size		 : integer := 16;
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
            test_si14, test_si15, test_si16, test_mode_tp, lbist_en: IN std_logic;
            instr_req_o, data_req_o, data_we_o, apu_master_req_o,
            apu_master_ready_o, irq_ack_o, sec_lvl_o, core_busy_o, test_so1,
            test_so2, test_so3, test_so4, test_so5, test_so6, test_so9,
            test_so10, test_so11, test_so12, test_so13, test_so14,
            test_so15, test_so16: OUT std_logic);
    end component;

    -- constant
    constant SEED_dimension   : integer := 25;
    constant SEED_number	     : integer := 10;
    constant LOOP_for_SEED    : integer := 200;
    constant SCAN_CHAIN_number: integer := 204; -- lengh of biggest scan chain
    constant MISR_size		 : integer := 16;
    constant MISR_value_gold  : integer := 0;
    constant SCAN_CHAIN		 : integer := 16; -- number of scan chain
    constant DIMENSION		 : integer := 24;
    constant clock_t      	: time 	 := 20 ns;

    -- testbench signals
	signal clk, rst, rst_i  : std_logic;

	-- MISR signals
	signal Golden_D	 : std_logic_vector(15 downto 0);
    signal dut_out_s  : std_logic_vector(DIMENSION downto 0);
	signal misr_reset: std_logic;
	signal misr_en   : std_logic;

    -- LFSR signal
    signal lfsr_out_s, lfsr_out_0_s : std_logic_vector(DIMENSION downto 0);
    signal seed   	  : std_logic_vector(DIMENSION downto 0);
	signal lfsr_reset : std_logic;	

    -- BIST controller signals
    signal start_s   : std_logic;
    signal test_en_i : std_logic;
    signal test_mode : std_logic;
    signal lbist_en  : std_logic;
    signal go_nogo   : std_logic;

    -- DUT signals
    signal boot_addr_i: std_logic_vector(31 DOWNTO 0) := (others => '0');
    signal core_id_i: std_logic_vector(3 DOWNTO 0) := (others => '0');
    signal cluster_id_i: std_logic_vector(5 DOWNTO 0) := (others => '0');
    signal instr_addr_o: std_logic_vector(31 DOWNTO 0) := (others => '0');
    signal instr_rdata_i: std_logic_vector(127 DOWNTO 0) := (others => '0');
    signal data_be_o: std_logic_vector(3 DOWNTO 0) := (others => '0');
    signal data_addr_o: std_logic_vector(31 DOWNTO 0) := (others => '0');
    signal data_wdata_o: std_logic_vector(31 DOWNTO 0) := (others => '0');
    signal data_rdata_i: std_logic_vector(31 DOWNTO 0) := (others => '0');
    signal apu_master_operands_o: std_logic_vector(95 DOWNTO 0) := (others => '0');
    signal apu_master_op_o: std_logic_vector(5 DOWNTO 0) := (others => '0');
    signal apu_master_type_o: std_logic_vector(1 TO 2) := (others => '0');
    signal apu_master_flags_o: std_logic_vector(14 DOWNTO 0) := (others => '0');
    signal apu_master_result_i: std_logic_vector(31 DOWNTO 0) := (others => '0');
    signal apu_master_flags_i: std_logic_vector(4 DOWNTO 0) := (others => '0');
    signal irq_id_i: std_logic_vector(4 DOWNTO 0) := (others => '0');
    signal irq_id_o: std_logic_vector(4 DOWNTO 0) := (others => '0');
    signal ext_perf_counters_i: std_logic_vector(1 TO 2) := (others => '0');
    signal clock_en_i, fregfile_disable_i, instr_gnt_i, instr_rvalid_i, data_gnt_i, data_rvalid_i, apu_master_gnt_i,
            apu_master_valid_i, irq_i, irq_sec_i, debug_req_i, fetch_enable_i:std_logic := '0';
    signal instr_req_o, data_req_o, data_we_o, apu_master_req_o,
            apu_master_ready_o, irq_ack_o, sec_lvl_o, core_busy_o: std_logic := '0';

begin

    stimuli : lfsr
    generic map (N => DIMENSION)
    port map (clk => CLK,
			  seed => seed,
              reset => lfsr_reset,
              q => lfsr_out_0_s);

	PS: phase_shifter
	generic map (N => DIMENSION)
	port map ( 
			data_in => lfsr_out_0_s,
			data_out => lfsr_out_s);

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
			START => start_s,
            MISR_value => Golden_D,
            TEST_en_i_s => TEST_en_i,
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
			D => dut_out_s(SCAN_CHAIN-1 DOWNTO 0),
			Golden_D_out => Golden_D
	);

    dut : riscv_core_0_128_1_16_1_1_0_0_0_0_0_0_0_0_0_3_6_15_5_1a110800
    port map (
            clk_i    => clk,
            clock_en_i => '0',
            rst_ni    => rst_i,
            test_en_i => test_en_i,
	        test_mode_tp => test_mode,
            lbist_en => lbist_en,
            test_si1 => lfsr_out_s(0),
            test_si2 => lfsr_out_s(1),
            test_si3 => lfsr_out_s(2),
            test_si4 => lfsr_out_s(3),
            test_si5 => lfsr_out_s(4),
            test_si6 => lfsr_out_s(5),
            test_si7 => lfsr_out_s(6),
            test_si8 => lfsr_out_s(7),
            test_si9 => lfsr_out_s(8),
            test_si10 => lfsr_out_s(9),
            test_si11 => lfsr_out_s(10),
            test_si12 => lfsr_out_s(11),
            test_si13 => lfsr_out_s(12),
            test_si14 => lfsr_out_s(13),
            test_si15 => lfsr_out_s(14),
            test_si16 => lfsr_out_s(15),
            test_so1 => dut_out_s(0),
            test_so2 => dut_out_s(1),
            test_so3 => dut_out_s(2),
            test_so4 => dut_out_s(3),
            test_so5 => dut_out_s(4),
            test_so6 => dut_out_s(5),
            test_so9 => dut_out_s(8),
            test_so10 => dut_out_s(9),
            test_so11 => dut_out_s(10),
            test_so12 => dut_out_s(11),
            test_so13 => dut_out_s(12),
            test_so14 => dut_out_s(13),
            test_so15 => dut_out_s(14),
            test_so16 => dut_out_s(15),
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

	dut_out_s(6) <= data_we_o;
	dut_out_s(7) <= irq_id_o(4);

	clock_generation : process
	begin
		loop
			clk <= '1';
			wait for clock_t/2;
			clk <= '0'; 
			wait for clock_t/2;
		end loop;
	end process;

	vector_process: process
	begin
		rst_i <= '0'; rst <= '1'; start_s <= '1';
		wait for clock_t*3;		
		rst_i <= '1'; rst <= '0'; start_s <= '0';
		wait;			
	end process;

    MISR_golden_value_detector: process(go_nogo)
        file res_fp : text open WRITE_MODE is "./golden_value.txt";
        variable line_out : line;    
    begin
        if (go_nogo = '1') then
            hwrite(line_out, Golden_D);
            writeline(res_fp, line_out);
        end if;
    end process;

end tb;
