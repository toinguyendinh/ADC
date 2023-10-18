v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
L 4 0 -340 580 -340 {}
L 4 580 -340 580 0 {}
L 4 0 0 580 0 {}
L 4 0 -340 0 0 {}
N 480 -270 480 -230 { lab=D}
N 420 -200 440 -200 { lab=G}
N 220 -150 220 -110 { lab=G}
N 480 -170 480 -150 { lab=GND}
N 480 -90 480 -70 { lab=GND}
N 480 -150 480 -90 { lab=GND}
N 480 -200 550 -200 { lab=0}
N 310 -150 310 -110 { lab=D}
C {devices/gnd.sym} 480 -70 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 220 -80 0 0 {name=VG value=0}
C {devices/vsource.sym} 310 -80 0 0 {name=VD value=0}
C {devices/gnd.sym} 310 -50 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 220 -50 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 220 -140 0 0 {name=l6 sig_type=std_logic lab=G}
C {devices/lab_pin.sym} 420 -200 0 0 {name=l7 sig_type=std_logic lab=G}
C {devices/code.sym} 10 -140 0 0 {name=lib only_toplevel=false value=
"
.lib /home/dkits/efabless/mpw-5/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.inc /home/dkits/efabless/mpw-5/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 10 -290 0 0 {name=control only_toplevel=false value=
"
.control
set nobreak
set numthread=11

dc VD 0 2 0.01 VG 0 2 0.2
print format=raw file=NMOS.raw v(*) i(*)

.endc
"}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 460 -200 0 0 {name=M1
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 310 -140 0 0 {name=l1 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 480 -270 0 0 {name=l5 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 550 -200 2 0 {name=l8 sig_type=std_logic lab=0}
