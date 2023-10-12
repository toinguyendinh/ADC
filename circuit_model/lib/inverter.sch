v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
L 4 0 -140 200 -140 {}
L 4 200 -140 200 160 {}
L 4 -0 160 200 160 {}
L 4 -0 -140 -0 160 {}
N 70 -50 70 50 { lab=A}
N 110 -20 110 20 { lab=Y}
N 110 80 110 120 { lab=VGND}
N 110 -110 110 -80 { lab=VPWR}
N 50 0 70 0 { lab=A}
N 110 0 140 0 { lab=Y}
C {sky130_fd_pr/pfet3_01v8.sym} 90 -50 0 0 {name=M1
L=\\"L\\"
W=\\"Wp\\"
body=VDD
nf=\\"Np\\"
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 90 50 0 0 {name=M2
L=\\"L\\"
W=\\"Wn\\"
body=GND
nf=\\"Nn\\"
spiceprefix=X
}
C {devices/iopin.sym} 110 -110 0 0 {name=p1 lab=VPWR}
C {devices/iopin.sym} 110 120 0 0 {name=p2 lab=VGND}
C {devices/ipin.sym} 50 0 0 0 {name=p3 lab=A
}
C {devices/opin.sym} 140 0 0 0 {name=p4 lab=Y}
