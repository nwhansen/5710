create_library_set -name typical_lib\
   -timing\
    [list Lib6710_08.lib]
create_rc_corner -name typical_rc\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0
create_delay_corner -name typical_corner\
   -library_set typical_lib\
   -rc_corner typical_rc
create_constraint_mode -name typical_constraint\
   -sdc_files\
    [list controller_cts.enc.dat/mmmc/modes/typical_constraint/typical_constraint.sdc]
create_analysis_view -name typical_view -constraint_mode typical_constraint -delay_corner typical_corner
set_analysis_view -setup [list typical_view] -hold [list typical_view]
