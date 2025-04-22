# Relaxed clock constraint (adjust based on your FPGA speed grade)
create_clock -period 15.000 -name clk -waveform {0.000 7.500} [get_ports clk]

# Critical path optimization settings

# Enable aggressive optimization

# Pipeline register constraints

set_property BITSTREAM.GENERAL.UNCONSTRAINEDPINS Allow [current_design]
