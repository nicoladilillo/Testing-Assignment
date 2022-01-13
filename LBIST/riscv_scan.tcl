# run this to see the fault coverage of ATPG of riscv

read_netlist ../syn/output/NangateOpenCellLibrary.tlib -library
read_netlist ../syn/output/riscv_core_scan.v
run_build_model riscv_core_0_128_1_16_1_1_0_0_0_0_0_0_0_0_0_3_6_15_5_1a110800

# add pi constraints
add_pi_constraints X -all
remove_pi_constraints clk_i
remove_pi_constraints clock_en_i
remove_pi_constraints rst_ni
remove_pi_constraints test_mode_tp
remove_pi_constraints lbist_en
remove_pi_constraints test_en_i
remove_pi_constraints test_si1
remove_pi_constraints test_si2
remove_pi_constraints test_si3
remove_pi_constraints test_si4
remove_pi_constraints test_si5
remove_pi_constraints test_si6
remove_pi_constraints test_si7
remove_pi_constraints test_si8
remove_pi_constraints test_si9
remove_pi_constraints test_si10
remove_pi_constraints test_si11
remove_pi_constraints test_si12
remove_pi_constraints test_si13
remove_pi_constraints test_si14
remove_pi_constraints test_si15
remove_pi_constraints test_si16

add_po_masks -all
remove_po_masks   test_so1
remove_po_masks   test_so2
remove_po_masks   test_so3
remove_po_masks   test_so4
remove_po_masks   test_so5
remove_po_masks   test_so6
remove_po_masks   data_we_o
remove_po_masks   irq_id_o[4]
remove_po_masks   test_so9
remove_po_masks   test_so10
remove_po_masks   test_so11
remove_po_masks   test_so12
remove_po_masks   test_so13
remove_po_masks   test_so14
remove_po_masks   test_so15
remove_po_masks   test_so16

run_drc ../syn/output/riscv_core_scan.spf

set_faults -model stuck
add_faults -all

set_patterns -internal
run_atpg -auto_compression 

# write_patterns patterns.stil -internal -replace -format stil

quit
