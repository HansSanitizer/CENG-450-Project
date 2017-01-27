
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Count_Mem_VHDL -dir "C:/Users/jgmann/CENG450/Count_Mem_VHDL/planAhead_run_1" -part xc3s1200efg320-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "count_mem_vhdl_pinout.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ROM_VHDL.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {counter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {count_mem_vhdl.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top count_mem $srcset
add_files [list {count_mem_vhdl_pinout.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s1200efg320-5
