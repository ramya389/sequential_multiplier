# 1. Suppress DRC errors for missing I/O standards and pin locations
set_msg_config -suppress -id {DRC NSTD-1}
set_msg_config -suppress -id {DRC UCIO-1}

# 2. Allow unconstrained pins (critical for bitstream generation)
set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]

# 3. Generate the bitstream (forcefully)
write_bitstream -force your_design.bit