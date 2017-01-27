
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name count_mem_sch -dir "C:/Users/jgmann/CENG450/count_mem_sch/planAhead_run_1" -part xc3s1200efg320-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "count_mem.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Memory.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {count_mem.vhf}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top count_mem $srcset
add_files [list {count_mem.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s1200efg320-5
