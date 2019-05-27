m = csvread('5V - Ripple - 1kHz.csv');
%m = wgn(1200,1,0);
sampleRate = 1/(1e-3);
filtered = lowpass(m, 100, sampleRate);
L = length(m);
Y=fft(filtered);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = sampleRate*(0:(L/2))/L;
plot(f,P1);
figure;
plot(filtered);
figure;
plot(m);
max(abs(filtered))