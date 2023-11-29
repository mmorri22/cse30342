vpx set dofile abort exit
vpx set screen display -noprogress
tclmode

# Generated by Genus(TM) Synthesis Solution 17.24-s038_1, revision 1.275d
# Generated on: Wed Nov 29 06:05:59 EST 2023 (Wed Nov 29 11:05:59 GMT 2023)

set lec_version [regsub {(-).} $env(LEC_VERSION) ""]

tcl_set_command_name_echo on

set_log_file logs_Nov29-06:05:51/rtl2intermediate.lec.log -replace

usage -auto -elapse

set_verification_information rtl_fv_map_db

read_implementation_information fv/alu_2 -revised fv_map

set_parallel_option -threads 4 -license "xl lp gxl lpgxl eco ecogxl" -norelease_license

set env(RC_VERSION)     "17.24-s038_1"
set env(CDN_SYNTH_ROOT) "/escnfs/home/csesoft/cadence/installs/GENUS172/tools.lnx86"
set CDN_SYNTH_ROOT      "/escnfs/home/csesoft/cadence/installs/GENUS172/tools.lnx86"
set env(CW_DIR) "/escnfs/home/csesoft/cadence/installs/GENUS172/tools.lnx86/lib/chipware"
set CW_DIR      "/escnfs/home/csesoft/cadence/installs/GENUS172/tools.lnx86/lib/chipware"

# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both

add_search_path . -library -both
read_library -liberty -both   /escnfs/home/mmorri22/f23-cse30342-test/VLSI/muddlib.lib

set_undriven_signal Z -golden
set_naming_style rc -golden
set_naming_rule "%s\[%d\]" -instance_array -golden
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable -golden

# Align LEC's treatment of mismatched port widths with constant
# connections with Genus's. Genus message CDFG-467 and LEC message
# HRC3.6 may indicate the presence of this issue. This option is
# only available with LEC 17.20-d301 or later.
set lec_version_required "17.20301"
if {$lec_version >= $lec_version_required} {
    set_hdl_options -const_port_extend
}
set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"

add_search_path . -design -golden
read_design -enumconstraint  -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -sv09 Verilog/alu_2.sv
elaborate_design -golden -root {alu_2} -rootonly -rootonly  

read_design -verilog95   -revised -lastmod -noelab fv/alu_2/fv_map.v.gz
elaborate_design -revised -root {alu_2}

uniquify -all -nolib -golden

report_design_data
report_black_box

set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
set_flatten_model -hier_seq_merge

set_analyze_option -auto

write_hier_compare_dofile hier_tmp2.lec.do -noexact_pin_match -constraint -usage -replace -balanced_extraction -input_output_pin_equivalence -prepend_string " analyze_datapath -module -verbose ; analyze_datapath   -verbose; "
run_hier_compare hier_tmp2.lec.do -dynamic_hierarchy

report_verification -hier -verbose
set_system_mode lec
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
}

write_verification_information
report_verification_information

tclmode
puts "No of compare points = [get_compare_points -count]"
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
puts "No of abort points   = [get_compare_points -abort -count]"
puts "No of unknown points = [get_compare_points -unknown -count]"
if {[get_compare_points -count] == 0} {
    puts "---------------------------------"
    puts "ERROR: No compare points detected"
    puts "---------------------------------"
}
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
}
if {[get_compare_points -abort -count] > 0} {
    puts "-----------------------------"
    puts "ERROR: Abort Points detected "
    puts "-----------------------------"
}
if {[get_compare_points -unknown -count] > 0} {
    puts "----------------------------------"
    puts "ERROR: Unknown Key Points detected"
    puts "----------------------------------"
}
vpxmode
exit -f
