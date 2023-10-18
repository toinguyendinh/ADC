v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
L 4 -0 -360 600 -360 {}
L 4 600 -360 600 0 {}
L 4 0 -0 600 0 {}
L 4 0 -360 -0 -0 {}
N 440 -240 440 -140 { lab=input}
N 480 -210 480 -170 { lab=output}
N 480 -110 480 -70 { lab=GND}
N 480 -300 480 -270 { lab=VDD}
N 420 -190 440 -190 { lab=input}
N 480 -190 510 -190 { lab=output}
N 240 -150 240 -110 { lab=input}
C {sky130_fd_pr/pfet3_01v8.sym} 460 -240 0 0 {name=M1
L=\\"L\\"
W=\\"Wp\\"
body=VDD
nf=\\"Np\\"
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 460 -140 0 0 {name=M2
L=\\"L\\"
W=\\"Wn\\"
body=GND
nf=\\"Nn\\"
spiceprefix=X
}
C {devices/vdd.sym} 480 -300 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 480 -70 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 240 -80 0 0 {name=V1 value="DC=0"}
C {devices/vsource.sym} 330 -80 0 0 {name=V2 value="DC=1.8"}
C {devices/gnd.sym} 330 -50 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 240 -50 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 330 -110 0 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} 240 -140 0 0 {name=l6 sig_type=std_logic lab=input}
C {devices/lab_pin.sym} 430 -190 0 0 {name=l7 sig_type=std_logic lab=input}
C {devices/lab_pin.sym} 500 -190 2 0 {name=l8 sig_type=std_logic lab=output}
C {devices/code.sym} 20 -300 0 0 {name=lib only_toplevel=false value=
"
.lib /home/dkits/efabless/mpw-5/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.inc /home/dkits/efabless/mpw-5/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code_shown.sym} 140 -300 0 0 {name=parameter only_toplevel=false value=
"
.param mc_mm_switch=0
.param Wp=1
.param L=1.5
.param Wn=3
.param Np=1
.param Nn=1
"}
C {devices/code.sym} 20 -140 0 0 {name=control only_toplevel=false value=
"
.control
set nobreak
set numthread=11
TRAN 1n 6u
save i(M1)
save i(M2)
plot input output
.endc
"}
