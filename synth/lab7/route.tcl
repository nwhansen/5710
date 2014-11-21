#######################################################
# Signal routing   (Erik Brunvand, 2013)              #
#                                                     #
# This sub-script works with top.tcl and EDI 13 (F13) #
#                                                     #
# This script does the actual wire routing for the    #
# macro.                                              #
#######################################################

puts "-----------Routing-----------"
#

# Unfix the clock nets to avoid routing problems.
changeUseClockNetStatus -noFixedNetWires

# Configure NanoRoute to do the final routing...

# Use multi-cut (stacked) vias if possible
setNanoRouteMode -drouteUseMultiCutViaEffort medium

# range of Tdr (timing driving layout) effort is 0-10
# The higher the number, the more EDI tries to reach the 
# specified timing, but this may lead to congestion problems. 
setNanoRouteMode -routeTdrEffort 9

# Some other nanoroute parameters - derived from the Cadence tutorial
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithSiDriven 0
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false

# print out all the settings in the log file for future reference
# If you want to play with the router settings, it's helpful to 
# know what they are, and what they're currently set to. 
getNanoRouteMode 

# Do the actual routing
#globalDetailRoute
routeDesign -globalDetail

puts "----------Timing design--------------"
# Check timing after routing.
# note that the effort level must be low because we don't have a capTable
setExtractRCMode -engine postRoute
setExtractRCMode -effortLevel low
setAnalysisMode -analysisType onChipVariation
extractRC
timeDesign -postRoute -prefix TimingReports \
    -outDir ${BASENAME}_reports/postroute

puts "---------Post-route optimize---------"
#
# The final optimization step - post-route
setOptMode -yieldEffort none
setOptMode -effort medium
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
clearClockDomains
setOptMode -usefulSkew false

# do the optimization and then print timing again
optDesign -postRoute -drv -prefix TimingReports \
          -outDir ${BASENAME}_reports/postrouteOpt
timeDesign -postRoute -drvReports -slackReports -pathReports \
         -outDir ${BASENAME}_reports/postrouteOpt 


puts "--------Add Filler Cells---------------"
# Add the filler cells
setFillerMode -corePrefix ${BASENAME}_FILL -core ${fillerCells}
addFiller -cell $fillerCells -prefix ${BASENAME}FILL -markFixed


# Save the design so far
saveDesign ${BASENAME}_routed.enc
puts "-----------Routing done-------------"
