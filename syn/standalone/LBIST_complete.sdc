###################################################################

# Created by write_sdc on Sat Jan  8 07:01:31 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_ideal_network [get_ports CLK]
create_clock [get_ports CLK]  -name REF_CLK  -period 2  -waveform {0 1}
