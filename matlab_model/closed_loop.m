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
K_v = 5e6;         %gain of VCO  |Kv| < f_offset
f_osc_integral = @(t) f_offset + K_v * input_signal;     %caculate integral
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
out_vco = rem(phase, 2);

%% caculate DFF
i = 1:t_simulation;			 
DFF1_values = out_vco(:, i);       
DFF2_values = DFF1_values(:, i);
%DFF2_values = out_vco(:, i);    
ROs_values = xor(DFF1_values(:, 2:end) , DFF2_values(:, 1:end-1));     
sum_quan_bit = sum(ROs_values);   

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

%% convert digital to analog
input_signal(end)=[];
sum_bit = sum_bit * V_pp * 2 + 0.2;

new_signal = input_signal - sum_bit;
outer_border = new_signal(new_signal > 0);

%% caculate VCO
phase = zeros(n, 1);
delta_phase = 2*pi*f_osc*ts;

for n=1:5
    phase(n) = (2/5) * n * pi;
end

for i= 1:(length(outer_border))
    phase(:, i+1) = phase(:, i) + delta_phase(i);
end

phase = fix(phase);
out_vco = rem(phase, 2);

%% caculate DFF
i = 1:(length(outer_border));			 
DFF1_values = out_vco(:, i);       
DFF2_values = DFF1_values(:, i);
%DFF2_values = out_vco(:, i);    
ROs_values = xor(DFF1_values(:, 2:end) , DFF2_values(:, 1:end-1));     
sum_quan_bit = sum(ROs_values);   

%% FFT
size = 2^17;
f = fs * (0 :(size/2)) / size;
fft_input = sum_quan_bit(10 : 10+size);
Y = fft(fft_input);

P2 = abs(Y/size);
P1 = P2(1:size/2+1);
P1(2:end-1) = 2 * P1(2:end-1);
P1(1) = P1(2);
P1_db = 10*log(P1) - max(10*log(P1));

figure(3);
semilogx(f, P1_db);
title('OSR');
xlabel('f (MHz)');
ylabel('|P1(f)| dB');
grid on;