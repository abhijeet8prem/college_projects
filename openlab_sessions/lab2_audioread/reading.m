load handel.mat
file='speech.wav';
[x,fs] = audioread(file);
ts=1/fs;
N=length(x)-1;
t=0:N;% time matrix to store the number of samples
subplot(2,1,1);%ploting waveform
plot(t.*ts,x);
title("waveform");
xlabel("time");
ylabel("amplitude");

audioplayer(y,Fs);%playback the audio file

subplot(2,1,2);
len=256;% lenght of window
window=hann(len);
overlap=len/2;% overlap percentage
nfft=256;%number of fft samples
spectrogram(x,window,overlap,nfft);
title("Spectrograph");