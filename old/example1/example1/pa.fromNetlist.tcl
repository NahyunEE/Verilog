
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name example1 -dir "C:/workspace/verilog/example1/example1/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/workspace/verilog/example1/example1/and_gate.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/workspace/verilog/example1/example1} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "and_gate.ucf" [current_fileset -constrset]
add_files [list {and_gate.ucf}] -fileset [get_property constrset [current_run]]
link_design
