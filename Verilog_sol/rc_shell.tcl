# rc -files rc_shell.tcl
if ![info exists env(RCHOME)] {puts "PLEASE SET \"RCHOME\" VARIABLE!"; exit 1}
set mod rcvr
set_attribute library $env(RCHOME)/share/synth/tutorials/tech/tutorial.lbr
read_hdl $mod.v -v2001
elaborate
check_design
define_clock -period 67000 -name 15MHz [find -port clock]
external_delay -clock 15MHz -input  27000 -name delay_in  [all_inputs]
external_delay -clock 15MHz -output 40000 -name delay_out [all_outputs]
synthesize -to_mapped
write_hdl > $mod.vg
exit
