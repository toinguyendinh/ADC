clear all;
close all;
clc;

%% input signal
f_input = 1e6;
t_input = 1/f_input;    %period
bw = 3e6;
time = 2e-5;
osr = 32;               %oversampling rate [8-512] nyquist
fs = osr * 2 * bw;
v_pp = 0.4;
t = 0:0.01/fs:time;
v_input = v_pp * sin(2 * pi * f_input * t) + 0.45;

%% wave form of VCO
Vdd = 1;
n = 5;              %n-stage ring
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

%AR_n = ;                 %aspect ratio
%AR_p = ;

t_phl = (Cl*Vdd)/[AR_n*(V_OV_n^2)];     %saturation 
t_plh = (Cl*Vdd)/[AR_p*(V_OV_p^2)];     %saturation

t_d = (t_phl + t_plh)/2;        %time delay of inverter

T_osc = 2*n*t_d;
f_offset = 1/T_osc
%k_vco = ;

P_inv = Cl * (Vdd)^2 * f_offset         %dynamic power dissipation

k_vco = 10e6;           %supply sensitivity
%f_offset = 4e6;         %f osc when input is 0
f_vco = k_vco * v_input + f_offset;

triangle = 0.5*sawtooth(2*pi*50e6*t,0.5) + 0.5;

last = length(t);
out_vco_signal = zeros(n, last);

for i = 1:n
    phase_diff = (360/n)*(i-1)*pi/180;  %phase difference: -pi + pi/N
    out_vco_signal(i, :) = 0.4*sin(2*pi*f_input*t + phase_diff) + 0.45;
    for element = 1:last
        diff = out_vco_signal(i, element) - triangle(element);
        if diff > 0
            pwm(i, element) = 1;
        elseif diff ==0
            pwm(i, element) = 0;
        else
            pwm(i, element) = 0;
        end        
        element = element + t_input;
    end     %for var
end

% data of VCO
phases = zeros(n,1);
i = 1:1:n;				
phases(i) = 0:-1/n:-(n-1)/(n);

i = 2:2:(n-1);
phases(i) = phases(i)-1;
phases = phases + 2;

delta_phase = f_vco*(1/fs);
for i = 1:(last-1)
    phases(:, i+1) = phases(:,i) + delta_phase(i);
end
phases = fix(phases);

%show wave form of output vco
figure(1)
for i = 1:n
    subplot(n, 1, i);
    grid on
    plot(t, pwm(i, :), 'linewidth', 2)
    hold on
    plot(t, out_vco_signal(i, :));
    hold on
    title(['Phase VCO ', num2str(i)]);
    xlabel('Time (s)');
    ylabel('Amplitude');
end

%% write DFF and xor
%{
clk is clk_signal
DFF1: input is pwm
DFF2: input is output of DFF1
xor: input is output of DFF1 and output of DFF2
%}
out_vco = rem(phases, 2);
%clk_signal = 0.5*square(2*pi*fs*t) + 0.5;
i = 1:last;			 
DFF1_values = out_vco(:, i);        % Quantize bit from vco_pulses and saving to DFF1
DFF2_values = DFF1_values(:, i);
%DFF2_values = out_vco(:, i);     	% Load values to DFF2
ROs_values = xor(DFF1_values(:, 2:end) , DFF2_values(:, 1:end-1));     	% Multiphase readout value
sum_quan_bit = sum(ROs_values);     % Summing all Dout_values by an adder tree

%% FFT
size = 2^18;
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

%{
for i = 1:num_inv
    for var = 1:last
        dff1_input = (i, :);
        if clk_signal(var) == 1
            dff1_state = dff1_input;
        end

        if clk_signal(var) == 1
            dff2_sate = dff1_state;
        end
        xor_output(i, :) = xor(dff1_state, dff2_state);
    end
end

add_xor = sum(xor_output);
%}

%{
for i = 1:num_inv
    for var = 1:last
        if (xor_output(i, var) == 1) && (clk_signal(var) == 1)
            xor_new(i, var) = 1;
        else 
            xor_new(i, var) = 0;
        end
        
    end
end

add_xor_new = sum(xor_new);
%}