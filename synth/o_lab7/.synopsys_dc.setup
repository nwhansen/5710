#
# Written by : DC-Transcript, Version Y-2006.06 -- May 25, 2006
# Date       : Tue Sep  5 10:49:22 2006
#

#
# Translation of script: synopsys_dc.setup
#

#/* -*- c -*- */
#/**************************************************************************/
#/* Defaults can be found in $SYNOPSYS/admin/setup/.synopsys_dc.setup */
#/**************************************************************************/
set company {University of Utah}
set designer {Erik Brunvand}
#/**************************************************************************/
set plot_command {lpr -Pcsps}
set text_print_command {lpr -Pcsps}
set text_editor_command {emacs %s &}
set command_log_file "./synopsys-dc_shell.log"
set view_command_log_file "./synopsys-dc_shell-view.log"
set find_converts_name_lists "false"
#/**************************************************************************/

set SynopsysInstall [getenv "SYNOPSYS"]

# You can add to this search path if you have your libraries
# stored somewhere else... 
set search_path [list . \
 [format "%s%s"  $SynopsysInstall /libraries/syn] \
 [format "%s%s"  $SynopsysInstall /dw/sim_ver] \
/uusoc/facility/cad_common/local/Cadence/lib/OA/UofU_Example]

#/* ================================================= */
#/* Define a work library in the current project dir  */
#/* to hold temporary files and keep the project area */
#/* uncluttered. Note: You must create a subdirectory */ 
#/* in your project directory called WORK.            */
#/* ================================================= */
define_design_lib WORK -path ./WORK

#/* ================================================= */
#/* General configuration settings.                   */
#/* ================================================= */

set hdlin_check_no_latch true
set compile_fix_multiple_port_nets true

set hdlin_translate_off_skip_text true
set edifin_lib_logic_1_symbol "VCC"
set edifin_lib_logic_0_symbol "GND"
set edifout_ground_name "GND"
set edifout_ground_pin_name "G"
set edifout_power_name "VCC"
set edifout_power_pin_name "P"
set edifout_netlist_only "true"
set edifout_no_array "true"
set edifout_power_and_ground_representation "cell"
set edifout_write_properties_list [list "DUTY_CYCLE_CORRECTION" "INIT_00" "INIT_01" "INIT_02" "INIT_03" "INIT_04" "INIT_05" "INIT_06" "INIT_07" "INIT_08" "INIT_09" "INIT_0A" "INIT_0B" "INIT_0C" "INIT_0D" "INIT_0E" "INIT_0F" "INIT" "CLKDV_DIVIDE" "IOB" "EQN" "lut_function" "instance_number" "pad_location" "part"]

set verilogout_write_components true
set verilogout_architecture_name "structural"
set verilogout_no_tri true

set hdlin_translate_off_skip_text true

set vhdlout_use_packages [list IEEE.std_logic_1164.ALL]
set vhdlout_write_components true
set vhdlout_architecture_name "structural"
set hdlin_translate_off_skip_text true
set bus_naming_style {%s[%d]}
# set bus_dimension_separator_style  "_" 

#/***************************************************
# *
# * Here you can describe default libraries
# *
# * Typcally you will define the target library (the main 
# * cell library) in your scripts. You can set it here
# * if you want to. I'll set it to the class default
# * of 6710Lib.db but you can change that if you have
# * a different library name you want to use
# *
# * the synthetic library points to the DesignWare
# * libraries which have a lot of Synopsys higher
# * level circuit knowledge
# *
# *************************************************/
set target_library [list UofU_Example.db]
set synthetic_library [list dw_foundation.sldb]
set synlib_wait_for_design_license [list "DesignWare-Foundation"]
set link_library [concat  [concat  "*" $target_library] $synthetic_library]
set symbol_library [list generic.sdb]

