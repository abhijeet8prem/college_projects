clc
clear
figure(3);
[Y,fs]=audioread('speech.wav');
n=7;
Ny=fs/2;
begf=700/Ny;
finf=8000/Ny;
[b,a]=butter(n,[begf finf],'bandpass');
X=filter(b,a,Y);
sound(X,fs);
N=1024;
k=0:(N-1);
fx=fft(X,N);
f=k*(fs/N);
plot(f(1:512),abs(fx(1:512)));
title('FFT of flter sample');
