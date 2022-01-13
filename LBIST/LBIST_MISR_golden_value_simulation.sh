#!/bin/sh

# Move to the run directory
rm -rf run
mkdir -p run
cd run

# Build the files
vlog ../../syn/techlib/NangateOpenCellLibrary.v
vlog ../../syn/output/riscv_core_scan.v
vlog ../lfsr.v
vcom ../phase_shifter.vhd 
vcom ../MISR.vhd
vcom ../BIST_controller.vhd
vcom ../LBIST_complete.vhd 
vcom ../LBIST_part_testbench.vhd 

vsim -c -t ns -novopt work.LBIST_part_testbench -do ../LBIST_testbench_part_script.tcl
