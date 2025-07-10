# CMOS Inverter Design using Sky130 PDK 

This project demonstrates the complete schematic design, simulation, and characterization of a CMOS inverter using the Sky130 Process Design Kit (Sky130A PDK). The design is implemented and simulated using Xschem for schematic capture and Ngspice for electrical simulation.

The CMOS inverter serves as a fundamental building block in digital logic design. This project explores both DC and Transient behavior of the inverter to extract important performance metrics such as:

    Voltage Transfer Characteristic (VTC) curve

    Switching Threshold (VM): the input voltage at which output = input

    Noise Margins (NMH, NML): indicators of noise immunity

    Propagation Delays (tPHL, tPLH): delays during output transitions

    Rise and Fall Times (trise, tfall): speed of output transition edges

    Dynamic Power Consumption: estimated from average current drawn from VDD

All simulations are performed using Sky130 PDK’s native transistor models (sky130_fd_pr__nfet_01v8, sky130_fd_pr__pfet_01v8) with 1.8V standard CMOS operation.

**.dc sweep** VTC curve, VM, noise margins  , VM, NMH, NML(matrices extracted)

**.tran**	Time-based waveform of Vin/Vout	tPHL, tPLH, trise, tfall, avg_power((matrices extracted)

## OVERVIEW

CMOS_inverter/

├── inverter_tb.sch                   # Xschem schematic of CMOS inverter + testbench

├── plots/                            # All simulation result visuals

│   ├── inverter_schematic.png        # Snapshot of schematic from Xschem

│   ├── vtc_plot.png                  # DC sweep: Vout vs Vin (Voltage Transfer Curve)

│   ├── vtc_vm.png                    # Switching threshold (VM) marked on VTC plot

│   ├── noise_margin.png              # NMH and NML annotated on VTC

│   ├── transient_plot.png            # Vin/Vout waveform from transient sim

│   ├── delay_rise_fall.png           # tPHL, tPLH, rise/fall time annotations

│   ├── power_terminal_output.png     # Screenshot of terminal showing average power

│   └── all_measures_terminal.png     # Screenshot of all .measure results

├── README.md                         # Project description and plots (step-by-step added)



 ## All Tools Used in This Project

| Tool |         Purpose             |         Install Command      |
|------|---------|------------------|

| ![Xschem](https://raw.githubusercontent.com/StefanSchippers/xschem/master/icons/xschem-icon-64.png) **Xschem** | Schematic capture, simulation setup | `sudo apt install xschem` |

| ![Ngspice](https://raw.githubusercontent.com/imchipwood/ngspice-mirror/master/ngspice.png) **Ngspice** | SPICE-based circuit simulation (.dc, .tran) | `sudo apt install ngspice` |

| ![GTKWave](https://gtkwave.sourceforge.net/gtkwaveicon.png) **GTKWave** | View waveform outputs (.vcd files) | `sudo apt install gtkwave` |

| ![Magic VLSI](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Magic_VLSI_logo.png/120px-Magic_VLSI_logo.png) **Magic VLSI** | CMOS layout editing, DRC, GDS export | Use via OpenLane or `sudo apt install magic` |

| ![Gnuplot](https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Gnuplot_logo.svg/120px-Gnuplot_logo.svg.png) **Gnuplot** | Plot graphs from simulation data (optional) | `sudo apt install gnuplot` |

| ![Sky130 PDK](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/SkyWater_Technology_logo.svg/120px-SkyWater_Technology_logo.svg.png) **Sky130 PDK** | Foundry models, technology files | Installed via `volare` or OpenLane |

<img width="1211" height="376" alt="Image" src="https://github.com/user-attachments/assets/e83e4c45-0958-4e93-aa0c-2ad946b9e9d9" />
<img width="1218" height="265" alt="Image" src="https://github.com/user-attachments/assets/fefdc828-c29b-4ce0-b5e1-31e9b82f43db" />

## 1. DC Analysis (Voltage Transfer Characteristics - VTC)

In DC analysis, the input voltage (Vin) is swept slowly from 0V to 1.8V, while observing the output voltage
(Vout).

What we do:

- Use '.dc Vin 0 1.8 0.01' command in the SPICE control block.
- 
- Plot the resulting VTC curve: Vout vs Vin.
- 
What we find:

- Voltage Transfer Characteristics (VTC)

- Switching Threshold Voltage (VM): The point where Vout = Vin

- VOH (Output High) and VOL (Output Low)

- VIH and VIL (Input thresholds)
 
- Noise Margins:

- NMH = VOH - VIH

- NML = VIL - VOL

- Transfer Gain: Steepest slope of VTC near VM (dVout/dVin)

Unique Points:

- Gain analysis adds insight into signal integrity.

- Noise margin extraction provides robustness data.

- These are critical for standard cell characterization.

<img width="1280" height="800" alt="Image" src="https://github.com/user-attachments/assets/bf68dbaf-a26e-4ec6-b6ec-2a7eafbaf5bb" />

<img width="1280" height="800" alt="Image" src="https://github.com/user-attachments/assets/bd83078b-ee81-44f8-8426-27fc66f31d2d" />

<img width="1280" height="800" alt="Image" src="https://github.com/user-attachments/assets/7354ba5a-c29f-4c08-a9aa-5ef0b68736fb" />

<img width="1280" height="800" alt="Image" src="https://github.com/user-attachments/assets/45ec7666-9bdb-423b-a211-f8a0fadce14a" />

