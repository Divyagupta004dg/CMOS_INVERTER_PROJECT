# Auto layout: CMOS inverter in Magic
# Save this file as: inverter_layout.tcl

load inverter.mag
box 0 0 50 50
erase

# NWELL region for PMOS
box 0 0 50 30
paint nwell

# P-active (PMOS diffusion)
box 10 5 40 10
paint pactive

# N-active (NMOS diffusion)
box 10 35 40 40
paint nactive

# POLY gate (shared)
box 24 0 26 50
paint poly

# POLY contact
box 24 46 26 50
paint polycontact
paint metal1

# PMOS left contact (VDD)
box 12 5 16 10
paint contact
paint metal1

# NMOS right contact (GND)
box 34 35 38 40
paint contact
paint metal1

# Drain output contact (center)
box 24 20 28 30
paint contact
paint metal1

# METAL1 VDD rail
box 0 0 50 2
paint metal1

# METAL1 GND rail
box 0 48 50 50
paint metal1

# Add labels
box 12 0 16 2
label vdd metal1

box 34 48 38 50
label gnd metal1

box 24 0 26 50
label in poly

box 24 20 28 30
label out metal1

# Save layout
save inverter.mag

puts "✅ Layout complete! You can now run 'extract all' and 'ext2spice'"
