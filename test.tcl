package require ::quartus::project

if {[project_exists test]} {
	project_open -revision test test
} else {
	project_new -revision test test
}

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C5T144C8
set_global_assignment -name TOP_LEVEL_ENTITY test
set_global_assignment -name ORIGINAL_QUARTUS_VERSION "13.0 SP1"
set_global_assignment -name PROJECT_CREATION_TIME_DATE "16:57:01  MARCH 18, 2016"
set_global_assignment -name LAST_QUARTUS_VERSION "13.0 SP1"
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

set_location_assignment PIN_144 -to button
set_location_assignment PIN_3 -to led1
set_location_assignment PIN_7 -to led2
set_location_assignment PIN_9 -to led3
set_location_assignment PIN_17 -to clk

export_assignments
