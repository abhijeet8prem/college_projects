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

subplot(2,1,1);
plot(t,x4);
title("Multitone Sine wave (10Hz+50Hz+100Hz)");
xlabel("time");
ylabel("amplitude");

subplot(2,1,2);
len=256;% lenght of window
window=hann(len);
overlap=len/2;% overlap percentage
nfft=256;%number of fft samples
spectrogram(x4,window,overlap,nfft);
title("Spectrograph");