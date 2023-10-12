v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 600 -240 600 -200 { lab=VDD}
N 600 -140 600 -100 { lab=ampere}
N 540 -170 560 -170 { lab=input}
N 90 -330 90 -290 { lab=input}
C {sky130_fd_pr/nfet3_01v8.sym} 580 -170 0 0 {name=M1
L=\\"L\\"
W=\\"Wn\\"
body=GND
nf=\\"Nn\\"
spiceprefix=X
}
C {devices/vdd.sym} 600 -240 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 600 -100 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 90 -260 0 0 {name=V1 value="DC=1.8"}
C {devices/vsource.sym} 180 -260 0 0 {name=V2 value="DC=1.8"}
C {devices/gnd.sym} 180 -230 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 90 -230 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 180 -290 0 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} 90 -320 0 0 {name=l6 sig_type=std_logic lab=input}
C {devices/lab_pin.sym} 550 -170 0 0 {name=l7 sig_type=std_logic lab=input}
C {devices/code.sym} 20 -140 0 0 {name=lib only_toplevel=false value=
"
.lib /home/dkits/efabless/mpw-5/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.inc /home/dkits/efabless/mpw-5/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code_shown.sym} 280 -130 0 0 {name=parameter only_toplevel=false value=
"
.param mc_mm_switch=0
.param L=1.5
.param Wn=3
.param Nn=1
"}
C {devices/code.sym} 140 -140 0 0 {name=control only_toplevel=false value=
"
.control
set nobreak
set numthread=11
TRAN 1n 6u
save i(M1, ampere)
plot input output
.endc
"}
C {devices/lab_pin.sym} 600 -120 0 0 {name=l8 sig_type=std_logic lab=ampere}
