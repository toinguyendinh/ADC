v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 0 -510 420 -510 {}
L 4 0 -40 420 -40 {}
L 4 -0 -480 -0 -440 {}
L 4 420 -480 420 -440 {}
L 4 420 -510 420 -480 {}
L 4 -0 -510 -0 -480 {}
L 4 -0 -440 0 -40 {}
L 4 420 -440 420 -40 {}
N 100 -420 140 -420 { lab=pn[0]}
N 100 -380 140 -380 { lab=pn[1]}
N 100 -340 140 -340 { lab=pn[2]}
N 100 -300 140 -300 { lab=pn[3]}
N 100 -260 140 -260 { lab=pn[4]}
N 260 -420 300 -420 { lab=p[0]}
N 260 -380 300 -380 { lab=p[1]}
N 260 -340 300 -340 { lab=p[2]}
N 260 -300 300 -300 { lab=p[3]}
N 260 -260 300 -260 { lab=p[4]}
N 200 -490 200 -470 { lab=VPWR}
N 265 -110 305 -110 { lab=pn[0]}
N 160 -70 185 -70 { lab=ENB}
N 120 -110 185 -110 { lab=VPWR}
N 200 -180 200 -160 { lab=V_ctrl}
N 200 -200 200 -180 { lab=V_ctrl}
N 140 -160 200 -160 {
lab=V_ctrl}
C {devices/lab_wire.sym} 130 -420 0 0 {name=l1 sig_type=std_logic lab=pn[0]}
C {devices/lab_wire.sym} 130 -380 0 0 {name=l2 sig_type=std_logic lab=pn[1]}
C {devices/lab_wire.sym} 130 -340 0 0 {name=l3 sig_type=std_logic lab=pn[2]}
C {devices/lab_wire.sym} 130 -300 0 0 {name=l4 sig_type=std_logic lab=pn[3]}
C {devices/lab_wire.sym} 130 -260 0 0 {name=l5 sig_type=std_logic lab=pn[4]}
C {devices/lab_wire.sym} 270 -420 2 0 {name=l6 sig_type=std_logic lab=p[0]}
C {devices/lab_wire.sym} 270 -380 2 0 {name=l7 sig_type=std_logic lab=p[1]}
C {devices/lab_wire.sym} 270 -340 2 0 {name=l8 sig_type=std_logic lab=p[2]}
C {devices/lab_wire.sym} 270 -300 2 0 {name=l9 sig_type=std_logic lab=p[3]}
C {devices/lab_wire.sym} 270 -260 2 0 {name=l10 sig_type=std_logic lab=p[4]}
C {devices/lab_wire.sym} 200 -160 0 0 {name=l12 sig_type=std_logic lab=V_ctrl}
C {sky130_stdcells/einvp_1.sym} 225 -110 0 0 {name=x1 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 275 -110 2 0 {name=l21 sig_type=std_logic lab=pn[0]}
C {devices/lab_wire.sym} 155 -110 0 0 {name=l16 sig_type=std_logic lab=VPWR}
C {../lib/ring_osc.sym} 200 -340 0 0 {name=Xro_1 L12=\\"L12\\" Wp12=\\"Wp12\\" Wn12=\\"Wn12\\" L34=\\"L34\\" Wp34=\\"Wp34\\" Wn34=\\"Wn34\\"}
C {devices/iopin.sym} 200 -490 0 0 {name=p2 lab=VPWR}
C {devices/opin.sym} 300 -420 0 0 {name=p3 lab=p[0]}
C {devices/ipin.sym} 160 -70 0 0 {name=p4 lab=ENB}
C {devices/opin.sym} 300 -380 0 0 {name=p5 lab=p[1]}
C {devices/opin.sym} 300 -340 0 0 {name=p6 lab=p[2]}
C {devices/opin.sym} 300 -300 0 0 {name=p7 lab=p[3]}
C {devices/opin.sym} 300 -260 0 0 {name=p8 lab=p[4]}
C {devices/ipin.sym} 140 -160 0 0 {name=p1 lab=V_ctrl}
