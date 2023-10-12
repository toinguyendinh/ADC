v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
L 4 -0 -460 0 0 {}
L 4 0 -460 540 -460 {}
L 4 540 -460 540 -0 {}
L 4 -0 0 540 -0 {}
N 60 -300 120 -300 { lab=inp}
N 60 -140 120 -140 { lab=inn}
N 200 -300 460 -300 { lab=outp}
N 200 -140 460 -140 { lab=outn}
N 220 -300 220 -220 { lab=outp}
N 300 -220 300 -140 { lab=outn}
N 340 -220 340 -140 { lab=outn}
N 420 -300 420 -220 { lab=outp}
N 260 -380 260 -250 { lab=VPWR}
N 380 -380 380 -250 { lab=VPWR}
N 260 -190 260 -70 { lab=VGND}
N 380 -190 380 -70 { lab=VGND}
N 160 -380 160 -330 { lab=VPWR}
N 160 -210 160 -170 { lab=VPWR}
N 160 -110 160 -70 { lab=VGND}
N 160 -270 160 -230 { lab=VGND}
N 190 -30 250 -30 { lab=VGND}
N 190 -410 250 -410 { lab=VPWR}
C {devices/lab_pin.sym} 160 -360 0 0 {name=l2 sig_type=std_logic lab=VPWR}
C {devices/lab_pin.sym} 380 -360 0 0 {name=l3 sig_type=std_logic lab=VPWR}
C {devices/lab_pin.sym} 160 -190 0 0 {name=l4 sig_type=std_logic lab=VPWR}
C {devices/lab_pin.sym} 160 -90 0 0 {name=l5 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 260 -90 0 0 {name=l6 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 380 -90 0 0 {name=l7 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 160 -250 0 0 {name=l8 sig_type=std_logic lab=VGND}
C {devices/lab_wire.sym} 90 -300 0 0 {name=l9 sig_type=std_logic lab=inp}
C {devices/lab_wire.sym} 90 -140 0 0 {name=l1 sig_type=std_logic lab=inn}
C {devices/lab_wire.sym} 450 -300 0 0 {name=l10 sig_type=std_logic lab=outp}
C {devices/lab_wire.sym} 450 -140 0 0 {name=l11 sig_type=std_logic lab=outn}
C {devices/opin.sym} 460 -300 0 0 {name=p1 lab=outp}
C {devices/ipin.sym} 60 -140 0 0 {name=p2 lab=inn}
C {devices/iopin.sym} 250 -30 0 0 {name=p3 lab=VGND}
C {devices/opin.sym} 460 -140 0 0 {name=p4 lab=outn}
C {devices/ipin.sym} 60 -300 0 0 {name=p5 lab=inp}
C {devices/iopin.sym} 250 -410 0 0 {name=p6 lab=VPWR}
C {devices/lab_wire.sym} 230 -410 0 0 {name=l12 sig_type=std_logic lab=VPWR}
C {devices/lab_wire.sym} 230 -30 0 0 {name=l13 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 260 -360 0 0 {name=l14 sig_type=std_logic lab=VPWR}
C {inverter.sym} 160 -300 0 0 {name=Xi_1 L=\\"L12\\" Wp=\\"Wp12\\" Np=1 Wn=\\"Wn12\\" Nn=1}
C {inverter.sym} 260 -220 0 0 {name=Xi_3 L=\\"L34\\" Wp=\\"Wp34\\" Np=1 Wn=\\"Wn34\\" Nn=1}
C {inverter.sym} 160 -140 0 0 {name=Xi_2 L=\\"L12\\" Wp=\\"Wp12\\" Np=1 Wn=\\"Wn12\\" Nn=1}
C {inverter.sym} 380 -220 0 0 {name=Xi_4 L=\\"L34\\" Wp=\\"Wp34\\" Np=1 Wn=\\"Wn34\\" Nn=1}
