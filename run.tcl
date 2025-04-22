# Set project variables
set sequential_multiplier_module top
set part xc7a35ticsg324-1L
set bitstream_name output.bit

# Run complete flow
synth_design -top $top_module -part $part
opt_design
place_design
route_design
write_bitstream -force $bitstream_name

# Open implemented design
open_run impl_1