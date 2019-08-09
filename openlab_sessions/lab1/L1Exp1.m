clc
clear
fs=1000;
t=0:1/fs:1;
fc=10;
x=sin(2*pi*fc*t);

subplot(2,1,1);
plot(t,x);
title('10 Hz sine wave');
xlabel('time');
ylabel('amplitude');

Fx=fft(x,1024);
N=1024;
k=1:N/2;
f=k*(fs/N);
subplot(2,1,2);
plot(f,abs(Fx(1:512)));
title('Fourier Transform');
xlabel('Frequency');
ylabel('amplitude');

