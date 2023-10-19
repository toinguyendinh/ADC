v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 0 -605 915 -605 {}
L 4 0 -605 -0 -0 {}
L 4 0 0 1010 0 {}
L 4 1010 -605 1010 0 {}
L 4 915 -605 1010 -605 {}
N 55 -415 55 -405 {
lab=GND}
N 70 -245 70 -235 {
lab=GND}
N 150 -430 150 -420 {
lab=GND}
N 385 -155 475 -155 {
lab=V_ctrl}
N 430 -155 430 -135 {
lab=V_ctrl}
N 475 -70 475 -20 {
lab=ENB}
N 280 -155 325 -155 {
lab=input_signal}
N 635 -180 695 -180 {
lab=pha_0}
N 635 -155 695 -155 {
lab=pha_1}
N 635 -130 695 -130 {
lab=pha_2}
N 635 -105 695 -105 {
lab=pha_3}
N 635 -80 695 -80 {
lab=pha_4}
N 560 -235 560 -210 {
lab=VDD}
N 55 -485 55 -475 {
lab=VDD}
N 70 -335 70 -300 {
lab=ENB}
N 430 -75 430 -50 {
lab=GND}
N 150 -510 150 -490 {
lab=input_signal}
C {/home/toind/eda/ADC/circuit_model/lib/vco.sym} 485 -110 0 0 {name=Xvco_1 L12=\\"L12\\" Wp12=\\"Wp12\\" Wn12=\\"Wn12\\" L34=\\"L34\\" Wp34=\\"Wp34\\" Wn34=\\"Wn34\\"}
C {devices/code.sym} 440 -510 0 0 {name=library only_toplevel=false value=
"
**LIB with Local Computer
.lib /home/toind/eda/uniccass/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.inc /home/toind/eda/uniccass/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 585 -515 0 0 {name=control only_toplevel=false value=
"
.control
*save all
set nobreak
set num_threads=5
set mode=1
if ($mode = 1)
    save all
    TRAN 1n 20u
    plot input_signal V_ctrl pha_0
    MEAS TRAN prd TRIG pha_0 VAL=0.8 RISE=2 TARG pha_0 VAL=0.8 RISE=8
    let freq=6/prd
    echo \\"Frequency: \\"
    print freq
end

if ($mode = 2)
    save \\"VDD\\" @Vsup[i] \\"p[0]\\"
    TRAN 1n 10u
    MEAS TRAN I_vco AVG @Vsup[i] FROM=2u TO=8u
    MEAS TRAN V_vco AVG VDD FROM=2u TO=8u
    let Power=I_vco*V_vco
    echo \\"Power: \\"
    print Power
end
.endc
"}
C {devices/code_shown.sym} 735 -505 0 0 {name=parameter only_toplevel=false value=
"
.param mc_mm_switch=0
.param L12=.8
.param Wp12=8
.param Wn12=4
.param L34=.8
.param Wp34=2
.param Wn34=1
"}
C {devices/vsource.sym} 55 -445 0 0 {name=VDD value="DC=1.2"}
C {devices/gnd.sym} 55 -405 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 70 -275 0 0 {name=Venb1 value="DC=0 PULSE( 0 1.8 0 0.1n 0.1n 20n 1)"}
C {devices/gnd.sym} 70 -235 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 150 -460 0 0 {name=V_input value="DC=0 sin(0.8 0.4 0.5Meg 0 0 0)"}
C {devices/gnd.sym} 150 -420 0 0 {name=l3 lab=GND}
C {devices/res.sym} 430 -105 0 0 {name=R1
value=100
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 355 -155 3 0 {name=R2
value=100
footprint=1206
device=resistor
m=1}
C {devices/vdd.sym} 560 -235 0 0 {name=l4 lab=VDD}
C {devices/vdd.sym} 55 -485 0 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} 70 -320 0 0 {name=p1 sig_type=std_logic lab=ENB}
C {devices/lab_pin.sym} 475 -30 2 0 {name=p2 sig_type=std_logic lab=ENB}
C {devices/lab_pin.sym} 695 -180 2 0 {name=p3 sig_type=std_logic lab=pha_0}
C {devices/lab_pin.sym} 695 -155 2 0 {name=p4 sig_type=std_logic lab=pha_1}
C {devices/lab_pin.sym} 695 -130 2 0 {name=p5 sig_type=std_logic lab=pha_2}
C {devices/lab_pin.sym} 695 -105 2 0 {name=p6 sig_type=std_logic lab=pha_3}
C {devices/lab_pin.sym} 695 -80 2 0 {name=p7 sig_type=std_logic lab=pha_4}
C {devices/lab_pin.sym} 460 -155 1 0 {name=p8 sig_type=std_logic lab=V_ctrl}
C {devices/gnd.sym} 430 -50 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 150 -510 2 0 {name=p9 sig_type=std_logic lab=input_signal}
C {devices/ipin.sym} 280 -155 0 0 {name=p10 lab=input_signal}
