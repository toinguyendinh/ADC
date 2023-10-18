v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
L 4 0 -565 0 -25 {}
L 4 0 -565 520 -565 {}
L 4 0 0 520 0 {}
L 4 520 -565 580 -565 {}
L 4 520 0 580 0 {}
L 4 980 0 1020 0 {}
L 4 980 -565 1020 -565 {}
L 4 580 -565 980 -565 {}
L 4 1280 -540 1280 0 {}
L 4 580 0 980 0 {}
L 4 0 -25 0 0 {}
L 4 1020 0 1280 0 {}
L 4 1020 -565 1280 -565 {}
L 4 1280 -565 1280 -540 {}
N 195 -460 195 -440 { lab=VDD_A}
N 880 -180 880 -140 { lab=VDD_A}
N 880 -80 880 -40 { lab=GND}
N 40 -85 40 -45 { lab=GND}
N 40 -185 40 -145 { lab=Anlg_in}
N 600 -85 600 -45 { lab=GND}
N 600 -185 600 -145 { lab=ENB}
N 270 -410 330 -410 { lab=pha_vco_0}
N 50 -385 110 -385 { lab=Anlg_in}
N 50 -300 110 -300 { lab=ENB}
N 270 -385 330 -385 { lab=pha_vco_1}
N 270 -360 330 -360 { lab=pha_vco_2}
N 270 -335 330 -335 { lab=pha_vco_3}
N 270 -310 330 -310 { lab=pha_vco_4}
N 330 -410 380 -410 { lab=pha_vco_0}
N 330 -385 380 -385 { lab=pha_vco_1}
N 330 -360 380 -360 { lab=pha_vco_2}
N 330 -335 380 -335 { lab=pha_vco_3}
N 330 -310 375 -310 { lab=pha_vco_4}
N 375 -310 380 -310 { lab=pha_vco_4}
N 380 -410 420 -410 { lab=pha_vco_0}
N 380 -385 420 -385 { lab=pha_vco_1}
N 380 -360 420 -360 { lab=pha_vco_2}
N 380 -335 420 -335 { lab=pha_vco_3}
N 380 -310 420 -310 { lab=pha_vco_4}
N 390 -435 420 -435 { lab=clk}
N 390 -470 390 -435 { lab=clk}
N 260 -85 260 -45 { lab=GND}
N 260 -185 260 -145 { lab=clk}
N 650 -410 760 -410 { lab=ro_0}
N 650 -385 760 -385 { lab=ro_1}
N 650 -360 760 -360 { lab=ro_2}
N 650 -335 760 -335 { lab=ro_3}
N 650 -310 760 -310 { lab=ro_4}
N 975 -185 975 -145 { lab=VDD_D}
N 975 -85 975 -45 { lab=GND}
N 540 -510 540 -475 { lab=VDD_D}
C {devices/vdd.sym} 195 -460 0 0 {name=l11 lab=VDD_A}
C {devices/vsource.sym} 880 -110 0 0 {name=V_VCO value="DC=1.8"}
C {devices/vsource.sym} 40 -115 0 0 {name=Vin value="DC=0 SIN(0.5 0.4 1Meg 0 0 0)"}
C {devices/lab_wire.sym} 100 -385 0 0 {name=l12 sig_type=std_logic lab=Anlg_in
}
C {devices/vsource.sym} 600 -115 0 0 {name=Venb1 value="DC=0 PULSE( 0 1.8 0 0.1n 0.1n 20n 1)"}
C {devices/vdd.sym} 880 -180 0 0 {name=l13 lab=VDD_A}
C {devices/gnd.sym} 880 -40 0 0 {name=l14 lab=GND}
C {devices/gnd.sym} 40 -45 0 0 {name=l15 lab=GND}
C {devices/gnd.sym} 600 -45 0 0 {name=l17 lab=GND}
C {devices/lab_pin.sym} 40 -165 2 0 {name=l18 sig_type=std_logic lab=Anlg_in}
C {devices/lab_pin.sym} 600 -165 0 0 {name=l19 sig_type=std_logic lab=ENB}
C {devices/code.sym} 855 -525 0 0 {name=control only_toplevel=false value="
.control
set nobreak
set num_threads=4
set test_mode = 0
* mode = 0: operation testing				1:  frequency extraction    2:  power consumption
if ($test_mode = 0)
    TRAN 1n 1u
    MEAS TRAN prd_0 TRIG pha_vco_0 VAL=0.8 RISE=10 TARG pha_vco_0 VAL=0.8 RISE=20
    let freq_0 = 10/prd_0
    echo \\"frequency: \\"
    plot clk+2 Anlg_in pha_vco_0 pha_vco_1 pha_vco_2 pha_vco_3 pha_vco_4 
    plot clk+2 Anlg_in ro_0 ro_1 ro_2 ro_3 ro_4 
    print freq_0
end

if ($test_mode = 1)
    let Vlow = 0
    let Vlimit = 1.01     $ set upper bound for sweeping
    let Vsweep = 0.2      $ set step size for sweeping
    let NoPoints=(Vlimit-Vlow)/Vsweep+2    $ set number of points for sweeping
    let freq_0=unitvec(NoPoints)
    let Vin=unitvec(NoPoints)
    let Vin[0]=Vlow
    let ix=0
    while Vin[ix] < Vlimit
        alter Vground DC=Vin[ix]
        TRAN 1n 6u
        MEAS TRAN prd_0 TRIG pha_vco_0 VAL=0.8 RISE=10 TARG pha_vco_0 VAL=0.8 RISE =20
        let freq_0[ix] = 10/prd_0
        let ix = ix+1
        Let Vin[ix] = Vin[ix-1]+Vsweep
    end
   print Vin freq_0
end

if ($test_mode = 2)
    save \\"vdd_a\\" @V_VCO[i] \\"p[0]\\"
    TRAN 1n 6u
    MEAS TRAN I_vco AVG @V_VCO[i] FROM=3u TO=6u
    MEAS TRAN V_vco AVG vdd_a FROM=3u TO=6u
    let Power=I_vco*V_vco
    print Power
end
.endc
"}
C {devices/code.sym} 860 -370 0 0 {name=lib only_toplevel=false value="
** Library on VNU server
.lib /home/dkits/efabless/mpw-5/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.inc /home/dkits/efabless/mpw-5/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/lab_wire.sym} 100 -300 0 0 {name=l1 sig_type=std_logic lab=ENB}
C {devices/lab_wire.sym} 375 -410 0 0 {name=l2 sig_type=std_logic lab=pha_vco_0}
C {devices/code_shown.sym} 1020 -465 0 0 {name=parameter only_toplevel=false value="
.param mc_mm_switch=0
.param L12=1.5
.param Wp12=6
.param Wn12=12
.param L34=1.5
.param Wp34=2
.param Wn34=4
"}
C {devices/lab_wire.sym} 375 -385 0 0 {name=l3 sig_type=std_logic lab=pha_vco_1}
C {devices/lab_wire.sym} 375 -360 0 0 {name=l4 sig_type=std_logic lab=pha_vco_2}
C {devices/lab_wire.sym} 375 -335 0 0 {name=l5 sig_type=std_logic lab=pha_vco_3}
C {devices/lab_wire.sym} 375 -310 0 0 {name=l6 sig_type=std_logic lab=pha_vco_4}
C {devices/lab_wire.sym} 390 -445 0 0 {name=l7 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 260 -115 0 0 {name=Vclk value="DC=0 PULSE(0 1.8 0 0.001n 0.001n 6.2n 12.5n 0)"
*PULSE(0 1.8 0 0.001n 0.001n 1.24n 2.5n)"
*PULSE(0 1.8 0 0.001n 0.001n 6.2n 12.5n 0)"}
C {devices/gnd.sym} 260 -45 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 260 -165 0 0 {name=l9 sig_type=std_logic lab=clk}
C {devices/lab_wire.sym} 740 -410 0 0 {name=l10 sig_type=std_logic lab=ro_0
}
C {devices/lab_wire.sym} 740 -385 0 0 {name=l16 sig_type=std_logic lab=ro_1
}
C {devices/lab_wire.sym} 740 -360 0 0 {name=l20 sig_type=std_logic lab=ro_2
}
C {devices/lab_wire.sym} 740 -335 0 0 {name=l21 sig_type=std_logic lab=ro_3
}
C {devices/lab_wire.sym} 740 -310 0 0 {name=l22 sig_type=std_logic lab=ro_4
}
C {/home/userdata/k63D/toind_63d/work/toi_nd/xschem/lib/ALib_VCO.sym} 120 -340 0 0 {name=Xvco_1 L12=\\"L12\\" Wp12=\\"Wp12\\" Wn12=\\"Wn12\\" L34=\\"L34\\" Wp34=\\"Wp34\\" Wn34=\\"Wn34\\"}
C {/home/userdata/k63D/toind_63d/work/toi_nd/xschem/lib/phase_ro.sym} 540 -385 0 0 {name=x1}
C {devices/vsource.sym} 975 -115 0 0 {name=V_RO value="DC=1.8"}
C {devices/vdd.sym} 975 -185 0 0 {name=l23 lab=VDD_D}
C {devices/gnd.sym} 975 -45 0 0 {name=l24 lab=GND}
C {devices/vdd.sym} 540 -510 0 0 {name=l25 lab=VDD_D}
