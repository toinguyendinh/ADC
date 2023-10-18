v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 0 -580 -0 0 {}
L 4 -0 0 960 0 {}
L 4 960 -590 960 0 {}
L 4 -0 -590 960 -590 {}
L 4 -0 -590 -0 -580 {}
N 90 -340 90 -310 { lab=VDD}
N 400 -490 400 -470 { lab=VDD}
N 90 -250 90 -230 { lab=GND}
N 400 -310 400 -290 { lab=GND}
N 300 -420 330 -420 { lab=inp}
N 300 -360 330 -360 { lab=inn}
N 470 -420 500 -420 { lab=outp}
N 470 -360 500 -360 { lab=outn}
N 90 -80 90 -60 { lab=GND}
N 90 -440 90 -420 { lab=GND}
N 90 -170 90 -140 { lab=inp}
N 90 -530 90 -500 { lab=inn}
C {devices/vsource.sym} 90 -280 0 0 {name=VDD value=1}
C {devices/vsource.sym} 90 -110 0 0 {name=V_in_p value="DC=0 PULSE(0 1.8 0 0.001n 0.001n 1.999998u 4u 0)"
*PULSE(0.5 0.4 1Meg 0 0 0)"}
C {devices/vdd.sym} 90 -340 0 0 {name=l1 lab=VDD}
C {devices/vdd.sym} 400 -490 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} 90 -230 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 400 -290 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 90 -470 0 0 {name=V_in_n value="DC=0 PULSE(0 1.8 0 0.001n 0.001n 1.999998u 4u 90)"}
C {devices/gnd.sym} 90 -60 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 500 -420 2 0 {name=l6 sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} 500 -360 2 0 {name=l7 sig_type=std_logic lab=outn}
C {devices/gnd.sym} 90 -420 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 310 -420 1 0 {name=l9 sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 310 -360 3 0 {name=l10 sig_type=std_logic lab=inn}
C {devices/lab_pin.sym} 90 -520 0 0 {name=l11 sig_type=std_logic lab=inn}
C {devices/lab_pin.sym} 90 -160 0 0 {name=l12 sig_type=std_logic lab=inp}
C {devices/code.sym} 690 -520 0 0 {name=control only_toplevel=false value=
"
.control
set nobreak
set num_thread = 5
TRAN 1n 10u
 
.endc
"}
C {devices/code_shown.sym} 410 -170 0 0 {name=parameter only_toplevel=false value=
"
.param mc_mm_switch=0
.param L12=1.5
.param Wp12=6
.param Wn12=12
.param L34=1.5
.param Wp34=2
.param Wn34=4
"}
C {devices/code.sym} 700 -330 0 0 {name=lib only_toplevel=false value=
"
.lib /home/dkits/efabless/mpw-5/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.inc /home/dkits/efabless/mpw-5/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice

"
}
C {cc_inv.sym} 400 -390 0 0 {name=Xi_2 L12=0.15 Wp12=1.2 Wn12=0.65 L34=0.15 Wp34=1.2 Wn34=0.65}
