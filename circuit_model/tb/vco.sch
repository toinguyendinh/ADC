v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
L 4 0 -540 -0 -0 {}
L 4 -0 -540 520 -540 {}
L 4 -0 0 520 -0 {}
L 4 520 -0 580 -0 {}
L 4 800 -540 800 0 {}
L 4 520 -540 800 -540 {}
L 4 580 -0 800 0 {}
N 515 -410 515 -390 { lab=VDD}
N 50 -320 50 -280 { lab=VDD}
N 50 -220 50 -180 { lab=GND}
N 150 -310 150 -270 { lab=GND}
N 150 -410 150 -370 { lab=Anlg_in}
N 50 -425 50 -385 { lab=GND}
N 50 -525 50 -485 { lab=ENB}
N 590 -360 650 -360 { lab=pha_vco_0}
N 370 -335 430 -335 { lab=Anlg_in}
N 370 -250 430 -250 { lab=ENB}
N 590 -335 650 -335 { lab=pha_vco_1}
N 590 -310 650 -310 { lab=pha_vco_2}
N 590 -285 650 -285 { lab=pha_vco_3}
N 590 -260 650 -260 { lab=pha_vco_4}
N 650 -360 700 -360 { lab=pha_vco_0}
N 650 -335 700 -335 { lab=pha_vco_1}
N 650 -310 700 -310 { lab=pha_vco_2}
N 650 -285 700 -285 { lab=pha_vco_3}
N 650 -260 695 -260 { lab=pha_vco_4}
N 695 -260 700 -260 { lab=pha_vco_4}
N 515 -470 515 -410 { lab=VDD}
C {devices/vdd.sym} 515 -470 0 0 {name=l11 lab=VDD}
C {devices/vsource.sym} 50 -250 0 0 {name=Vsup value="DC=1.8"}
C {devices/vsource.sym} 150 -340 0 0 {name=V_in value="DC=0 SIN(0.8 0.4 1.5Meg 0 0 0)"}
C {devices/lab_wire.sym} 420 -335 0 0 {name=l12 sig_type=std_logic lab=Anlg_in
}
C {devices/vsource.sym} 50 -455 0 0 {name=Venb1 value="DC=0 PULSE( 0 1.8 0 0.1n 0.1n 20n 1)"}
C {devices/vdd.sym} 50 -320 0 0 {name=l13 lab=VDD}
C {devices/gnd.sym} 50 -180 0 0 {name=l14 lab=GND}
C {devices/gnd.sym} 150 -270 0 0 {name=l15 lab=GND}
C {devices/gnd.sym} 50 -385 0 0 {name=l17 lab=GND}
C {devices/lab_pin.sym} 150 -390 2 0 {name=l18 sig_type=std_logic lab=Anlg_in}
C {devices/lab_pin.sym} 50 -505 0 0 {name=l19 sig_type=std_logic lab=ENB}
C {devices/code.sym} 50 -130 0 0 {name=control only_toplevel=false value="
.control
set nobreak
set num_threads=11
set test_mode = 0
* mode = 0: operation testing				1:  frequency extraction    2:  power consumption
if ($test_mode = 0)
    TRAN 1n 10u
    plot Anlg_in pha_vco_0
    MEAS TRAN prd_0 TRIG pha_vco_0 VAL=0.8 RISE=10 TARG pha_vco_0 VAL=0.8 RISE=20
    let freq_0 = 10/prd_0
    echo \\"frequency: \\"
    print freq_0
end

if ($test_mode = 1)
    let Vlow = 0
    let Vlimit = 1.01     $ set upper bound for sweeping
    let Vsweep = 0.2      $ set step size for sweeping
    let NoPoints=(Vlimit-Vlow)/Vsweep+2    $ set number of points for sweeping
    let freq_0 =unitvec(NoPoints)
    let Vin  =unitvec(NoPoints)
    let Vin[0]=Vlow
    let ix=0
    let I_vco =unitvec(NoPoints)
    while Vin[ix] < Vlimit
        alter V_in DC=Vin[ix]
        TRAN 1n 	10u
	SAVE @R_debug[i] pha_vco_0 
        MEAS TRAN prd_0 TRIG pha_vco_0 VAL=0.8 RISE=10 TARG pha_vco_0 VAL=0.8 RISE =20
	MEAS TRAN Ivco 0 AVG @R_debug[i] FROM=1u TO=6u
	let I_vco[ix] = Ivco
        let freq_0[ix] = 10/prd_0
        let ix = ix+1
        Let Vin[ix] = Vin[ix-1]+Vsweep
    end
   print Vin freq_0 I_vco
end

if ($test_mode = 2)
    save \\"vdd\\" @Vsup[i] \\"p[0]\\"
    TRAN 1n 6u
    MEAS TRAN I_vco AVG @Vsup[i] FROM=3u TO=4u
    MEAS TRAN V_vco AVG vdd FROM=3u TO=4u
    let Power=I_vco*V_vco
    print Power
end
.endc
"}
C {devices/code.sym} 190 -130 0 0 {name=lib only_toplevel=false value="
** Library on VNU server
.lib /home/dkits/efabless/mpw-5/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.inc /home/dkits/efabless/mpw-5/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
** Library on Home PC
*.lib /home/dkit/efabless/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
*.inc /home/dkit/efabless/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/lab_wire.sym} 420 -250 0 0 {name=l1 sig_type=std_logic lab=ENB}
C {devices/lab_wire.sym} 695 -360 0 0 {name=l2 sig_type=std_logic lab=pha_vco_0}
C {devices/code_shown.sym} 330 -160 0 0 {name=parameter only_toplevel=false value="
.param mc_mm_switch=0
.param L12=1.5
.param Wp12=3
.param Wn12=6
.param L34=1.5
.param Wp34=1
.param Wn34=2
"}
C {devices/lab_wire.sym} 695 -335 0 0 {name=l3 sig_type=std_logic lab=pha_vco_1}
C {devices/lab_wire.sym} 695 -310 0 0 {name=l4 sig_type=std_logic lab=pha_vco_2}
C {devices/lab_wire.sym} 695 -285 0 0 {name=l5 sig_type=std_logic lab=pha_vco_3}
C {devices/lab_wire.sym} 695 -260 0 0 {name=l6 sig_type=std_logic lab=pha_vco_4}
C {/home/userdata/k63D/toind_63d/Desktop/project/circuit_model/lib/vco.sym} 440 -290 0 0 {name=Xvco_1 L12=\\"L12\\" Wp12=\\"Wp12\\" Wn12=\\"Wn12\\" L34=\\"L34\\" Wp34=\\"Wp34\\" Wn34=\\"Wn34\\"}
