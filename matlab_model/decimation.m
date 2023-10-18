function [out_sinc3] = decimation(sum_bit, Fs, t_s, ovs)
    %integral
    num = [1];
    den = [1 -1];
    Ts = 1/Fs;
    integral = filt(num,den,Ts);
    %comb filter
    num = [0 -1];   
    den = [1];
    Ts = 1/Fs;
    comb = filt(num, den, Ts)^ovs;
    comb = 1-comb;

    sinc1 = integral*comb;         %sinc filter first order
    sinc3 = sinc1^3;               %sinc filter three order 

    output_sinc3 = lsim(sinc3, sum_bit, t_s(1:end));

    i = 1:ovs:length(output_sinc3);
    out_sinc3 = output_sinc3(i);
end