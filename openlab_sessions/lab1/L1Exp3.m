clc
clear
fs=1000; %sampling frequency

t1=0:1/fs:0.250;
t2=0.251:1/fs:0.500;
t3=0.501:1/fs:0.750;
t4=0.751:1/fs:1;
t=[t1 t2 t3 t4];

%various frequencies
f1=10;
f2=50;
f3=100;

%generating the signals
x1=sin(2*pi*f1*t1);
x2=sin(2*pi*f1*t2)+sin(2*pi*f2*t2);
x3=sin(2*pi*f1*t3)+sin(2*pi*f2*t3)+sin(2*pi*f3*t3);
x4=sin(2*pi*f1*t4);

%concatination
x5=[x1 x2 x3 x4];

subplot(2,1,1);
plot(t,x5);
title('non-stationary Sine wave');
xlabel('time');
ylabel('amplitude');

Fx=fft(x5,1024);
N=1024;
k=1:N/2;
f=k*(fs/N);
subplot(2,1,2);
plot(f,abs(Fx(1:512)));
title('Fourier Transform');
xlabel('Frequency');
ylabel('amplitude');

