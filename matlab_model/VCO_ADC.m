close all;
clear all;

%% ----------------- Overall system ----------------
trans_time = 420e-6;  %6 micro-second     %transient time of simulation

Fs = 80e6; % 80 MHz                     %Over sampling frequency of ADC
osr = 20;  % osr = Fs/2ABW              %over sampling rate
t_s = 1:(1/Fs):(trans_time);            %discrete time
length_ts = length(t_s);
div = 80;                               %time division
Fs_dis = Fs*div;                        %sample rate for display
t = 0:(1/Fs_dis):trans_time;            %display continious time range of sumlation
length_t = length(t);

%%  -----------------Input signal Block--------------

%Generating input signal
f1 = 1e6;      % 2 MHz
V_in = 0.4*cos(2*pi*f1*t)+0.7;          %V_in = [0.1 - 0.9]

% Create ideal signal for fft
i = 1:(div*osr):length(V_in);
fft_input_ideal = V_in(i);

%% Voltage-Controlled Oscillator block
nof = 5;                        %Number of phases
K_vco = 29.68e6;   % 75MHz/V       % 
F_offset =  44.56e6;  %7.5 MHz

vco_freq = K_vco*V_in + F_offset;
figure(1);
plot(t, vco_freq);
title('frequency of vco');
xlabel('time simulation');
ylabel('magnitude of frequency');
%saveas(gcf,'VCO_ADC.png');

phases = zeros(nof,1);			%Create array to save phases's values
i = 1:1:nof;				
phases(i) = 0:-1/nof:-(nof-1)/(nof);        % Init value for odd phases

i = 2:2:(nof-1);
phases(i) = phases(i)-1;                	% Init value for even phases
phases = phases + 2;			

delta_phase = vco_freq*(1/Fs_dis);          % Calculating change value of phases in partial time

for i=1:length(t)
    phases(:, i+1) = phases(:,i)+delta_phase(i);		 % Updating phases values to phasee array
end

phases = fix(phases);

%% Multiphase readout + adder tree blocks

%phases = fix(phases);	 	
vco_pulses = rem(phases, 2);        	% Generating Square Pulse from phase values 
i = 1:div:length(t);			 
DFF1_values = vco_pulses(:, i);         % Quantize bit from vco_pulses and saving to DFF1
%DFF2_values = DFF1_values(:, i);
DFF2_values = vco_pulses(:, i);     	% Load values to DFF2
ROs_values = xor(DFF1_values(:, 2:end) , DFF2_values(:, 1:end-1));     	% Multiphase readout value
sum_quan_bit = sum(ROs_values);     	% Summing all Dout_values by an adder tree
%sum_vco_pulse = sum(vco_pulses);

%% Decimation filter
out_sinc3 = decimation(sum_quan_bit, Fs, t_s, osr);

figure(2);
plot (out_sinc3);
title('sinc filter');
xlabel('time');
ylabel('amplitude');

%% FFT signal
%figure(2);
%fft_system = fft_cal(sum_quan_bit, 32768, Fs);

size = 2^15;
f = Fs * (0 :(size/2)) / size;
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

saveas(gcf,'test_FFT.png')

%exit