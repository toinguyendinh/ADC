v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 0 0 915 -0 {}
L 4 915 -605 915 -0 {}
L 4 0 -605 915 -605 {}
L 4 0 -605 -0 -0 {}
N 55 -415 55 -405 {
lab=GND}
N 160 -425 160 -415 {
lab=GND}
N 60 -280 60 -270 {
lab=GND}
N 285 -175 375 -175 {
lab=V_ctrl}
N 330 -175 330 -155 {
lab=V_ctrl}
N 375 -90 375 -40 {
lab=ENB}
N 180 -175 225 -175 {
lab=input_signal}
N 535 -200 595 -200 {
lab=pha_0}
N 535 -175 595 -175 {
lab=pha_1}
N 535 -150 595 -150 {
lab=pha_2}
N 535 -125 595 -125 {
lab=pha_3}
N 535 -100 595 -100 {
lab=pha_4}
N 460 -255 460 -230 {
lab=VDD}
N 55 -485 55 -475 {
lab=VDD}
N 160 -515 160 -480 {
lab=ENB}
N 330 -95 330 -70 {
lab=GND}
N 60 -360 60 -340 {
lab=input_signal}
C {/home/toind/eda/ADC/circuit_model/lib/vco.sym} 385 -130 0 0 {name=Xvco_1 L12=\\"L12\\" Wp12=\\"Wp12\\" Wn12=\\"Wn12\\" L34=\\"L34\\" Wp34=\\"Wp34\\" Wn34=\\"Wn34\\"}
C {devices/code.sym} 440 -510 0 0 {name=library only_toplevel=false value=
"
**LIB with Local Computer
.lib /home/toind/eda/uniccass/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.inc /home/toind/eda/uniccass/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 585 -515 0 0 {name=control only_toplevel=false value=
"
.tran 1n 10u
.save all
"
*"
*.control
*save all
*set nobreak
*set num_threads=3
*set mode=1
*if ($mode = 1)
**    save all
*    TRAN 1n 10u
**    plot input_signal V_ctrl pha_0
*    MEAS TRAN prd TRIG pha_0 VAL=0.8 RISE=10 TARG pha_0 VAL=0.8 RISE=20
*    let freq=10/prd
*    echo \\"Frequency: \\"
*    print freq
*end

*if ($mode = 2)
*    save \\"VDD\\" @Vsup[i] \\"p[0]\\"
*    TRAN 1n 10u
*    MEAS TRAN I_vco AVG @Vsup[i] FROM=2u TO=8u
*    MEAS TRAN V_vco AVG VDD FROM=2u TO=8u
*    let Power=I_vco*V_vco
*    echo \\"Power: \\"
*    print Power
*end
*.endc
*"}
C {devices/code_shown.sym} 735 -505 0 0 {name=parameter only_toplevel=false value=
"
.param mc_mm_switch=0
.param L12=1.5
.param Wp12=3
.param Wn12=6
.param L34=1.5
.param Wp34=1
.param Wn34=2
"}
C {devices/vsource.sym} 55 -445 0 0 {name=VDD value="DC=1.8"}
C {devices/gnd.sym} 55 -405 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 160 -455 0 0 {name=Venb1 value="DC=0 PULSE( 0 1.8 0 0.1n 0.1n 20n 1)"}
C {devices/gnd.sym} 160 -415 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 60 -310 0 0 {name=V_input value="DC=0"}
C {devices/gnd.sym} 60 -270 0 0 {name=l3 lab=GND}
C {devices/res.sym} 330 -125 0 0 {name=R1
value=100
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 255 -175 3 0 {name=R2
value=100
footprint=1206
device=resistor
m=1}
C {devices/vdd.sym} 460 -255 0 0 {name=l4 lab=VDD}
C {devices/vdd.sym} 55 -485 0 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} 160 -500 0 0 {name=p1 sig_type=std_logic lab=ENB}
C {devices/lab_pin.sym} 375 -50 2 0 {name=p2 sig_type=std_logic lab=ENB}
C {devices/lab_pin.sym} 595 -200 2 0 {name=p3 sig_type=std_logic lab=pha_0}
C {devices/lab_pin.sym} 595 -175 2 0 {name=p4 sig_type=std_logic lab=pha_1}
C {devices/lab_pin.sym} 595 -150 2 0 {name=p5 sig_type=std_logic lab=pha_2}
C {devices/lab_pin.sym} 595 -125 2 0 {name=p6 sig_type=std_logic lab=pha_3}
C {devices/lab_pin.sym} 595 -100 2 0 {name=p7 sig_type=std_logic lab=pha_4}
C {devices/lab_pin.sym} 360 -175 1 0 {name=p8 sig_type=std_logic lab=V_ctrl}
C {devices/gnd.sym} 330 -70 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 60 -360 2 0 {name=p9 sig_type=std_logic lab=input_signal}
C {devices/ipin.sym} 180 -175 0 0 {name=p10 lab=input_signal}
