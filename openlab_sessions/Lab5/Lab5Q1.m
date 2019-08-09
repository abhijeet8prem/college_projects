clc
clear
%importng the audio files
[a,fs]=audioread('speech.wav');

%segmenting wave
[A,n,t]=segment(a,fs);
S=A(1,2200:n);
subplot(3,2,1);
plot(S);
title('segmented wave');

len=length(S);

%generating hamming window
h=hamming(len);

%multipling with haming window
for i=1:len
    h(i)=S(i)*h(i,1);
end

subplot(3,2,2);
plot(h);
title('window');

%DFT
N=1024;
k=1:N/2;
f=k*(fs/N);
F=fft(h,N);

subplot(3,2,3);
plot(f(1:512),abs(F(1:512)));
title('DFT');

%findng log
LF=log(F);
subplot(3,2,4);
plot(f(1:512),LF(1:512));
title('LOG');

%idft
s=ifft(LF,N);
subplot(3,2,5);
plot(s(1:512));
title('Cepstrum');

