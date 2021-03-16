# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/szh24/Desktop/Stage 3/stage 3/stage 3.cache/wt} [current_project]
set_property parent.project_path {C:/Users/szh24/Desktop/Stage 3/stage 3/stage 3.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/szh24/Desktop/Stage 3/stage 3/stage 3.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {{C:/Users/szh24/Desktop/Stage 3/stage 3/stage 3.srcs/sources_1/new/reg_v3.vhd}}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/szh24/Desktop/Stage 3/stage 3/basys3_master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/szh24/Desktop/Stage 3/stage 3/basys3_master.xdc}}]


synth_design -top reg_v3 -part xc7a35tcpg236-1


write_checkpoint -force -noxdef reg_v3.dcp

catch { report_utilization -file reg_v3_utilization_synth.rpt -pb reg_v3_utilization_synth.pb }
