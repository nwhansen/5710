#######################################################
# Clock Tree Synthesis   (Erik Brunvand, 2013)        #
#                                                     #
# This sub-script works with top.tcl and EDI 13 (F13) #
#                                                     #
# This script builds the clock tree. It finds the     #
# buffer and inverter cells automatically.            #
#                                                     #
#######################################################

puts "--------Clock Tree Synthesis-------"

# Create the clock tree spec from the $BASENAME.sdc file 
# defined in the $BASENAME.globals file
createClockTreeSpec -bufferlist -file $BASENAME.ctstch 
 
# specify the clock tree from that spec. 
specifyClockTree -file $BASENAME.ctstch 

# set a mode to use a routing guide during CTS.
setCTSMode -routeGuide true

# Set routeClkNet to use Nanoroute during CTS.
setCTSMode -routeClkNet true

# Perform clocktree synthesis
clockDesign -specFile ${BASENAME}.ctstch \
            -outDir ${BASENAME}_clock_reports

# Run the second optimization - post-CTS
setOptMode -yieldEffort none
setOptMode -effort high
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
clearClockDomains
setOptMode -usefulSkew false

# actually do the optimization and timing
optDesign -postCTS -drv \
    -outDir ${BASENAME}_reports/postCTSOpt
timeDesign -reportOnly -slackReports \
    -outDir ${BASENAME}_reports/postCTSOpt

# Save the design so far
saveDesign ${BASENAME}_cts.enc
puts "---------Clock Tree Synthesis done----"

