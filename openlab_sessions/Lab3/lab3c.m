clc
clear
%removing Noise
[Y,fs]=audioread('speech.wav');
n=7;
Ny=fs/2;
begf=700/Ny;
finf=8000/Ny;
[b,a]=butter(n,[begf finf],'bandpass');
X1=filter(b,a,Y);


A=1;% coefficient of Y
B=[1 -.95];% coefficient of X
figure(1);
freqz(B,A)%the freq resp of the filter
title('frequency responce of FIR high pass Filter');
figure(2);
zplane(B,A);%pole and zero plot of system
title('Zplane plot of FIR flter')
X2=filter(B,A,X1);
sound(X2,fs);
N=1024;
k=0:(N-1);
fx=fft(X2,N);
f=k*(fs/N);
figure(3);
plot(f(1:512),abs(fx(1:512)));
title('FFT of noiseless audio signal');

