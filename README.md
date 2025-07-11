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

├── inverter_tb.sch                                                # Xschem schematic of CMOS inverter + testbench

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

COMMANDS
1. cd ~/inverter_project
   
2. git clone https://github.com/D-curs-D/Inverter-design-and-analysis-using-sky130pdk.git
cd Inverter-design-and-analysis-using-sky130pdk

3. mkdir -p ~/sky130_pdk/sky130_fd_pr
   
cd ~/sky130_pdk

git clone https://github.com/google/skywater-pdk.git

cd skywater-pdk

git checkout main

4. xschem


## 1. DC Analysis (Voltage Transfer Characteristics - VTC)

dc directory

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.dc Vin 0 1.8 0.01
.save all
.options savecurrents
.end

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

## 1. VTC CURVE GRAPH

ngspice inverter_test.spice

<img width="1280" height="800" alt="Image" src="https://github.com/user-attachments/assets/20532a0f-5e34-41b1-ab5a-8a9633b94823" />

<img width="1280" height="800" alt="Image" src="https://github.com/user-attachments/assets/5d7ca86e-942f-4021-a320-c39f87183379" />

## 2.SWITCHING THRESHOLD

CMOS Inverter Characterization Report
======================================

Library:       Sky130A (via Volare)

Supply Voltage: VDD = 1.8V

DC Sweep Analysis (VTC)
------------------------

Sweep Range:     Vin = 0V to 1.8V

Step Size:       0.01V

 Switching Threshold (Vth):
 
Vin ≈ 0.68 V (where |Vin - Vout| is minimum)

Note:

- Computed manually from exported VTC data

- Threshold may slightly vary with finer step sizes

Transient, Rise/Fall delay, Power, Noise Margin

> To be added after .tran simulation!


<img width="839" height="522" alt="Image" src="https://github.com/user-attachments/assets/40de917b-2bd9-48a0-bcdb-42e304b44d0c" />

<img width="1280" height="800" alt="image" src="https://github.com/user-attachments/assets/1def8a5d-f713-479f-9e25-f3cefb63f05c" />

## NOISE MARGIN

   1  VOH: Max output voltage (≈ VDD)

   2  VOL: Min output voltage (≈ 0V)

   3  VIL: Vin where dVout/dVin = –1 on falling part

   4  VIH: Vin where dVout/dVin = –1 on rising part

We can estimate visually from VTC graph (manually), or numerically (advanced derivative + awk/GNUPlot).

Noise Margins:

    NMH = VOH – VIH

    NML = VIL – VOL

Example (from graph):

    VOH = 1.8V

    VOL = 0V

    VIH ≈ 1.1V

    VIL ≈ 0.55V

Then:

    NMH ≈ 1.8 – 1.1 = 0.7 V

    NML ≈ 0.55 – 0 = 0.55 V
    
##  PLOTTED

<img width="690" height="454" alt="image" src="https://github.com/user-attachments/assets/11693fde-5299-4e34-a235-31540aa03734" />

