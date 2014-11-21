#######################################################
# Verify and file output   (Erik Brunvand, 2013)      #
#                                                     #
# This sub-script works with top.tcl and EDI 13 (F13) #
#                                                     #
# This script runs both connectivity and DRC          #
# verification. Then it outputs the .def file which   #
# describes the physical information about the new    #
# placed and routed macro, and the .v file which      #
# is a Verilog version of the macro. Note that because#
# of multiple optimization passes, and clock tree     #
# synthesis, the resulting circuit is NOT the same    #
# as the structural verilog that you started with.    #
#######################################################

puts "----------Verifying and File Output-------------"
#
# Verify the connectivity and geometry
verifyConnectivity -type regular -error 50 -warning 50 \
                   -report ${BASENAME}_Conn_regular.rpt
verifyConnectivity -type special -error 50 -warning 50 \
                   -report ${BASENAME}_Conn_special.rpt
verifyGeometry -allowSameCellViols -noSameNet -noOverlap\
               -report ${BASENAME}_Geom.rpt

puts "----------Output ${BASENAME}.def file------------"
# Export the DEF, v, spef, sdf, lef, and lib files
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.6
defOut -floorplan -netlist -routing $BASENAME.def
saveDesign ${BASENAME}_done.enc -def

puts "----------Output ${BASENAME}_edi.v file---------"
saveNetlist [format "%s_edi.v" $BASENAME]

# generate final timing data
extractRC -outfile $BASENAME.cap
rcOut -spef $BASENAME.spef
write_sdf -ideal_clock_network $BASENAME.sdf

# generate a .lib model of the cell just in case
do_extract_model -blackbox_2d  -view $default_analysis_view ${BASENAME}_edi.lib

# Generate timing model for PrimeTime just in case
writeTimingCon ${BASENAME}_done.pt
report_timing -check_clocks > report_timing.pt

puts "------------Verify and file output done------"



