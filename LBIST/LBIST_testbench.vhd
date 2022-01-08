
library std;
use std.env.all;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity LBIST_testbench is
end LBIST_testbench;


architecture tb of LBIST_testbench is
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
            test_si14, test_si15, test_si16, test_mode: IN std_logic;
            instr_req_o, data_req_o, data_we_o, apu_master_req_o,
            apu_master_ready_o, irq_ack_o, sec_lvl_o, core_busy_o, test_so1,
            test_so2, test_so3, test_so4, test_so5, test_so6, test_so7, test_so8,
            test_so9, test_so10, test_so11, test_so12, test_so13, test_so14,
            test_so15, test_so16: OUT std_logic);
    end component;

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

	constant clock_t1      : time 	 := 20 ns;
	constant DIMENSION     : integer := 24;

	signal tester_clock : std_logic := '0';

    
    -- LFSR signal
    signal lfsr_out, lfsr_out_1 : std_logic_vector(DIMENSION downto 0);
    signal seed   	  : std_logic_vector(DIMENSION downto 0);
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
    port map (clk => lfsr_clock,
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
            clk_i    => lfsr_clock,
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

-- ***** CLOCK/RESET ***********************************

	clock_generation : process
	begin
		loop
			tester_clock <= '1';
			wait for clock_t1;
			tester_clock <= '0'; 
			wait for clock_t1;
		end loop;
	end process;

	FSM: process
	begin
		dut_reset <= '0'; lfsr_reset <= '1'; 
		
		seed <= "0000000000000000000000001";
		wait for 3/2*clock_t1;
		dut_reset <= '1'; lfsr_reset <= '0';
		for i in 1 to 200 loop
			test_en_i_s <= '1';
			wait for clock_t1*190;
			test_en_i_s <= '0';
			wait for clock_t1;
		end loop;

		seed <= "0000000000111111111111111";
		lfsr_reset <= '1';
		wait for clock_t1;
		lfsr_reset <= '0';
		for i in 1 to 200 loop
			test_en_i_s <= '1';
			wait for clock_t1*190;
			test_en_i_s <= '0';
			wait for clock_t1;
		end loop;

		seed <= "1010101010101010101010101";
		lfsr_reset <= '1';
		wait for clock_t1;
		lfsr_reset <= '0';
		for i in 1 to 200 loop
			test_en_i_s <= '1';
			wait for clock_t1*190;
			test_en_i_s <= '0';
			wait for clock_t1;
		end loop;

		seed <= "1111111111110000000000000";
		lfsr_reset <= '1';
		wait for clock_t1;
		lfsr_reset <= '0';
		for i in 1 to 200 loop
			test_en_i_s <= '1';
			wait for clock_t1*190;
			test_en_i_s <= '0';
			wait for clock_t1;
		end loop;
		
		seed <= "0101010101010101010101010";
		lfsr_reset <= '1';
		wait for clock_t1;
		lfsr_reset <= '0';
		for i in 1 to 200 loop
			test_en_i_s <= '1';
			wait for clock_t1*190;
			test_en_i_s <= '0';
			wait for clock_t1;
		end loop;

		wait;
	end process;

-- dut  ___/----\____ ___/----\____ ___/----\____ ___
-- lfsr /----\____ ___/----\____ ___/----\____ ___/--

    dut_clock <= tester_clock;
    lfsr_clock <= tester_clock;


end tb;

--configuration cfg_LBIST_testbench of LBIST_testbench is
--    for tb
--    end for;
--end cfg_LBIST_testbench;
