clc
clear
Fs = 8000; % Sampling rate of signal
Fc = 3000; % Carrier frequency
t = [0:Fs-1]'/Fs; % Sampling times
s1 = sin(2*pi*1*t);%+2*sin(2*pi*600*t); % Channel 1
%s2 = sin(2*pi*150*t)+2*sin(2*pi*900*t); % Channel 2
x = s1;%[s1,s2]; % Two-channel signal
dev = .5; % Frequency deviation in modulated signal
y = fmmod(x,Fc,Fs,dev); % Modulate both channels.
z = fmdemod(y,Fc,Fs,dev); % Demodulate both channels.
plot(y);

N=1024;
 k=0:(N-1);
fx=fft(y,N);
 f=k*(Fs/N);
 figure(2);
 plot(f(1:512),abs(fx(1:512)));
 title('FFT');
 xlabel('frequency');
 ylabel('ampltude');
