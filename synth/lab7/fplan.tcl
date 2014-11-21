#######################################################
#  Floorplan Command script    (Erik Brunvand, 2013)  #
#                                                     #
# This sub-script works with top.tcl and EDI 13 (F13) #
#                                                     #
# This script builds a generic floorplan based on the #
# parameters defined in the calling script (top.tcl). #
#                                                     #
#######################################################

puts "-------------Floorplanning---------------"
#
# Make a floorplan - this works fine for projects that are all 
# standard cells and include no blocks that need hand placement... 
setDrawView fplan
getIoFlowFlag
setFPlanRowSpacingAndType $rowgap 2
setIoFlowFlag 0
floorPlan -flip s -coreMarginsBy die \
    -site core -r $aspect $usepct \
    $coregap $coregap $coregap $coregap 
getIoFlowFlag
fit

#
# Save design so far
saveDesign ${BASENAME}_fplan.enc
saveFPlan  ${BASENAME}.fp
puts "--------------Floorplanning done-----------"

