clc
clear
fs=1000;
t=0:1/fs:1;
f1=10;
f2=50;
f3=100;
x1=sin(2*pi*f1*t);
x2=sin(2*pi*f2*t);
x3=sin(2*pi*f3*t);
x4=x1+x2+x3;

subplot(3,1,1);
plot(t,x4);
title('Multitone Sine wave (10Hz+50Hz+100Hz)');
xlabel('time');
ylabel('amplitude');

Fx=fft(x4,1024);
N=1024;
k=1:N/2;
f=k*(fs/N);
subplot(3,1,2);
plot(f,abs(Fx(1:512)));
title('Fourier Transform');
xlabel('Frequency');
ylabel('amplitude');

Ix=ifft(abs(Fx(1:N)));
ti=0:1/N:(1-(1/N));% time axis
subplot(3,1,3);
plot(ti,real(Ix));
title(' Time-Domain Signal After IFT');
xlabel('time');
ylabel('amplitude');