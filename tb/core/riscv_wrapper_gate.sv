// Copyright 2018 Robert Balas <balasr@student.ethz.ch>
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

// Wrapper for a RI5CY testbench, containing RI5CY, Memory and stdout peripheral
// Contributor: Robert Balas <balasr@student.ethz.ch>

module riscv_wrapper
    #(parameter INSTR_RDATA_WIDTH = 128,
      parameter RAM_ADDR_WIDTH = 20,
      parameter BOOT_ADDR = 'h80,
      parameter PULP_SECURE = 1)
    (input logic         clk_i,
     input logic         rst_ni,

     input logic         start,
     output logic        go_nogo,

     input logic         fetch_enable_i,
     output logic        tests_passed_o,
     output logic        tests_failed_o,
     output logic [31:0] exit_value_o,
     output logic        exit_valid_o);

    // signals connecting core to memory
    logic                         instr_req;
    logic                         instr_gnt;
    logic                         instr_rvalid;
    logic [31:0]                  instr_addr;
    logic [INSTR_RDATA_WIDTH-1:0] instr_rdata;

    logic                         data_req;
    logic                         data_gnt;
    logic                         data_rvalid;
    logic [31:0]                  data_addr;
    logic                         data_we;
    logic [3:0]                   data_be;
    logic [31:0]                  data_rdata;
    logic [31:0]                  data_wdata;

    // signals to debug unit
    logic                         debug_req_i;

    // irq signals (not used)
    logic                         irq;
    logic [0:4]                   irq_id_in;
    logic                         irq_ack;
    logic [0:4]                   irq_id_out;
    logic                         irq_sec;


    // interrupts (only timer for now)
    assign irq_sec     = '0;

    assign debug_req_i = 1'b0;


    // LBIST signals
    logic                         clk;
    logic                         rst;
    logic [15:0]                  lfsr_out;
    logic [15:0]                  dut_out;
    logic                         test_en_i;
    logic                         test_mode;
    logic                         lbist_en;

    // assignment
    assign dut_out[6] = data_we;
    assign dut_out[7] = irq_id_out[4];
    assign clk = ~clk_i;
    assign rst = ~rst_ni;

    // instantiate the LBIST
    LBIST_complete
      #(
         .SEED_dimension(25),
         .SEED_number(10),
         .LOOP_for_SEED(200),
         .SCAN_CHAIN_number(24),
         .MISR_size(16),
         .MISR_value_gold(0),
         .SCAN_CHAIN(16),
         .DIMENSION(24))
    LBIST_procedure
        (
          .CLK                   (clk                    ),
          .RST                   (rst                    ),
          .GO_NOGI               (go_nogo                ),
          .LFSR_OUT              (lfsr_out               ),
          .DUT_OUT               (dut_out                ),
          .START                 (start                  ),
          .TEST_en_i_s           (test_en_i              ),
          .TEST_mode             (test_mode              ),
          .LBIST_en              (lbist_en               ));

    // instantiate the core
    riscv_core_0_128_1_16_1_1_0_0_0_0_0_0_0_0_0_3_6_15_5_1a110800
    riscv_core_i
        (
         .clk_i                  ( clk_i                 ),
         .rst_ni                 ( rst_ni                ),

         .clock_en_i             ( '1                    ),
         .test_en_i              ( test_en_i             ),
         .lbist_en               ( lbist_en              ),
         .test_mode_tp           ( test_mode             ),

         .test_si1               (lfsr_out[0]            ),
         .test_si2               (lfsr_out[1]            ),
         .test_si3               (lfsr_out[2]            ),
         .test_si4               (lfsr_out[3]            ),
         .test_si5               (lfsr_out[4]            ),
         .test_si6               (lfsr_out[5]            ),
         .test_si7               (lfsr_out[6]            ),
         .test_si8               (lfsr_out[7]            ),
         .test_si9               (lfsr_out[8]            ),
         .test_si10              (lfsr_out[9]            ),
         .test_si11              (lfsr_out[10]           ),
         .test_si12              (lfsr_out[11]           ),
         .test_si13              (lfsr_out[12]           ),
         .test_si14              (lfsr_out[13]           ),
         .test_si15              (lfsr_out[14]           ),
         .test_si16              (lfsr_out[15]           ),

         .test_so1               (dut_out[0]             ),
         .test_so2               (dut_out[1]             ),
         .test_so3               (dut_out[2]             ),
         .test_so4               (dut_out[3]             ),
         .test_so5               (dut_out[4]             ),
         .test_so6               (dut_out[5]             ),
         .test_so9               (dut_out[8]             ),
         .test_so10              (dut_out[9]             ),
         .test_so11              (dut_out[10]            ),
         .test_so12              (dut_out[11]            ),
         .test_so13              (dut_out[12]            ),
         .test_so14              (dut_out[13]            ),
         .test_so15              (dut_out[14]            ),
         .test_so16              (dut_out[15]            ),

         .boot_addr_i            ( BOOT_ADDR             ),
         .core_id_i              ( 4'h0                  ),
         .cluster_id_i           ( 6'h0                  ),

         .instr_addr_o           ( instr_addr            ),
         .instr_req_o            ( instr_req             ),
         .instr_rdata_i          ( instr_rdata           ),
         .instr_gnt_i            ( instr_gnt             ),
         .instr_rvalid_i         ( instr_rvalid          ),

         .data_addr_o            ( data_addr             ),
         .data_wdata_o           ( data_wdata            ),
         .data_we_o              ( data_we               ),
         .data_req_o             ( data_req              ),
         .data_be_o              ( data_be               ),
         .data_rdata_i           ( data_rdata            ),
         .data_gnt_i             ( data_gnt              ),
         .data_rvalid_i          ( data_rvalid           ),

         .apu_master_req_o       (                       ),
         .apu_master_ready_o     (                       ),
         .apu_master_gnt_i       (                       ),
         .apu_master_operands_o  (                       ),
         .apu_master_op_o        (                       ),
         .apu_master_type_o      (                       ),
         .apu_master_flags_o     (                       ),
         .apu_master_valid_i     (                       ),
         .apu_master_result_i    (                       ),
         .apu_master_flags_i     (                       ),

         .irq_i                  ( irq                   ),
         .irq_id_i               ( irq_id_in             ),
         .irq_ack_o              ( irq_ack               ),
         .irq_id_o               ( irq_id_out            ),
         .irq_sec_i              ( irq_sec               ),

         .sec_lvl_o              ( sec_lvl_o             ),

         .debug_req_i            ( debug_req_i           ),

         .fetch_enable_i         ( fetch_enable_i        ),
         .core_busy_o            ( core_busy_o           ),

         .ext_perf_counters_i    (                       ),
         .fregfile_disable_i     ( 1'b0                  ));

    // this handles read to RAM and memory mapped pseudo peripherals
    mm_ram
        #(.RAM_ADDR_WIDTH (RAM_ADDR_WIDTH),
          .INSTR_RDATA_WIDTH (INSTR_RDATA_WIDTH))
    ram_i
        (.clk_i          ( clk_i                          ),
         .rst_ni         ( rst_ni                         ),

         .instr_req_i    ( instr_req                      ),
         .instr_addr_i   ( instr_addr[RAM_ADDR_WIDTH-1:0] ),
         .instr_rdata_o  ( instr_rdata                    ),
         .instr_rvalid_o ( instr_rvalid                   ),
         .instr_gnt_o    ( instr_gnt                      ),

         .data_req_i     ( data_req                       ),
         .data_addr_i    ( data_addr                      ),
         .data_we_i      ( data_we                        ),
         .data_be_i      ( data_be                        ),
         .data_wdata_i   ( data_wdata                     ),
         .data_rdata_o   ( data_rdata                     ),
         .data_rvalid_o  ( data_rvalid                    ),
         .data_gnt_o     ( data_gnt                       ),

         .irq_id_i       ( irq_id_out                     ),
         .irq_ack_i      ( irq_ack                        ),
         .irq_id_o       ( irq_id_in                      ),
         .irq_o          ( irq                            ),

         .pc_core_id_i   ( riscv_core_i.pc_id             ),

         .tests_passed_o ( tests_passed_o                 ),
         .tests_failed_o ( tests_failed_o                 ),
         .exit_valid_o   ( exit_valid_o                   ),
         .exit_value_o   ( exit_value_o                   ));

endmodule // riscv_wrapper
