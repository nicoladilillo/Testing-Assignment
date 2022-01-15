#!/bin/bash

cd $( dirname $0)
root_dir=${PWD}
cd - &>/dev/null

cd ${root_dir}/syn/run


dc_shell -f ../bin/syn_LBIST.tcl | tee ../log/syn_LBIST.log
mv command.log ../log
