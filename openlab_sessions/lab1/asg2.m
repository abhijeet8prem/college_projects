% assignment_2
clc
clear
%fc=400;
% fs=1000;
% fm=200;
% Kf=.2;
% Bfm=.2;% modulation index
% %q=b*int(cos(2*pi*fm*t1), t1 = 0..1)
% t=0:1/fs:1; 
% %modulating the message
% q=Bfm*1*sin(2*pi*fm*t);
% x1=cos(2*pi*fc*t+q);

Fs = 8000; % Sampling rate of signal
Fc = 3000; % Carrier frequency
t = 0:Fs-1:1; % Sampling times
s1 = sin(2*pi*300*t); % Channel 1
x = sin(2*pi*150*t); % Channel 2
%x = [s1,s2]; % Two-channel signal
dev = 50; % Frequency deviation in modulated signal
y = fmmod(x,Fc,Fs,dev); % Modulate both channels.
%z = fmdemod(y,Fc,Fs,dev); % Demodulate both channels.
%plot(z);



 subplot(2,1,1);
 plot(t,y);
 title('Singletone Wave');
 xlabel('time');
 ylabel('ampltude');
 N=1024;
 k=0:(N-1);
fx=fft(y,N);
 f=k*(Fs/N);
 subplot(2,1,2);
 plot(f(1:512),abs(fx(1:512)));
 title('FFT');
 xlabel('frequency');
 ylabel('ampltude');