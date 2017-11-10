
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name assignment_3 -dir "/home/rajp/Projects/CS_3710/assignment_3/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/rajp/Projects/CS_3710/assignment_3/CPU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/rajp/Projects/CS_3710/assignment_3} {ipcore_dir} }
add_files [list {ipcore_dir/VGARAM.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "Nexys3_Master.ucf" [current_fileset -constrset]
add_files [list {Nexys3_Master.ucf}] -fileset [get_property constrset [current_run]]
link_design
