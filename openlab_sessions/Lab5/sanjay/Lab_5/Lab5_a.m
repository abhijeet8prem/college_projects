clc;
clear;
figure(1);
[Y,fs]=audioread('speech.wav');
[c]=cepstrum(Y,fs);
% figure(2);
% [A,fs1]=audioread('A.wav');
% cepstrum(A,fs1);
% figure(3);
% [S,fs2]=audioread('S.wav');
% cepstrum(S,fs2);


