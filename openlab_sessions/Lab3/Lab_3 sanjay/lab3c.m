%Pre-processing of Speecch
%Pre-emphasis filtering_2
clc
clear
figure(4);
[Y,fs]=audioread('speech.wav');
a=0.95;
A=1;
B=[1 -a];
freqz(B,A)
title('frequency response of FIR high pass filter');
figure(5);
zplane(B,A)
title('Zplane of FIR');

n=7;
Ny=fs/2;
begf=700/Ny;
finf=8000/Ny;
[b,a]=butter(n,[begf finf],'bandpass');
X=filter(b,a,Y);

figure(6);
Fr=filter(B,A,X);
sound(Fr,fs);
N=1024;
k=0:(N-1);
fx=fft(Fr,N);
f=k*(fs/N);
plot(f(1:512),abs(fx(1:512)));
title('FFT for noisless audio signal');
