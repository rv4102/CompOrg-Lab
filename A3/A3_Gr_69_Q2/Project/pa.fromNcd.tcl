
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Assgn3_Grp69_Q2 -dir "C:/Users/Student/Downloads/COA-Lab-Gr69-Assgn-main/COA-Lab-Gr69-Assgn-main/A3/Assgn3_Grp69_Q2/planAhead_run_1" -part xc7a100tcsg324-1
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/Student/Downloads/COA-Lab-Gr69-Assgn-main/COA-Lab-Gr69-Assgn-main/A3/Assgn3_Grp69_Q2/wrapper_RCA_16.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Student/Downloads/COA-Lab-Gr69-Assgn-main/COA-Lab-Gr69-Assgn-main/A3/Assgn3_Grp69_Q2} }
set_property target_constrs_file "timing.ucf" [current_fileset -constrset]
add_files [list {timing.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/Users/Student/Downloads/COA-Lab-Gr69-Assgn-main/COA-Lab-Gr69-Assgn-main/A3/Assgn3_Grp69_Q2/wrapper_RCA_16.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/Student/Downloads/COA-Lab-Gr69-Assgn-main/COA-Lab-Gr69-Assgn-main/A3/Assgn3_Grp69_Q2/wrapper_RCA_16.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/Student/Downloads/COA-Lab-Gr69-Assgn-main/COA-Lab-Gr69-Assgn-main/A3/Assgn3_Grp69_Q2/wrapper_RCA_16.twx\": $eInfo"
}
