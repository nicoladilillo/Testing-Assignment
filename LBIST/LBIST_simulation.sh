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
vcom ../LBIST_testbench.vhd 

# Invoke QuestaSim shell and run the TCL script
vsim -t ns -c -novopt work.LBIST_testbench -do ../LBIST_testbench_script.tcl  -wlf b06_sim.wlf

cd ..
tmax LBIST_fsim_script.tcl -shell

