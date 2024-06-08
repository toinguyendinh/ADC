% MATLAB code for FDC (Frequency-to-Digital Converter) VCO-based quantizer
clear all, close all

%% calculate inverter
Vdd = 1.3;
n = 5;

W_n = 6e-6;
L_n = 1.5e-6;
W_p = 3e-6;
L_p = 1.5e-6;

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
f_offset = 1/T_osc             %freq of VCO when x(t) = 0
%f_offset = 15e6;

%% create signal
V_pp = 0.8;
f_input = 0.5e6;
bw_signal = 2e6;

osr = 2^7       %[64, 128]
fs = osr * 2 * bw_signal;
ts = 1/fs;    		           %sampling rate
time = 2e-5;
t = 0:(0.01*ts):2e-5;
t_simulation = length(t);

input_signal = V_pp * cos(2*pi*f_input*t) + 0.5;

%% create Calibration input signal
R1 = 100;
R2 = 100;
R_equivalent = R2 / (R1 + R2);
V_tune = input_signal * R_equivalent;

%% caculate VCO
K_v = 10e6;         %gain of VCO  |Kv| < f_offset
f_osc_integral = @(t) f_offset + K_v * V_tune;
f_osc = f_offset + K_v * V_tune;
delta_f_osc = f_offset + K_v * V_tune;

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
out_vco = rem(phase, 2);

%% caculate DFF
i = 1:t_simulation;			 
DFF1_values = out_vco(:, i);        % Quantize bit from vco_pulses and saving to DFF1
DFF2_values = DFF1_values(:, i);
%DFF2_values = out_vco(:, i);     	% Load values to DFF2
ROs_values = xor(DFF1_values(:, 2:end) , DFF2_values(:, 1:end-1));     	% Multiphase readout value
sum_quan_bit = sum(ROs_values);     % Summing all Dout_values by an adder tree

sum_quan_bit = sum_quan_bit - 3;
last = length(sum_quan_bit);
sum_bit = zeros(1, last);

for i=1:1:last
    if sum_quan_bit(i) == 1
        sum_bit(i) = 0;
    elseif sum_quan_bit(i) == 2
        sum_bit(i) = 1;
    end
end


%figure(1);
%plot(sum_quan_bit);

%% caculate FFT
size = 2^17;        %18 sua doi cai nay de phu hop voi tan so lay mau va OSR
%size = 2^13;
f = fs * (0 :(size/2)) / size;
fft_input = sum_quan_bit(10 : 10+size);
Y = fft(fft_input);

P2 = abs(Y/size);
P1 = P2(1:size/2+1);
P1(2:end-1) = 2 * P1(2:end-1);
P1(1) = P1(2);
P1_db = 10*log(P1) - max(10*log(P1));

figure(2);
semilogx(f, P1_db);
title('OSR');
xlabel('f (MHz)');
ylabel('|P1(f)| dB');
grid on;
