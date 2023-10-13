v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 0 -420 800 -20 {flags=graph
y1=0
y2=0.0002
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.8


node="Id9
Id_8
Id_7
Id_6
Id_5
Id_4
Id_3"
color="7 6 8 10 12 13 14"
dataset=-1
unitx=1
logx=0
logy=0

subdivx=4
divx=5}
N 130 -570 130 -530 {
lab=D}
N 190 -570 190 -530 {
lab=G}
N 330 -570 330 -540 {
lab=D}
N 250 -510 290 -510 {
lab=G}
C {devices/gnd.sym} 130 -470 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 130 -500 0 0 {name=Vds value=1.8}
C {sky130_fd_pr/nfet3_01v8.sym} 310 -510 0 0 {name=M1
L=0.15
W=0.4
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 190 -470 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 190 -500 0 0 {name=Vgs value=0.2}
C {devices/gnd.sym} 330 -480 0 0 {name=l1 lab=GND}
C {devices/code.sym} 420 -550 0 0 {name=DC_analysis only_toplevel=false value="
.lib /home/manhtd_61d/work/conda_eda/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.control

* Measuring the threshold voltage of NMOS 

let Id_ = vector(1810)
reshape Id_ [10][181] 
compose Vg start = 0 stop = 2 step = 0.2
let j = 0
while Vg[j]<1.8
	echo \\"Vd sweeping\\"
	print j
	print Vgs[j]
	alter Vgs dc=Vg[j]
	dc Vds 0 1.8 0.01
	save i(Vds)
	let Id_[j]=-i(Vds)
	let j = j+1
end
let Id_0=Id_[0]
let Id_1=Id_[1]
let Id_2=Id_[2]
let Id_3=Id_[3]
let Id_4=Id_[4]
let Id_5=Id_[5]
let Id_6=Id_[6]
let Id_7=Id_[7]
let Id_8=Id_[8]
let Id_9=Id_[9]

write dc_analysis.raw
.endc
"
}
C {devices/lab_wire.sym} 130 -550 0 0 {name=p1 sig_type=std_logic lab=D}
C {devices/lab_wire.sym} 190 -550 0 0 {name=p2 sig_type=std_logic lab=G}
C {devices/lab_wire.sym} 330 -550 0 0 {name=p3 sig_type=std_logic lab=D}
C {devices/lab_wire.sym} 270 -510 0 0 {name=p4 sig_type=std_logic lab=G}
C {devices/title.sym} 160 0 0 0 {name=l3 author="Duck-Manh-Tran"}
C {devices/launcher.sym} 620 -500 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/dc_analysis.raw dc"
}
