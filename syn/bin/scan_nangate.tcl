set GATE_PATH			../output
set LOG_PATH			../log

set TECH 			NangateOpenCell
set TOPLEVEL			riscv_core

set search_path [ join "../techlib/ $search_path" ]
set search_path [ join "$GATE_PATH $search_path" ]

source ../bin/$TECH.dc_setup_scan.tcl


read_ddc $TOPLEVEL.ddc
#link
#check_design
compile_ultra -incremental -gate_clock -scan -no_autoungroup


set_dft_clock_gating_pin [get_cells * -hierarchical -filter "@ref_name =~ SNPS_CLOCK_GATE*"] -pin_name TE


report_area
set_dft_configuration -scan_compression enable
set_dft_configuration -testability enable

set test_default_scan_style multiplexed_flip_flop

### Set pins functionality ###
set_dft_signal -view existing_dft -type ScanEnable -active_state 1  -port test_en_i
set_dft_signal -view spec -type ScanEnable -active_state 1 -port test_en_i 
set_dft_signal -view existing_dft -type TestMode -active_state 1 -port test_mode_tp
set_dft_signal -view spec -type TestMode -active_state 1 -port test_mode_tp
set_dft_signal -view existing_dft -type lbistEnable -active_state 1 -port lbist_en
set_dft_signal -view spec -type lbistEnable -active_state 1 -port lbist_en


set_dft_configuration -testability enable

# set_testability_configuration \
#   -control_signal test_mode_tp \
#   -test_point_file ../../point.txt \
#   -only_from_file true 

# set_testability_configuration \
#   -target user \

set_testability_configuration \
  -control_signal test_mode_tp -test_points_per_scan_cell 1
set_testability_configuration -target random_resistant
set_testability_configuration -target x_blocking
set_testability_configuration -target untestable_logic
set_testability_configuration -target core_wrapper -reuse_threshold 100

#set_testability_configuration -target random_resistant -random_pattern_count 1000 -target_test_coverage 95 
#-control_signal test_mode_tp

set_scan_element false NangateOpenCellLibrary/DLH_X1


set_scan_configuration -chain_count 32
set_scan_compression_configuration -chain_count 40
set_testability_configuration -target core_wrapper -clock_signal clk_i -exclude_elements rst_ni, test_en_i


create_test_protocol -infer_asynch -infer_clock
dft_drc
run_test_point_analysis
preview_dft
insert_dft

streaming_dft_planner

change_names -rules verilog -hierarchy

report_scan_path -test_mode all

report_area

write -hierarchy -format verilog -output "${GATE_PATH}/${TOPLEVEL}_scan32.v"
write_sdf -version 3.0 "${GATE_PATH}/${TOPLEVEL}_scan32.sdf"
write_sdc "${GATE_PATH}/${TOPLEVEL}_scan32.sdc"
write_test_protocol -output "${GATE_PATH}/${TOPLEVEL}_scan32.spf" -test_mode Internal_scan
write_test_protocol -output "${GATE_PATH}/${TOPLEVEL}_scancompress32.spf" -test_mode ScanCompression_mode

quit
