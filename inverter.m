clear all;
close all;
clc;
%% parameter
f_input = 1e6;
t_input = 1/f_input;
bw = 2e6;
nyquist = 4e6;
osr = 8;
fs = osr * nyquist;     %32e6
t_fs = 1/fs;
time = 1e-5;
division = 100;
v_pp = 0.4;

t = 0:0.05/fs:time;
%% wave form of VCO
v_signal = v_pp * sin(2 * pi * f_input * t) + 0.45;
k_vco = 10e6;
f_offset = 4e6;
f_vco = k_vco * v_signal + f_offset;

triangle = 0.5*sawtooth(2*pi*50e6*t,0.5) + 0.5;
last = length(t);
num_inv = 5;

v_out_vco = zeros(num_inv, length(t));
for i = 1:num_inv
    phase_shift = (360/num_inv)*(i-1)*pi/180;  % Calculate phase shift
    v_out_vco(i, :) = 0.4*sin(2*pi*f_input*t + phase_shift) + 0.45;  % Generate the sine wave
    for var = 1:last
        diff = v_out_vco(i, var) - triangle(var);
        if diff > 0
            pwm(i, var) = 1;
        elseif diff ==0
            pwm(i, var) = 0;
        else
            pwm(i, var) = 0;
        end        
        var = var + t_input;
    end     %for var
end

%% data of VCO
phases = zeros(num_inv,1);
i = 1:1:num_inv;				
phases(i) = 0:-1/num_inv:-(num_inv-1)/(num_inv);

i = 2:2:(num_inv-1);
phases(i) = phases(i)-1;
phases = phases + 2;

delta_phase = f_vco*(1/fs);
for i = 1:(last-1)
    phases(:, i+1) = phases(:,i) + delta_phase(i);
end
phases = fix(phases);
%% write DFF and xor
%{
clk is clk_signal
DFF1: input is pwm
DFF2: input is output of DFF1
xor: input is output of DFF1 and output of DFF2
%}
out_vco = rem(phases, 2);
dff1_state = 0;
dff2_state = 0;
xor_output = zeros(num_inv, last);
clk_signal = 0.5*square(2*pi*fs*t) + 0.5;
i = 1:last;			 
DFF1_values = out_vco(:, i);         % Quantize bit from vco_pulses and saving to DFF1
%DFF2_values = DFF1_values(:, i);
DFF2_values = out_vco(:, i);     	% Load values to DFF2
ROs_values = xor(DFF1_values(:, 2:end) , DFF2_values(:, 1:end-1));     	% Multiphase readout value
sum_quan_bit = sum(ROs_values);     	% Summing all Dout_values by an adder tree

size = 2^15;
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

%% plot result
%{
figure(1)
for i = 1:num_inv
    subplot(num_inv, 1, i);
    grid on
    plot(t, clk_signal);
    hold on
    plot(t, pwm(i, :), 'linewidth', 2)
    hold on
    plot(t, v_out_vco(i, :));
    hold on
    plot(t, xor_output(i, :));
    hold off
    title(['Phase VCO ', num2str(i)]);
    xlabel('Time (s)');
    ylabel('Amplitude');
end
%}
