#################################################
#                                               #
#  Encounter Multi-Mode Multi-Corner input file #
#  University of Utah - 6710, F13               #
#  Erik Brunvand                                #
#                                               #
# This defines the timing libraries and RC      #
# extraction data to use. In EDI 11 and above   #
# all runs are specifed as mmmc, even if you're #
# only using one mode and one corner...         #
#                                               #
# Look for terms surrounded by !!...!!          #
# These are the things you will need to change  #
#################################################
#
# set the name of your .lib file (e.g. Lib6710_01.lib)
# You can create multiple library sets if you have multiple libraries
# such as fast, slow, and typ
# If you have multiple .lib files put them in a [list lib1 lib2] structure
#create_library_set -name typical_lib \
#   -timing {UofU_Digital_v1_2.lib}
create_library_set -name typical_lib \
   -timing {Lib6710_08.lib}
# Specify the .sdc timing constraint file to use 
# This file comes from Synopsys synthesis. (e.g. design_struct.sdc)
create_constraint_mode -name typical_constraint \
   -sdc_files {controller_struct.sdc}
#
#################################################################
# Below here you shouldn't have to change, unless you're doing
# something different than the basic EDI run... 
#################################################################
#
# Create an RC_corner that has specific capacatance info. If you have a 
# "capTable," you can  set it here (we don't have one yet for C5N) using: 
#    -cap_table capTable 
# If you do have a capTable, you can do better optimization, including 
# signal integrity optimization. These res and cap values are just defaults. 
# They don't correspond to any particular process. You would have to do some 
# digging to find more exact values for your process... 
create_rc_corner -name typical_rc\
   -preRoute_res {1.0} \
   -preRoute_cap {1.0} \
   -preRoute_clkres {0.0} \
   -preRoute_clkcap {0.0} \
   -postRoute_res {1.0} \
   -postRoute_cap {1.0} \
   -postRoute_xcap {1.0} \
   -postRoute_clkres {0.0} \
   -postRoute_clkcap {0.0}
# Define delay corners and analysis views. You can define multiple 
# corners and views here if you like
create_delay_corner -name typical_corner \
   -library_set {typical_lib} \
   -rc_corner {typical_rc}
create_analysis_view -name typical_view \
   -constraint_mode {typical_constraint} \
   -delay_corner {typical_corner}
# Now define which analysis view to use for setup and for hold. 
# In a fancier mmmc you might want to use different RC corners for
# setup and hold - For example:  a slow/worst for setup and a 
# fast/best for hold might be interesting. 
set_analysis_view -setup {typical_view} -hold {typical_view}

