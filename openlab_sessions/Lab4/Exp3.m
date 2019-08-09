clc
clear
%importng the audio files
[a,fs]=audioread('speech.wav');

%segmenting wave
[A,n,t]=segment(a,fs);
for i=1:t
seg=A(i,1:n);
R=xcorr(seg);

%finding peaks
[pks,locs]=findpeaks(R);
[pk,mloc]=max(pks);
%locaton of first max
loc1=locs(mloc);
%findng location of second max
pks(mloc)=0;
[pk,mloc]=max(pks);
loc2=locs(mloc);

P(i)=loc1-loc2;
PF(i)=1/P(i);
figure(i);
plot(R);
title('Short time ACF');
end
P

mean_P=mean(P)