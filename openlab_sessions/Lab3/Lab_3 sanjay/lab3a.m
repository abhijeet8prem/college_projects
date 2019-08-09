%Q1
figure(1);
[Y,fs]=audioread('speech.wav');
sound(Y,fs);
N=1024;
k=0:(N-1);
fx=fft(Y,N);
f=k*(fs/N);
plot(f(1:512),abs(fx(1:512)));
title('FFT of original wave');
ns=0.03*fs;%no of samples in 30ms

%getting the segments
A1=Y(1:(0.06*fs));
figure(5);
X=xcorr(A1);
plot(X);
A2=Y(ns:2*ns);
A3=Y(2*ns:3*ns);
A4=Y(3*ns:4*ns);
A5=Y(4*ns:5*ns);
%
fx1=fft(A1,N);
figure(2);
subplot(2,3,1);
plot(f(1:512),abs(fx1(1:512)));
title('FFT 1');  % freq=5211

fx2=fft(A2,N);
subplot(2,3,2);
plot(f(1:512),abs(fx2(1:512)));
title('FFT 2');   %freq=7450

fx3=fft(A3,N);
subplot(2,3,3);
plot(f(1:512),abs(fx3(1:512)));
title('FFT 3');   %freq=6417

fx4=fft(A4,N);
subplot(2,3,4);
plot(f(1:512),abs(fx4(1:512)));
title('FFT 4');    %freq=6331

fx5=fft(A5,N);
subplot(2,3,5);
plot(f(1:512),abs(fx5(1:512)));
title('FFT 5');     %freq= 6158

SumFreq=[5211 7450 7417 6331 6158];
AvgFreq=mean(SumFreq)