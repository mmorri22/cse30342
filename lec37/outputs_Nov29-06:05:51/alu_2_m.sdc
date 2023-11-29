# ####################################################################

#  Created by Genus(TM) Synthesis Solution 17.24-s038_1 on Wed Nov 29 06:06:02 EST 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design alu_2

set_load -pin_load 0.035 [get_ports a_is_zero]
set_load -pin_load 0.035 [get_ports {alu_out[7]}]
set_load -pin_load 0.035 [get_ports {alu_out[6]}]
set_load -pin_load 0.035 [get_ports {alu_out[5]}]
set_load -pin_load 0.035 [get_ports {alu_out[4]}]
set_load -pin_load 0.035 [get_ports {alu_out[3]}]
set_load -pin_load 0.035 [get_ports {alu_out[2]}]
set_load -pin_load 0.035 [get_ports {alu_out[1]}]
set_load -pin_load 0.035 [get_ports {alu_out[0]}]
set_clock_gating_check -setup 0.0 
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {opcode[2]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {opcode[1]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {opcode[0]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_a[7]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_a[6]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_a[5]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_a[4]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_a[3]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_a[2]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_a[1]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_a[0]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_b[7]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_b[6]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_b[5]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_b[4]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_b[3]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_b[2]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_b[1]}]
set_driving_cell -lib_cell inv_4x -library muddlib -pin "y" [get_ports {in_b[0]}]
set_wire_load_selection_group "foo" -library "muddlib"
## List of unsupported SDC commands ##
set_fix_multiple_port_nets -all -buffer_constants
