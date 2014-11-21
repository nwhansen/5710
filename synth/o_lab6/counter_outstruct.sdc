###################################################################

# Created by write_sdc on Tue Nov 11 12:17:12 2014

###################################################################
set sdc_version 1.9

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0 [get_ports {value[3]}]
set_load -pin_load 0 [get_ports {value[2]}]
set_load -pin_load 0 [get_ports {value[1]}]
set_load -pin_load 0 [get_ports {value[0]}]
