clear all, close all;

osr = 32;
ntf0 = synthesizeNTF(5, osr, 1);
n = 64*osr;
fbin = 11;
u = 1/2 * sin(2*pi*fbin/N*[0:n-1]);
[v tmp1 tmp2 y] = simulateDSM(u, ntf0);
k = mean(abs(y)/mean(y.^2));
ntf=ntf0/(k+(1-k) * ntf0);

%compute windowed FFT and NBW

w = hann(n); %or ones(1, n) or hann(n).^2
nb = 3;
w1 = norm(w, 1);
w2 = norm(w, 2);
nbw = (w2/w1)^2;
v = fft(w.*v)/(w1/2);

%compute SNR
signal_bins = fbin + [-(nb-1)/2:(nb-1)/2];
inband_bins = 0:n/(2*osr);
noise_bins = setdiff(inband_bins, signal_bins);
snr = dbp(sum(abs(v(signal_bins+1)).^2)/sum(abs(v(nois_bin+1)).^2))

figure(1); clf;
semilogx([1:n/2]/n,dbv(v(2:n/2+1)), 'b', 'linewidth', 1);
hold on;
[f p] = logsmooth(v,fbin,2,nb);
plot(f,p,'m','linewidth',1.5);
sq = 4/3 * evalTF(ntf, exp(2i*pi*f).^2);
plot(f,dbq(sq*nbw),'k--','linewidth',1);
figureMagic([1/n 0.5], [],[],[-140 0],10,2);
