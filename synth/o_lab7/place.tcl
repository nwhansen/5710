#######################################################
# Cell Placement Command script (Erik Brunvand, 2013) #
#                                                     #
# This sub-script works with top.tcl and EDI 13 (F13) #
#                                                     #
# This script places the standard cells. Note that    #
# this script places standard cells only, not blocks  #
# or other macros. If you have large macro blocks to  #
# place you should do that by hand. See Chapter 13 in #
# the CAD book for details.                           #
#######################################################

puts "----------Placing Cells-----------"
# Let the tool know we're in a 600nm process
# But, the largest process it cares about is 250nm... 
# Everything larger than 250nm is treated the same. 
setDesignMode -process 250

# Place the standard cells
setPlaceMode -timingDriven true \
             -reorderScan true \
             -congEffort medium \
             -doCongOpt false \
             -modulePlan true

# Only turn the optimizations on if needed (by uncommenting
# the following line). We'll do  more optimization later
#placeDesign -inPlaceOpt -prePlaceOpt
placeDesign
setDrawView place

# Now run the first optimization step - pre-CTS 
# (Clock Tree Synthesis). This is in-place optimization. 
setOptMode -yieldEffort none
setOptMode -effort high
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
clearClockDomains
setOptMode -usefulSkew false

# do the optimization and timing. Save the results in the 
# reports directory. 
optDesign -preCTS -drv \
          -outDir ${BASENAME}_reports/preCTSOptTimingReports
timeDesign -reportOnly -slackReports \
          -outDir ${BASENAME}_reports/preCTSOptTimingReports


# Save the design so far
saveDesign ${BASENAME}_placed.enc
puts "-------------Done Placing Cells-----"

