% MATLAB code for FDC (Frequency-to-Digital Converter) VCO-based quantizer
clear all, close all

%% calculate inverter
Vdd = 1.8;
n = 5;

W_n = 0.52e-6;
L_n = 0.13e-6;
W_p = 0.78e-6;
L_p = 0.13e-6;

Cl = 10e-9;
V_THO_n = 0.7;
V_THO_p = -0.8;
V_OV_n = Vdd - V_THO_n;         %overdrive voltage
V_OV_p = Vdd + V_THO_p;
AR_n = W_n/L_n;                 %aspect ratio
AR_p = W_p/L_p;

t_PHL = (Cl*Vdd)/[AR_n*(V_OV_n^2)];     %NMOS saturation 
t_PLH = (Cl*Vdd)/[AR_p*(V_OV_p^2)];     %PMOS saturation

t_d = (t_PHL + t_PLH)/2;        %time delay of inverter

T_osc = 2*n*t_d;
f_offset = 1/T_osc;             %freq of VCO when x(t) = 0

%% create signal
V_pp = 0.3;
f_input = 1e6;
bw_signal = 2e6;

osr = 64;       %[8, 512]
fs = osr * 2 * bw_signal;
ts = 1/fs;
time = 2e-5;
t = 0:(0.01*ts):2e-5;
t_simulation = length(t);

input_signal = V_pp * cos(2*pi*f_input*t) + 0.5;

%% caculate VCO
K_v = 10e6;         %gain of VCO  |Kv| < f_offset
f_osc_integral = @(t) f_offset + K_v * input_signal;
f_osc = f_offset + K_v * input_signal;
delta_f_osc = f_offset + K_v * input_signal;

phase = zeros(n, 1);
phase_int = zeros(n, 1);
delta_phase = 2*pi*f_osc*ts;
phase_vco = 2*pi*K_v*V_pp*ts*sin(pi*f_input*ts)*(1/(pi*f_input*ts))* ...
    cos((1/2) * f_input*2*pi*ts*(2-1));

for n=1:5
    phase_int(n) = (2/5) * n * pi;
    phase(n) = phase_int(n) * phase_vco;
end

for i= 1:t_simulation
    phase(:, i+1) = phase(:, i) + delta_phase(i);
end

phase = fix(phase);

%% caculate DFF
out_vco = rem(phase, 2);