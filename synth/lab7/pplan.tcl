#######################################################
#  Power Planning Command script Erik Brunvand, 2013) #
#                                                     #
# This sub-script works with top.tcl and EDI 13 (F13) #
#                                                     #
# This script builds the vdd and gnd networks based   #
# on the parameters in the calling script (top.tcl).  #
#                                                     #
#######################################################
puts "-------------Power Planning----------------"
puts "-------Making power rings------------------"
#
# set the globalNetConnect parameters for power and ground
globalNetConnect $powernet -type pgpin -pin $powernet -all
globalNetConnect $groundnet -type pgpin -pin $groundnet -all
globalNetConnect $powernet -type tiehi
globalNetConnect $groundnet -type tielo

#
# Make power and ground rings - $pwidth microns wide 
# with $pspace spacing between them and centered in the channel 
setAddRingMode -stacked_via_top_layer metal3
setAddRingMode -stacked_via_bottom_layer metal1
addRing -spacing $pspace \
        -width  $pwidth \
        -offset $pspace \
        -threshold $pspace \
        -jog_distance $pspace \
    -layer {bottom metal1 top metal1 right metal2 left metal2} \
        -center 1 \
        -around core \
        -nets {gnd! vdd! }
 #
puts "------making power stripes-----------------"
#
# Make Power Stripes. This step is optional. If you keep it 
# in remember to check the stripe spacing 
# (set-to-set-distance = $sspace) and stripe offset 
# (xleft-offset = $soffset)) 
setAddStripeMode -stacked_via_top_layer metal3
setAddStripeMode -stacked_via_bottom_layer metal1
addStripe -block_ring_top_layer_limit metal3 \
          -max_same_layer_jog_length 3.0 \
          -snap_wire_center_to_grid Grid \
          -padcore_ring_bottom_layer_limit metal1 \
          -set_to_set_distance $sspace \
          -padcore_ring_top_layer_limit metal3 \
          -spacing $pspace \
          -xleft_offset $soffset \
          -merge_stripes_value 1.5 \
          -layer metal2 \
          -block_ring_bottom_layer_limit metal1 \
          -width $swidth \
          -nets {gnd! vdd! }
#
# Use the special-router to route the vdd! and gnd! nets
sroute -allowJogging 1

# Save the design so far
saveDesign ${BASENAME}_pplan.enc
puts "-------------Power Planning done---------"
